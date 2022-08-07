package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

@Controller
public class BoardModel {
	@RequestMapping("board/list.do")
	public String member_login(HttpServletRequest request,HttpServletResponse response)
	{
		request.setAttribute("main_jsp", "../board/list.jsp");
		return "../main/main.jsp";
	}
}
