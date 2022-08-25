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
import com.sist.dao.RecipeDAO;
import com.sist.vo.RecipeVO;
import com.sist.vo.ReviewVO;

@Controller
public class RecipeModel {
/* 레시피 */	
	//레시피 목록 출력
	@RequestMapping("recipe/recipe_list.do")
	public String recipe_list(HttpServletRequest request,HttpServletResponse response)
	{	//페이지 구하기
		String page=request.getParameter("page");
		if(page==null)
			
		page="1";
		int curpage=Integer.parseInt(page);
		int rowSize=9;
		int start=(rowSize*curpage)-(rowSize-1);
		int end=rowSize*curpage;
		
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		List<RecipeVO> list=RecipeDAO.recipeListData(map);
		//페이지 블럭 설정
		int totalPage=RecipeDAO.recipeTotalPage(map);
		final int BLOCK=5;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalPage)
		{
			endPage=totalPage;
		}
		
		// 쿠키에용해서 최근 본 레시피 
		List<RecipeVO> cList=new ArrayList<RecipeVO>();
		Cookie[] cookies=request.getCookies();
		if(cookies !=null) {
			for(int i=cookies.length-1; i>=0; i--) {
				//recipe_detail_before cr_no~
				if(cookies[i].getName().startsWith("cr")) {
					String no=cookies[i].getValue();
					RecipeVO vo=RecipeDAO.recipeDetailData(Integer.parseInt(no));
					cList.add(vo);
				}
			}
		}
		// 데이터 전송
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("list", list);
		request.setAttribute("cList", cList);
		request.setAttribute("main_jsp", "../recipe/recipe_list.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("recipe/recipe_detail_before.do")
	public String recipe_detail_before(HttpServletRequest request,HttpServletResponse response)
	{
		String cr_no=request.getParameter("cr_no");
		Cookie cookie=new Cookie("cr_no"+cr_no, cr_no);
		cookie.setPath("/");
		cookie.setMaxAge(60*60*24);
		response.addCookie(cookie);
		return "redirect:../recipe/recipe_detail.do?cr_no="+cr_no;
		
	}
/* 상세보기 */	
	@RequestMapping("recipe/recipe_detail.do")
	public String recipe_detail(HttpServletRequest request,HttpServletResponse response)
	{
		String cr_no=request.getParameter("cr_no");
		RecipeVO vo=RecipeDAO.recipeDetailData(Integer.parseInt(cr_no));
/* 리뷰 */
		ReviewVO re_vo=new ReviewVO();
		int type=1; /*<!-- type 1은 레시피예요, jsp 파일에서 넣은 value값 (type 숫자)으로 변경해주세요 -->*/
		re_vo.setRe_tno(Integer.parseInt(cr_no));
		re_vo.setRe_type(type);
		List<ReviewVO> list=RecipeDAO.recipeReviewData(re_vo);
		request.setAttribute("list", list);
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../recipe/recipe_detail.jsp");
		return "../main/main.jsp";
	}
/* 리뷰 작성 */
	@RequestMapping("recipe/recipe_review_ok.do")
	public String recipe_review_ok(HttpServletRequest request,HttpServletResponse response)
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
		RecipeDAO.recipeReviewInsert(vo);
		return "redirect:../recipe/recipe_detail.do?cr_no="+re_tno;
	}
/* 리뷰 삭제 */
	@RequestMapping("recipe/recipe_review_delete.do")
	public String recipe_review_delete(HttpServletRequest request,HttpServletResponse response)
	{
		String re_no=request.getParameter("re_no");
		String cr_no=request.getParameter("cr_no");
		RecipeDAO.recipeReviewDelete(Integer.parseInt(re_no));
		return "redirect:../recipe/recipe_detail.do?cr_no="+cr_no;
	}
/* 리뷰 수정 */
	@RequestMapping("recipe/recipe_review_update.do")
	public String recipe_review_update(HttpServletRequest request,HttpServletResponse response)
	{
		try {
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		String re_no=request.getParameter("re_no");
		String cr_no=request.getParameter("cr_no");
		String re_msg=request.getParameter("update_msg");
		ReviewVO vo=new ReviewVO();
		vo.setRe_no(Integer.parseInt(re_no));
		vo.setRe_msg(re_msg);
		RecipeDAO.recipeReviewUpdate(vo);		
		return "redirect:../recipe/recipe_detail.do?cr_no="+cr_no;
	}
/* 카테고리별 레시피*/
	@RequestMapping("recipe/recipe_category.do")
	public String recipe_category(HttpServletRequest request,HttpServletResponse response)
	{
		List<RecipeVO> list=RecipeDAO.recipeCategoryListData();
		request.setAttribute("list", list);
		request.setAttribute("main_jsp", "../recipe/recipe_calist.jsp");
		return "../main/main.jsp";
	}
/* 레시피 작성 */
	@RequestMapping("recipe/recipe_insert.do")
	public String recipe_insert(HttpServletRequest request,HttpServletResponse response)
	{
		request.setAttribute("main_jsp", "../recipe/recipe_insert.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("recipe/recipe_insert_ok.do")
	public String recipe_insert_ok(HttpServletRequest request,HttpServletResponse response)
	{
		try {
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		HttpSession session=request.getSession();
		String cr_writer=(String)session.getAttribute("id");
		String cr_title=request.getParameter("cr_title");
		String cr_subtitle=request.getParameter("cr_subtitle");
		String cr_subject=request.getParameter("cr_subject");
		String cr_poster=request.getParameter("cr_poster");
		String cr_people=request.getParameter("cr_people");
		String cr_Eing=request.getParameter("cr_Eing");
		String cr_Sing=request.getParameter("cr_Sing");
		String cr_img=request.getParameter("cr_img");
		String cr_des=request.getParameter("cr_des");
		
		String cr_recipe="<div class=\"rec_mate\"> "
				+ " <div class=\"mate_title clr\">"
				+ "   재료<span class=\"text_o\"><img src=\"https://2bob.co.kr/skin/nodskin_argio/images/icon_rec_orange.jpg\" alt=\"\">"+cr_people+"인분</span>  "
				+ " </div> "
				+ " <div class=\"text_box\"> "
				+ "  <h3 class=\"s_title\">필수재료</h3> "
				+ "  <p class=\"mate_list\">"+cr_Eing+"</p> "
				+ " </div> "
				+ " <div class=\"text_box\"> "
				+ "  <h3 class=\"s_title\">선택 재료</h3> "
				+ "  <p class=\"mate_list\">"+cr_Sing+"</p> "
				+ " </div> "
				+ "";
		
		String cr_detail="<div class=\"con_box img_s\">"
				+ " <!-- 이미지 두개일 경우 img_d ---> "
				+ " <div class=\"img_box clr\"> "+cr_img+"</div>"
				+ " <div class=\"text_wrap clr\"> "
				+ "  <div class=\"num\">"
				+ "   1"
				+ "  </div> "
				+ "  <div class=\"text_box\"> "
				+ "   <div class=\"text_exp\">"+cr_des+"</div>"
				+ "  </div> "
				+ " </div> "
				+ "</div>"
				+ "";
		
		RecipeVO vo=new RecipeVO();
		vo.setCr_writer(cr_writer);
		vo.setCr_title(cr_title);
		vo.setCr_subtitle(cr_subtitle);
		vo.setCr_subject(cr_subject);
		vo.setCr_poster(cr_poster);
		vo.setCr_recipe(cr_recipe);
		vo.setCr_detail(cr_detail);
		
		RecipeDAO.recipeInsert(vo);
		return "redirect:../recipe/recipe_list.do";
	}
}
