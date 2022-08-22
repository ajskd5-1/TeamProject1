package com.sist.model;

import java.io.*;
import java.net.URLEncoder;
import java.util.HashMap; 
import java.util.List;
import java.util.Map;
import java.util.jar.Attributes.Name;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.*;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.QnaReplyDAO;
import com.sist.dao.QnaboardDAO;
import com.sist.vo.QnaBoardVO;
import com.sist.vo.QnaReplyVO;

import oracle.net.ns.SessionAtts;

@Controller
public class QnaBoardModel {
	// 목록 출력
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
	
	// 상세보기
	@RequestMapping("qnaboard/detail.do")
	public String qnaboard_detail(HttpServletRequest request,HttpServletResponse response)
	{ 
		String no=request.getParameter("no");
		QnaBoardVO vo=QnaboardDAO.qnaboardDetailData(Integer.parseInt(no));
		request.setAttribute("vo", vo);
		
		//
		List<QnaReplyVO> list = QnaReplyDAO.qnareplyListData(Integer.parseInt(no));
		request.setAttribute("list", list);
		request.setAttribute("main_jsp", "../qnaboard/detail.jsp");
		return "../main/main.jsp";
	}
	
	// 게시글 작성
	@RequestMapping("qnaboard/insert.do")
	public String freeboard_insert(HttpServletRequest request, HttpServletResponse response)
	{
		request.setAttribute("main_jsp", "../qnaboard/insert.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("qnaboard/insert_ok.do")
	public String qnaboard_insert_ok(HttpServletRequest request, HttpServletResponse response)
	{
		String path="c:\\download";
		try
		{
			request.setCharacterEncoding("UTF-8");
			File dir=new File(path);
			if(!dir.exists())
			{
				dir.mkdir();
			}
			String enctype="UTF-8";
			int maxsize=1024*1024*100;
			MultipartRequest mr= new MultipartRequest(request,path,maxsize,enctype,new DefaultFileRenamePolicy());

		String name=mr.getParameter("name");
		String title=mr.getParameter("title");
		String content=mr.getParameter("content");
		String filename=mr.getOriginalFileName("upload");
		QnaBoardVO vo=new QnaBoardVO();
		
		vo.setName(name);
		vo.setTitle(title);
		vo.setContent(content);
		if(filename==null)
		{
			vo.setFilename("");
			vo.setFilesize(0);
		}
		else
		{
			File file=new File(path+"\\"+filename);
			vo.setFilename(filename);
			vo.setFilesize((int)file.length());
		}
			QnaboardDAO.qnaboardInsert(vo);
		}
		catch(Exception ex) {}
		return "redirect:../qnaboard/list.do";
	} 	
	
	// 파일 다운로드
	@RequestMapping("qnaboard/download.do") 
	public String qnaboard_download(HttpServletRequest request, HttpServletResponse response) 
	{
		try
		{
    		request.setCharacterEncoding("UTF-8");
    		String fn=request.getParameter("fn");
    		File file=new File("c:\\download\\"+fn);
    		
    		// 다운로드 창을 보여준다 => 실제 데이터값은 아직 안받아옴
    		response.setHeader("Content-Disposition", "attachement;filename="
    						+URLEncoder.encode(fn, "UTF-8"));
    		// 실제 다운로드 
    		BufferedInputStream bis= 
    				new BufferedInputStream(new FileInputStream(file));
    		// 서버에 존재하는 파일 읽기
    		BufferedOutputStream bos=
    			new BufferedOutputStream(response.getOutputStream());
    		int i=0;
    		byte[] buffer=new byte[1024];
    		while((i=bis.read(buffer,0,1024))!=-1)
    		{
    			bos.write(buffer, 0, i);
    		}
/*    		out.clear();
    		out=pageContext.pushBody();*/
    		bis.close();
    		bos.close();
    		
		}
		catch(Exception ex){}
		return "redirect:../qnaboard/detail.do";
		
	}
	
	// 게시글 수정하기
	@RequestMapping("qnaboard/update.do")
	public String qnaboard_update(HttpServletRequest request,HttpServletResponse response)
	{
		 String no=request.getParameter("no");
		 QnaBoardVO vo=QnaboardDAO.qnaboardupdateData(Integer.parseInt(no));
		 request.setAttribute("vo", vo);
		 request.setAttribute("main_jsp", "../qnaboard/update.jsp");
		 return "../main/main.jsp";
	 }
	
	@RequestMapping("qnaboard/update_ok.do")
	public String qnaboard_update_ok(HttpServletRequest request,HttpServletResponse response)
	{
		String path="c:\\download";
		String no = "";
		try
		{
			request.setCharacterEncoding("UTF-8");
			File dir=new File(path);
			if(!dir.exists())
			{
				dir.mkdir();
			}
			String enctype="UTF-8";
			int maxsize=1024*1024*100;
			MultipartRequest mr= new MultipartRequest(request,path,maxsize,enctype,new DefaultFileRenamePolicy());

			String name=mr.getParameter("name");
			String title=mr.getParameter("title");
			String content=mr.getParameter("content");
			String filename=mr.getOriginalFileName("upload");
			no = mr.getParameter("no");
			QnaBoardVO vo=new QnaBoardVO();
			vo.setNo(Integer.parseInt(no));
			vo.setName(name);
			vo.setTitle(title);
			vo.setContent(content);
			if(filename==null)
			{
				vo.setFilename("");
				vo.setFilesize(0);
			}
			else
			{
				File file=new File(path+"\\"+filename);
				vo.setFilename(filename);
				vo.setFilesize((int)file.length());
			}
			QnaboardDAO.qnaboardUpdate(vo);
		}
		catch(Exception ex) {}
		return "redirect:../qnaboard/detail.do?no="+no;
	}
	
	// 게시글 삭제하기
	@RequestMapping("qnaboard/delete.do")
	public String qnaboard_delete(HttpServletRequest request,HttpServletResponse response)
	{
		String no=request.getParameter("no"); String
		result=QnaboardDAO.qnaboardDelete(Integer.parseInt(no));
		request.setAttribute("result", result);
	   return "redirect:../qnaboard/list.do";
	}

}