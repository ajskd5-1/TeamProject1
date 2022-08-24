package com.sist.model;

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
		
		request.setAttribute("adminpage_jsp", "../adminpage/adminhome.jsp");
		request.setAttribute("main_jsp", "../adminpage/adminpage.jsp");
		return "../main/main.jsp";
	}
	
}
