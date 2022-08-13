package com.sist.model;

import java.net.http.HttpRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.MemberDAO;
import com.sist.vo.MemberVO;

@Controller
public class MemberModel {
	@RequestMapping("member/login.do")
	public String member_login(HttpServletRequest request,HttpServletResponse response)
	{
		return "../member/login.jsp";
	}
	@RequestMapping("member/login_ok.do")
	public String member_login_ok(HttpServletRequest request,HttpServletResponse response)
	{
		// id,pwd 보내기 
		String id=request.getParameter("id");
		String pwd=request.getParameter("pwd");
		// SQL 연동 
		MemberVO vo=MemberDAO.isLogin(id, pwd);
		String result=vo.getMsg();
		if(result.equals("LOGINOK"))
		{
			HttpSession session=request.getSession();
			session.setAttribute("id", vo.getId());
			session.setAttribute("name", vo.getName());
			session.setAttribute("nickname", vo.getNickname());
			session.setAttribute("m_admin", vo.getM_admin());
		}
		request.setAttribute("result", result);
		return "../member/login_ok.jsp";
	}
	@RequestMapping("member/logout.do")
	public String member_logout(HttpServletRequest request,HttpServletResponse response)
	{
		HttpSession session=request.getSession();
		session.invalidate();
		return "redirect:../main/main.do";
	}
}
