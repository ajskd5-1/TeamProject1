package com.sist.model;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

//장바구니
@Controller
public class ShoppingCartModel {
	@RequestMapping("cart/shoppingcart.do")
	public String cart(HttpServletRequest request,HttpServletResponse response)
	{
		request.setAttribute("main_jsp", "../cart/shoppingcart.jsp");
		return "../main/main.jsp";
	}

//결제하기
@RequestMapping("cart/checkout.do")
public String order(HttpServletRequest request, HttpServletResponse response)
{
	request.setAttribute("main_jsp", "../cart/checkout.jsp");
	return "../main/main.jsp";
}
//결제확인
@RequestMapping("cart/thankyou.do")
public String check(HttpServletRequest request, HttpServletResponse response)
{
	request.setAttribute("main_jsp", "../cart/thankyou.jsp");
	return "../main/main.jsp";
}
}