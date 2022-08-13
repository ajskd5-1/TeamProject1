package com.sist.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.QnaboardDAO;
import com.sist.vo.QnaBoardVO;

@Controller
public class QnaBoardModel {
	@RequestMapping("qnaboard/list.do")
	public String member_login(HttpServletRequest request,HttpServletResponse response)
	{
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		Map map=new HashMap(); 
		int rowSize=10;
		int start=(curpage*rowSize)-(rowSize-1);
		int end=curpage*rowSize;
		map.put("start", start);
		map.put("end", end);
		
		List<QnaBoardVO> list=QnaboardDAO.qnaboardListData(map);
		int totalpage=QnaboardDAO.qnaboardTotalPage();
		
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("list", list);
		
		request.setAttribute("main_jsp", "../qnaboard/list.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("qnaboard/insert.do")
	public String freeboard_insert(HttpServletRequest request, HttpServletResponse response)
	{
		request.setAttribute("main_jsp", "../qnaboard/insert.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("qnaboard/insert_ok.do")
	public String freeboard_insert_ok(HttpServletRequest request, HttpServletResponse response)
	{
		try
		{
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		String filesize=request.getParameter("filesize");
		String filename=request.getParameter("filename");
		
		QnaBoardVO vo=new QnaBoardVO();
		vo.setTitle(title);
		vo.setContent(content);
		vo.setFilesize(filesize);
		vo.setFilename(filename);

		
		QnaboardDAO.qnaboardInsert(vo);
		return "redirect:../qnaboard/list.do";
	}
	
	
}
