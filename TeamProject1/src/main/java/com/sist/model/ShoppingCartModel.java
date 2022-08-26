package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;
import java.util.*;
//장바구니
@Controller
public class ShoppingCartModel {
	// 장바구니 창
	@RequestMapping("cart/cart_home.do")
	public String cart_home(HttpServletRequest request,HttpServletResponse response) {
		request.setAttribute("main_jsp", "../cart/cart_home.jsp");
		return "../main/main.jsp";
	}
	
	// 장바구니 추가
	@RequestMapping("cart/cart_insert.do")
	public String cart_insert(HttpServletRequest request,HttpServletResponse response) {
		String g_id = request.getParameter("g_id");
		String g_price = request.getParameter("g_price");

		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		CampGoodsVO vo = CartDAO.cartGoodsDetailData(Integer.parseInt(g_id));
		
		String image = vo.getG_image();
		if(image.indexOf(";") != -1) {
			image = image.substring(0, image.indexOf(";"));
		} 
		vo.setG_image(image);
		
		// 장바구니 추가
		CartVO vo1 = new CartVO();
		vo1.setId(id);
		vo1.setC_account(1);
		//vo1.setC_price(vo.getG_price() * vo1.getC_account());
		vo1.setC_price(vo.getG_price());
		vo1.setG_id(Integer.parseInt(g_id));
		vo1.setG_price(vo.getG_price());
		vo1.setG_name(vo.getG_name());
		vo1.setG_image(vo.getG_image());
		
		CartDAO.cartInsertData(vo1);
		
		return "redirect:../cart/cart_home.do";
	}
	
	// 장바구니 리스트
	@RequestMapping("cart/cart_list.do")
	public String cart(HttpServletRequest request,HttpServletResponse response)
	{	
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");

		List<CartVO> list = CartDAO.cartListData(id);
		request.setAttribute("list", list);
		
		int total = 0;
		for(CartVO vo : list) {
			vo.setC_price(vo.getC_account()*vo.getG_price());
			total += vo.getC_price();
		}
		request.setAttribute("total", total);
		return "../cart/cart_list.jsp";
	}

	//결제하기
	@RequestMapping("cart/cart_order.do")
	public String order(HttpServletRequest request, HttpServletResponse response)
	{
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		MemberVO vo = OrderDAO.orderMemberData(id); 
		List<CartVO> list = OrderDAO.orderCartData(id);
		int total = 0;
		for(CartVO cvo : list) {
			total += cvo.getC_price();
		}
		
		request.setAttribute("total", total);
		request.setAttribute("vo", vo);
		request.setAttribute("list", list);
		request.setAttribute("main_jsp", "../cart/cart_order.jsp");
		return "../main/main.jsp";
	}
	
	//결제확인
	@RequestMapping("cart/thankyou.do")
	public void check(HttpServletRequest request, HttpServletResponse response)
	{
		//data:{"o_name":bname, "o_post":bpost, "o_addr1":addr1, "o_addr2":addr2, "o_email":bemail, "o_tel":btel, "o_content":content, "o_total":total}
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		String o_name = request.getParameter("o_name");
		String o_post = request.getParameter("o_post");
		String o_addr1 = request.getParameter("o_addr1");
		String o_addr2 = request.getParameter("o_addr2");
		String o_email = request.getParameter("o_email");
		String o_tel = request.getParameter("o_tel");
		String o_content = request.getParameter("o_content");
		String o_total = request.getParameter("o_total");

		OrderVO vo = new OrderVO();
		vo.setO_name(o_name);
		vo.setO_post(o_post);
		vo.setO_addr1(o_addr1);
		vo.setO_addr2(o_addr2);
		vo.setO_email(o_email);
		vo.setO_tel(o_tel);
		vo.setO_content(o_content);
		vo.setO_total(Integer.parseInt(o_total));
		vo.setId(id);
		OrderDAO.orderInsertData(vo);

		OrderDAO.orderCartUpdate(id);
	}
	
	// 결제 완료 창
	@RequestMapping("cart/order_ok.do")
	public String cart_ok(HttpServletRequest request,HttpServletResponse response) {
		request.setAttribute("main_jsp", "../cart/thankyou.jsp");
		return "../main/main.jsp";
	}
	
	// 장바구니 삭제
	@RequestMapping("cart/cart_delete.do")
	public void cart_delete(HttpServletRequest request,HttpServletResponse response) {
		String g_id = request.getParameter("g_id");
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		CartVO vo = new CartVO();
		vo.setG_id(Integer.parseInt(g_id));
		vo.setId(id);
		CartDAO.cartDeleteDate(vo);
	}
	
	// 수량 수정
	@RequestMapping("cart/cart_update.do")
	public void cart_update(HttpServletRequest request,HttpServletResponse response) {
		String g_id = request.getParameter("g_id");
		String c_account = request.getParameter("c_account");
		String c_price = request.getParameter("c_price");
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");

		CartVO vo = new CartVO();
		vo.setG_id(Integer.parseInt(g_id));
		vo.setId(id);
		vo.setC_account(Integer.parseInt(c_account));
		vo.setC_price(Integer.parseInt(c_price));
		CartDAO.cartUpdate(vo);
	}
	
}