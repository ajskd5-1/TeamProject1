package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

@Controller
public class OrderModel {
	@RequestMapping("order/order.do")
	public String asdf(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main_jsp", "../order/order.jsp");
		return "../main/main.jsp";
	}
}
