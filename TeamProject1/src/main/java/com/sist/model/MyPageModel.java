package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;
import java.util.*;

@Controller
public class MyPageModel {
	//마이페이지 호출
	@RequestMapping("mypage/mypage.do")
	public String mypage(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main_jsp", "../mypage/mypage.jsp");
		return "../main/main.jsp";
	}
	
	// 마이페이지 홈
	@RequestMapping("mypage/myhome.do")
	public String myhome(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		MemberVO vo = MypageDAO.campVideo(id);
		
		// 최근 예약 내역 한줄
		ReserveVO rvo = new ReserveVO();
		List<ReserveVO> list = ReserveDAO.reserveMypageData(id);
		if(list.size() != 0) {
			rvo.setNo(list.get(0).getNo());
			rvo.setC_title(list.get(0).getC_title());
			rvo.setCin(list.get(0).getCin());
			rvo.setCout(list.get(0).getCout());
			rvo.setInwon(list.get(0).getInwon());
			rvo.setIscheck(list.get(0).getIscheck());
			rvo.setDbday(list.get(0).getDbday().substring(0, list.get(0).getDbday().indexOf("일")+1));
			String title =list.get(0).getC_title();
			String date = rvo.getCin() + " ~ " + rvo.getCout();
			request.setAttribute("rvo", rvo);
			request.setAttribute("date", date);
			request.setAttribute("title", title);

		}
		
		// 최근 결제 내역
		OrderVO ovo = MypageDAO.mypageOrderListData(id);
		if(ovo != null) {
			String addr = ovo.getO_addr1() + ovo.getO_addr2();
			request.setAttribute("ovo", ovo);
			request.setAttribute("addr", addr);
		}
		
		// 내가 쓴 게시글 (미답변) mypageQnaBoardNo
		List<QnaBoardVO> q_list = MypageDAO.mypageQnaBoardNo(id);
		if(q_list.size() != 0) {
			request.setAttribute("q_list", q_list);
		}
		
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
	
	// 결제 내역
	@RequestMapping("mypage/mypage_order.do")
	public String mypage_order(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		List<OrderVO> list = MypageDAO.mypageOrderList(id);
		request.setAttribute("o_list", list);
		request.setAttribute("mypage_jsp", "../mypage/mypage_order.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage.jsp");
		return "../main/main.jsp";
	}
	
	// 결제 상세보기
	@RequestMapping("mypage/order_info.do")
	public String mypage_order_info(HttpServletRequest request, HttpServletResponse response) {
		String no = request.getParameter("no");
		int o_no = Integer.parseInt(no);
		OrderVO vo = MypageDAO.mypageOrderDetailData(Integer.parseInt(no));
		List<CartVO> list = MypageDAO.mypageOrderGoods(o_no);
		for(CartVO cvo : list) {
			System.out.println(cvo.getG_name());
			System.out.println(cvo.getC_account());
			System.out.println(cvo.getG_price());
		}
		request.setAttribute("vo", vo);
		request.setAttribute("list", list);
		return "../mypage/order_info.jsp";
	}

	// 문의사항 리스트
	@RequestMapping("mypage/mypage_qnaboard.do")
	public String mypage_qnaboard(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		List<QnaBoardVO> list = MypageDAO.mypageQnaBoard(id);
		request.setAttribute("list", list);
		request.setAttribute("mypage_jsp", "../mypage/mypage_qnaboard.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage.jsp");
		return "../main/main.jsp";
	}
	
	// 리뷰 목록
	@RequestMapping("mypage/mypage_review.do")
	public String mypage_review(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		List<ReviewVO> r_list = MypageDAO.mypageRecipeReview(id);
		List<ReviewVO> c_list = MypageDAO.mypageCampReview(id);
		List<ReviewVO> g_list = MypageDAO.mypageGoodsReview(id);
		
		request.setAttribute("r_list", r_list);
		request.setAttribute("c_list", c_list);
		request.setAttribute("g_list", g_list);
		request.setAttribute("mypage_jsp", "../mypage/mypage_review.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage.jsp");
		return "../main/main.jsp";
	}
}
