package com.sist.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import javax.servlet.http.Cookie;



import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;



//목록
@Controller
public class CampGoodsModel {
	
	private Map map;
	@RequestMapping("campgoods/campgoods_list.do")
	public String cart(HttpServletRequest request,HttpServletResponse response)
	{
	
		//페이지 구하기
		String page = request.getParameter("page");
		if(page == null) {
			page = "1";
		}
		int curpage = Integer.parseInt(page);
		int rowSize = 9;
		int start = (rowSize*curpage)-(rowSize-1); //rownum
		int end = (rowSize*curpage);
		
		// dao 호출 => 총 페이지(dao만들기) 계산 + request로 값 넘기기
		
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		
		
		List<CampGoodsVO> list = CampGoodsDAO.campgoodsListData(map);
		int totalpage = CampGoodsDAO.campgoodsTotalPage(map);
		final int BLOCK = 5;
		int startPage = ((curpage-1)/BLOCK*BLOCK) + 1;
		// [1] [2] [3] [4] [5]  => start = 1, 6, ... / end = 5, 10, ...
		int endPage = ((curpage-1)/BLOCK*BLOCK) + BLOCK;
		if(endPage>totalpage) {
			endPage = totalpage;
		}
		 Cookie[] cookies=request.getCookies();
		   List<CampGoodsVO> cList=new ArrayList<CampGoodsVO>();
		   
		   if(cookies!=null)
		   {
			   
			   for(int i=cookies.length-1;i>=0;i--)
			   {
				   if(cookies[i].getName().startsWith("campgoods"))
				   {
					   
					   String g_id=cookies[i].getValue();
					   CampGoodsVO vo=CampGoodsDAO.campgoodsDetailData(Integer.parseInt(g_id));
					   cList.add(vo);
					   String image = vo.getG_image();
						if(image.indexOf(";") != -1) {
							image = image.substring(0, image.indexOf(";"));
						} 
						vo.setG_image(image);
					   
				   }
			   }
		   }
		
		for(CampGoodsVO vo : list) {
			String image = vo.getG_image();
			if(image.indexOf(";") != -1) {
				image = image.substring(0, image.indexOf(";"));
			} 
			vo.setG_image(image);
		}
		
		
		   request.setAttribute("cList", cList);
		

		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("list", list);
		request.setAttribute("main_jsp", "../campgoods/campgoods_list.jsp");
	
		return "../main/main.jsp";
	
	}
	//메인 슬라이더 목록
	/*
	 *  public static List<CampGoodsVO> campgoodsHomeData(Map map_home)
	    {
	    	List<CampGoodsVO> hlist=null;
	    	SqlSession session=null;
	    	try
	    	{
	    		session=ssf.openSession();
	    		hlist=session.selectList("campgoodsHomeData", map_home);
	    	}catch(Exception ex)
	    	{
	    		ex.printStackTrace();
	    	}
	    	finally
	    	{
	    		if(session!=null)
	    			session.close();
	    	}
	    	return hlist;
	    }
	 */
	 @RequestMapping("main/home.do")
	   public String main_campgoods_list(HttpServletRequest request,HttpServletResponse response, Object list)
	   {
		  
		 
		 
		   request.setAttribute("main_jsp", "../main/home.jsp");// 데이터 출력
		   
		   return "../main/main.jsp";
	   }
	
	 

