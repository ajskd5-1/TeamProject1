package com.sist.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.vo.*;
import com.sist.dao.*;

@Controller
public class CampModel {
	// 캠핑장 리스트
	@RequestMapping("camp/list.do")
	public String campListData(HttpServletRequest request, HttpServletResponse response) {
		String page = request.getParameter("page");
		if(page == null) {
			page = "1";
		}
		int curpage = Integer.parseInt(page);
		int rowSize = 10;
		int start = (rowSize*curpage)-(rowSize-1); //rownum
		int end = (rowSize*curpage);
		
		// dao 호출 => 총 페이지(dao만들기) 계산 + request로 값 넘기기
		
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		
		List<CampVO> list = CampDAO.campListData(map);
		int totalpage = CampDAO.campTotalPage();
		final int BLOCK = 5;
		int startPage = ((curpage-1)/BLOCK*BLOCK) + 1;
		// [1] [2] [3] [4] [5]  => start = 1, 6, ... / end = 5, 10, ...
		int endPage = ((curpage-1)/BLOCK*BLOCK) + BLOCK;
		if(endPage>totalpage) {
			endPage = totalpage;
		}
		
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("list", list);
		request.setAttribute("main_jsp", "../camp/list.jsp");
		return "../main/main.jsp";
	}
	
	// 캠핑장 상세보기
	@RequestMapping("camp/detail.do")
	public String campDetailData(HttpServletRequest request, HttpServletResponse response) {
		String no = request.getParameter("no");
		CampVO vo = CampDAO.campDetailData(Integer.parseInt(no));
		String info = vo.getC_info();
		if(info.replaceAll("<i class=\"ico_link\"><span class=\"skip\">새창으로</span></i>", " ") != null) {
			info = info.replaceAll("<i class=\"ico_link\"><span class=\"skip\">새창으로</span></i>", " ");
		}
		String etcinfo = vo.getC_etcinfo();
		String etcinfo2 = "";
		if(etcinfo.replaceAll("table_t4 camp_etc_tb", "") != null	) {
			etcinfo = etcinfo.replaceAll("table_t4 camp_etc_tb", "table");
			etcinfo = etcinfo.replaceAll("<br>", "");
		}
		if(etcinfo.indexOf("<strong>")!=-1) {
			etcinfo2 = etcinfo.substring(etcinfo.lastIndexOf("</p>"), etcinfo.length());
			etcinfo = etcinfo.substring(0, etcinfo.indexOf("<strong>"));
			etcinfo = etcinfo + etcinfo2;
			
		}
		
		request.setAttribute("vo", vo);
		request.setAttribute("info", info);
		request.setAttribute("etcinfo", etcinfo);
		request.setAttribute("main_jsp", "../camp/detail.jsp");
		return "../main/main.jsp";
	}
}
