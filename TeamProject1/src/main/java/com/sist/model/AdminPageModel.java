package com.sist.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;

@Controller
public class AdminPageModel {
    @RequestMapping("adminpage/adminpage.do")
    public String adminpage_main(HttpServletRequest request,HttpServletResponse response)
    {
	    request.setAttribute("main_jsp", "../adminpage/adminpage.jsp");
	    return "../main/main.jsp";
    }
    
    @RequestMapping("adminpage/adminhome.do")
    public String adminhome(HttpServletRequest request, HttpServletResponse response) {
		
		request.setAttribute("admin_jsp", "../adminpage/adminhome.jsp");
		request.setAttribute("main_jsp", "../adminpage/adminpage.jsp");
		return "../main/main.jsp";
	}
    
    @RequestMapping("adminpage/reply.do")
	public String adminpage_reply(HttpServletRequest request,HttpServletResponse response)
	{
		/* List<QnaBoardVO> list=QnaboardDAO.qnaboardReplyAdminData(); */
		/* request.setAttribute("list", list); */
		request.setAttribute("admin_jsp", "../adminpage/reply.jsp");
		request.setAttribute("main_jsp", "../adminpage/adminpage.jsp");
		return "../main/main.jsp";
	}
    // 답변 화면 
	@RequestMapping("adminpage/reply_insert.do")
	public String adminpage_reply_insert(HttpServletRequest request,HttpServletResponse response)
	{
		
		 request.setAttribute("admin_jsp", "../adminpage/reply_insert.jsp");
		 request.setAttribute("main_jsp", "../adminpage/adminpage.jsp");
		 return "../main/main.jsp";
	 }
	
	
}
