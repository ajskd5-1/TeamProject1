package com.sist.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.RecipeDAO;
import com.sist.vo.RecipeVO;

@Controller
public class RecipeModel {
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
		// 데이터 전송
		request.setAttribute("curppage", curpage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("list", list);
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
	@RequestMapping("recipe/recipe_detail.do")
	public String recipe_detail(HttpServletRequest request,HttpServletResponse response)
	{
		String cr_no=request.getParameter("cr_no");
		RecipeVO vo=RecipeDAO.recipeDetailData(Integer.parseInt(cr_no));
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../recipe/recipe_detail.jsp");
		return "../main/main.jsp";
	}
}