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
	@RequestMapping("member/join.do")
	public String member_join(HttpServletRequest request,HttpServletResponse response)
	{
		request.setAttribute("main_jsp", "../member/join.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("member/idcheck_ok.do")
	public String member_idcheck(HttpServletRequest request,HttpServletResponse response)
	{
		String id=request.getParameter("id");
		int count=MemberDAO.joinIdCheck(id);
		request.setAttribute("count", count);
		return "../member/idcheck_ok.jsp";
	}
	@RequestMapping("member/nncheck_ok.do")
	public String member_nncheck(HttpServletRequest request,HttpServletResponse response)
	{
		String nickname=request.getParameter("nickname");
		int count=MemberDAO.joinNNCheck(nickname);
		request.setAttribute("count", count);
		return "../member/nncheck_ok.jsp";
	}
	@RequestMapping("member/telcheck_ok.do")
	public String member_telcheck(HttpServletRequest request,HttpServletResponse response)
	{
		String tel=request.getParameter("tel");
		int count=MemberDAO.joinTelCheck(tel);
		request.setAttribute("count", count);
		return "../member/telcheck_ok.jsp";
	}
	@RequestMapping("member/emailcheck_ok.do")
	public String member_emailcheck(HttpServletRequest request,HttpServletResponse response)
	{
		String email=request.getParameter("email");
		int count=MemberDAO.joinEmailCheck(email);
		request.setAttribute("count", count);
		return "../member/emailcheck_ok.jsp";
	}
	@RequestMapping("member/join_ok.do")
	public String member_join_ok(HttpServletRequest request,HttpServletResponse response)
	{
		try {
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		String id=request.getParameter("id");
		String pwd=request.getParameter("pwd");
		String nickname=request.getParameter("nickname");
		String name=request.getParameter("name");
		String sex=request.getParameter("sex");
		String birthdate=request.getParameter("birthdate");
		String tel=request.getParameter("tel");
		String email=request.getParameter("email");
		String post=request.getParameter("post");
		String addr1=request.getParameter("addr1");
		String addr2=request.getParameter("addr2");
		
		MemberVO vo=new MemberVO();
		vo.setId(id);
		vo.setPwd(pwd);
		vo.setNickname(nickname);
		vo.setName(name);
		vo.setSex(sex);
		vo.setBirthdate(birthdate);
		vo.setTel(tel);
		vo.setEmail(email);
		vo.setPost(post);
		vo.setAddr1(addr1);
		vo.setAddr2(addr2);
		
		MemberDAO.joinInsert(vo);
		return "redirect:../main/main.do";
	}
}
