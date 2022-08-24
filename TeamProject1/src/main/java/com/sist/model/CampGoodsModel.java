package com.sist.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import com.sist.dao.CampGoodsDAO;

import com.sist.vo.CampGoodsVO;

import com.sist.vo.JjimVO;

import javax.servlet.http.Cookie;



import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;



//목록
@Controller
public class CampGoodsModel {
	
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
	
	 

	@RequestMapping("campgoods/campgoods_detail_before.do")
	public String campgoods_detail_before(HttpServletRequest request,HttpServletResponse response)
	{
		String g_id=request.getParameter("g_id");
		Cookie cookie=new Cookie("campgoods"+g_id, g_id);
		cookie.setPath("/");
		cookie.setMaxAge(60*60*24);
		response.addCookie(cookie);
		return "redirect:../campgoods/campgoods_detail.do?g_id="+g_id;
		
	}
	@RequestMapping("campgoods/campgoods_detail.do")
	public String campgoods_detail(HttpServletRequest request,HttpServletResponse response)
	{
		
		String g_id=request.getParameter("g_id");
		CampGoodsVO vo=CampGoodsDAO.campgoodsDetailData(Integer.parseInt(g_id));	
		String image = vo.getG_image();
		if(image.indexOf(";") != -1) {
			image = image.substring(0, image.indexOf(";"));
		} 
		vo.setG_image(image);
		request.setAttribute("vo", vo);
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
			   g_brand="스노우피크";
		   
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

}