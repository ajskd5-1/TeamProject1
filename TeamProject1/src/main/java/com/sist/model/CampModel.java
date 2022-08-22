package com.sist.model;

import java.util.*;

import javax.servlet.http.Cookie;
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
		
		//쿠키
		List<CampVO> cList = new ArrayList<CampVO>();
		Cookie[] cookies = request.getCookies();
		if(cookies != null){
			// 최신 페이지 => 마지막번째 링크부터 출력
			for(int i=cookies.length-1; i>=0; i--){
				if(cookies[i].getName().startsWith("c")){
					// f부터 시작 (detail_before에서 "f" + fno로 줘서 f부터 시작)
					String no = cookies[i].getValue();
					CampVO vo = CampDAO.campDetailData(Integer.parseInt(no));
					cList.add(vo);
				}
			}
		}
		request.setAttribute("cList", cList);
		
		String content = "";
		for(CampVO vo: list) {
			content = vo.getC_content(); 
			/* content = content.substring(0, 100) + "..."; */
			if(content.length() > 120) {
				content = content.substring(0, 120);
				content = content + "...";
			}
			
			vo.setC_content(content);
			
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
	
	//캠핑장 상세보기 전에 쿠키 저장
	@RequestMapping("camp/detail_before.do")
	public String campDetailBefore(HttpServletRequest request, HttpServletResponse response) {
		String cno = request.getParameter("no");
		// key가 중복이 없음 (최신 방문 여러번해도 하나만 뜸)
		Cookie cookie = new Cookie("c" + cno, cno);
		cookie.setPath("/");
		cookie.setMaxAge(60*60*24);
		response.addCookie(cookie);	
		
		return "redirect:../camp/detail.do?no="+cno;
	}
	
	
	// 지도 검색 
	@RequestMapping("camp/map.do")
	public String campFindMap(HttpServletRequest request, HttpServletResponse response) {
		
		request.setAttribute("main_jsp", "../camp/map.jsp");
		return "../main/main.jsp";
	}
	
	// 지도 리스트
	@RequestMapping("camp/map_list.do")
	public String campMapList(HttpServletRequest request, HttpServletResponse response) {
		String title = request.getParameter("title");

		if((title == "서울특별시")||(title == null)) {
			title = "서울특별시|서울";
		} else if(title == "인천광역시") {
			title = "인천광역시|인천";
		} else if(title == "경기도") {
			title = "경기도|경기";
		} else if(title == "강원도") {
			title = "강원도|강원";
		} else if(title == "충청남도") {
			title = "충청남도|충남";
		} else if(title == "세종특별자치시") {
			title = "세종특별자치시|세종";
		} else if(title == "대전광역시") {
			title = "대전광역시|대전";
		} else if(title == "충청북도") {
			title = "충청북도|충북";
		} else if(title == "경상북도") {
			title = "경상북도|경북";
		} else if(title == "전라북도") {
			title = "전라북도|전북";
		} else if(title == "경상남도") {
			title = "경상남도|경남";
		} else if(title == "대구광역시") {
			title = "대구광역시|대구";
		} else if(title == "울산광역시") {
			title = "울산광역시|울산";
		} else if(title == "부산광역시") {
			title = "부산광역시|부산";
		} else if(title == "광주광역시") {
			title = "광주광역시|광주";
		} else if(title == "전라남도") {
			title = "전라남도|전남";
		} else if(title == "제주특별자치도") {
			title = "제주특별자치도|제주";
		}
		
		List<CampVO> list = CampDAO.campMapFind(title);
		
		request.setAttribute("list", list);
		return "../camp/map_list.jsp";
	}
}