	@RequestMapping("campgoods/campgoods_detail_before.do")
	public String campgoods_detail_before(HttpServletRequest request,HttpServletResponse response)
	{
		String g_id=request.getParameter("g_id");
		Cookie cookie=new Cookie("campgoods"+g_id, g_id);
		cookie.setPath("/");
		cookie.setMaxAge(60*60*24);
		response.addCookie(cookie);
		CampGoodsDAO.campgoodshit(Integer.parseInt(g_id));
		return "redirect:../campgoods/campgoods_detail.do?g_id="+g_id;
		
	}
	@RequestMapping("campgoods/campgoods_detail.do")
	public String campgoods_detail(HttpServletRequest request,HttpServletResponse response)
	{
		
		String g_id=request.getParameter("g_id");
		CampGoodsVO vo=CampGoodsDAO.campgoodsDetailData(Integer.parseInt(g_id));	
		ReviewVO re_vo=new ReviewVO();
		int type=3; /*<!-- type 1은 레시피예요, jsp 파일에서 넣은 value값 (type 숫자)으로 변경해주세요 -->*/
		re_vo.setRe_tno(Integer.parseInt(g_id));
		re_vo.setRe_type(type);
		List<ReviewVO> list=CampGoodsDAO.campgoodsReviewData(re_vo);
		
		String image = vo.getG_image();
		if(image.indexOf(";") != -1) {
			image = image.substring(0, image.indexOf(";"));
		} 
		vo.setG_image(image);
		request.setAttribute("vo", vo);
		request.setAttribute("list", list);
		request.setAttribute("main_jsp", "../campgoods/campgoods_detail.jsp");
		 JjimVO jvo=new JjimVO();
		   jvo.setG_id(Integer.parseInt(g_id));
		   HttpSession session=request.getSession();
		   String name=(String)session.getAttribute("name");
		   
		   jvo.setName(name);
		   int jcount=0;
		   if(name!=null)
		   {
		     jcount=CampGoodsDAO.campgoodsJjimCount(jvo);
		   }  
		   request.setAttribute("jcount", jcount);
		  
		return "../main/main.jsp";
	}
	
	@RequestMapping("campgoods/campgoods_find.do")
	   public String camp_find(HttpServletRequest request,HttpServletResponse response)
	   {
		   try
		   {
			   request.setCharacterEncoding("UTF-8");
		   }catch(Exception ex) {}
		   String page=request.getParameter("page");
		   if(page==null)
			   page="1";
		   String g_brand=request.getParameter("g_brand");
		   if(g_brand==null)
			   g_brand="";
		   
		   int curpage=Integer.parseInt(page);
		   int rowSize=9;
		   int start=(rowSize*curpage)-(rowSize-1);
		   int end=rowSize*curpage;
		   
		   Map map=new HashMap();
		   map.put("start", start);
		   map.put("end", end);
		   map.put("g_brand", g_brand);
		   
		   List<CampGoodsVO> list=CampGoodsDAO.campgoodsFindData(map);
		   int totalpage=CampGoodsDAO.campgoodsFindTotalPage(g_brand);
		   

			for(CampGoodsVO vo : list) {
				String image = vo.getG_image();
				if(image.indexOf(";") != -1) {
					image = image.substring(0, image.indexOf(";"));
				} 
				vo.setG_image(image);
			}
			
			Cookie[] cookies=request.getCookies();
			   List<CampGoodsVO> cList=new ArrayList<CampGoodsVO>();
			   
			   if(cookies!=null)
			   {
				   
				   for(int i=cookies.length-1;i>=0;i--)
				   {
					   if(cookies[i].getName().startsWith("campgoods"))
					   {
						   
						   String g_id=cookies[i].getValue();
						   CampGoodsVO vo=CampGoodsDAO.campgoodsDetailData(Integer.parseInt(g_id));
						   cList.add(vo);
						   String image = vo.getG_image();
							if(image.indexOf(";") != -1) {
								image = image.substring(0, image.indexOf(";"));
							} 
							vo.setG_image(image);
						   
					   }
				   }
			   }
			
			   request.setAttribute("cList", cList);
				
		   request.setAttribute("curpage", curpage);
		   request.setAttribute("totalpage", totalpage);
		   request.setAttribute("list", list);
		   request.setAttribute("g_brand", g_brand);
		   request.setAttribute("main_jsp", "../campgoods/campgoods_find.jsp");
		   return "../main/main.jsp";
	   }
	
