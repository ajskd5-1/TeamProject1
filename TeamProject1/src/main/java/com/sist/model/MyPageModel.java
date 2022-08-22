package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;
import java.util.*;

@Controller
public class MyPageModel {
	@RequestMapping("mypage/mypage.do")
	public String mypage(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main_jsp", "../mypage/mypage.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("mypage/myhome.do")
	public String myhome(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		MemberVO vo = MypageDAO.campVideo(id);
		request.setAttribute("vo", vo);
		request.setAttribute("mypage_jsp", "../mypage/myhome.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage.jsp");
		return "../main/main.jsp";
	}
	
	//예약내역
	@RequestMapping("mypage/mypage_reserve.do")
	public String mypage_reserve(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		List<ReserveVO> list = ReserveDAO.reserveMypageData(id);
		request.setAttribute("list", list);
		request.setAttribute("mypage_jsp", "../mypage/mypage_reserve.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage.jsp");
		return "../main/main.jsp";
	}
	
	// 예약 상세보기
	@RequestMapping("mypage/reserve_info.do")
	public String mypage_reserve_info(HttpServletRequest request, HttpServletResponse response) {
		String no = request.getParameter("no");
		ReserveVO vo = ReserveDAO.reserveMypageDetail(Integer.parseInt(no));
		request.setAttribute("vo", vo);
		return "../mypage/reserve_info.jsp";
	}
	
}
