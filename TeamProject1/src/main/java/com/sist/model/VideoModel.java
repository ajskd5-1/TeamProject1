package com.sist.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.VideoDAO;
import com.sist.vo.VideoVO;

@Controller
public class VideoModel {
	// 강의 리스트
	@RequestMapping("video/video_list.do")
	public String video_List(HttpServletRequest request, HttpServletResponse response)
	{
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		
		int curpage=Integer.parseInt(page);
		Map map=new HashMap();
		int rowSize=9;
		int start=(rowSize*curpage)-(rowSize-1);
		int end=curpage*rowSize; 
		
		
		map.put("start", start);
		map.put("end", end);
		
		List<VideoVO> list=VideoDAO.videoDetailListData(map);
		int totalPage=VideoDAO.videoListTotalPage(map);
		final int BLOCK=5;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalPage)
		{
			endPage=totalPage;
		}
		
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("list", list);
		
		request.setAttribute("main_jsp", "../video/video_list.jsp");
		return "../main/main.jsp";
	}
	
	//쿠키 전송해서 상세보기 
	@RequestMapping("video/video_detail_before.do")
	public String video_detail_before(HttpServletRequest request, HttpServletResponse response)
	{
		String vd_no=request.getParameter("vd_no");
		Cookie cookie=new Cookie("video"+vd_no,vd_no);
		cookie.setPath("/");
		cookie.setMaxAge(60*60*24);
		response.addCookie(cookie);
		return "redirect:../video/video_detail.do?vd_no="+vd_no;
	}
	// 강의 상세보기
	@RequestMapping("video/video_detail.do")
	public String video_detail(HttpServletRequest request, HttpServletResponse response)
	{
		String vd_no=request.getParameter("vd_no");
		VideoVO vo=VideoDAO.videoDetailData(Integer.parseInt(vd_no));
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../video/video_detail.jsp");
		return "../main/main.jsp";
	}

	
}