	@RequestMapping("campgoods/jjim.do")
	   public String campgoods_jjim(HttpServletRequest request,HttpServletResponse response)
	   {
		   String g_id=request.getParameter("g_id");
		   HttpSession session=request.getSession();
		   String name=(String)session.getAttribute("name");
		   JjimVO vo=new JjimVO();
		   vo.setG_id(Integer.parseInt(g_id));
		   vo.setName(name);
		   CampGoodsDAO.campgoodsJjimInsert(vo);
		   return "redirect:../campgoods/campgoods_detail.do?g_id="+g_id;
	   }
	 // 마이페이지에서 찜 목록 출력 
	   @RequestMapping("campgoods/jjim_list.do")
	   public String campgoods_jjim_list(HttpServletRequest request,HttpServletResponse response)
	   {
		   HttpSession session=request.getSession();
		   String name=(String)session.getAttribute("name");
		  
		   List<Integer> list=CampGoodsDAO.campgoodsJjimGetg_id(name);
		   
		   
		   List<CampGoodsVO> cList=new ArrayList<CampGoodsVO>();
		   for(int g_id:list)
		   {
			   CampGoodsVO vo=CampGoodsDAO.campgoodsJjimListData(g_id);
			   cList.add(vo);
			   String image = vo.getG_image();
				if(image.indexOf(";") != -1) {
					image = image.substring(0, image.indexOf(";"));
				} 
				vo.setG_image(image);
		   }
		   
		 
		
		   
		   request.setAttribute("cList", cList);
	
		   request.setAttribute("mypage_jsp", "../mypage/jjim_list.jsp");
		   request.setAttribute("main_jsp", "../mypage/mypage.jsp");
		   return "../main/main.jsp";
		   
		   
	   }
	   // 찜 취소 
	   @RequestMapping("campgoods/jjim_cancel.do")
	   public String campgoods_jjim_cancel(HttpServletRequest request,HttpServletResponse response)
	   {
		   String g_id=request.getParameter("g_id");
		   HttpSession session=request.getSession();
		   String name=(String)session.getAttribute("name");
		   JjimVO vo=new JjimVO();
		   vo.setName(name);
		   vo.setG_id(Integer.parseInt(g_id));
		   // DAO연동
		   CampGoodsDAO.campgoodsJjimDelete(vo);
		   return "redirect:../campgoods/jjim_list.do";
	   }
	   
	   /* 리뷰 작성 */
		@RequestMapping("campgoods/campgoods_review_ok.do")
		public String campgoods_review_ok(HttpServletRequest request,HttpServletResponse response)
		{
			try {
				request.setCharacterEncoding("UTF-8");
			}catch(Exception ex) {}
			/* 데이터 가져오기 */
			HttpSession session=request.getSession();
			String re_writer=(String)session.getAttribute("id");
			String re_msg=request.getParameter("re_msg");
			String re_score=request.getParameter("re_score");
			String re_tno=request.getParameter("re_tno");
			String re_type=request.getParameter("re_type");
			/* 데이터 넣기 */
			ReviewVO vo=new ReviewVO();
			vo.setRe_writer(re_writer);
			vo.setRe_msg(re_msg);
			vo.setRe_score(Integer.parseInt(re_score));
			vo.setRe_tno(Integer.parseInt(re_tno));
			vo.setRe_type(Integer.parseInt(re_type));
			CampGoodsDAO.campgoodsReviewInsert(vo);
			return "redirect:../campgoods/campgoods_detail.do?g_id="+re_tno;
		}
	/* 리뷰 삭제 */
		@RequestMapping("campgoods/campgoods_review_delete.do")
		public String campgoods_review_delete(HttpServletRequest request,HttpServletResponse response)
		{
			String re_no=request.getParameter("re_no");
			String g_id=request.getParameter("g_id");
			CampGoodsDAO.campgoodsReviewDelete(Integer.parseInt(re_no));
			return "redirect:../campgoods/campgoods_detail.do?g_id="+g_id;
		}
	/* 리뷰 수정 */
		@RequestMapping("campgoods/campgoods_review_update.do")
		public String campgoods_review_update(HttpServletRequest request,HttpServletResponse response)
		{
			try {
				request.setCharacterEncoding("UTF-8");
			}catch(Exception ex) {}
			String re_no=request.getParameter("re_no");
			String g_id=request.getParameter("g_id");
			String re_msg=request.getParameter("update_msg");
			ReviewVO vo=new ReviewVO();
			vo.setRe_no(Integer.parseInt(re_no));
			vo.setRe_msg(re_msg);
			CampGoodsDAO.campgoodsReviewUpdate(vo);		
			return "redirect:../campgoods/campgoods_detail.do?g_id="+g_id;
		}
	   
	  

}