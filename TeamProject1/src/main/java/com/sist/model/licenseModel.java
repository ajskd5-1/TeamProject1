package com.sist.model;

import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.LicenseDAO;
import com.sist.vo.LicenseVO;

@Controller
public class licenseModel {
	@RequestMapping("license/license_list.do")
	public String license_list(HttpServletRequest request, HttpServletResponse response) {
		String page = request.getParameter("page");
		if(page == null) {
			page = "1";
		}
		int curpage = Integer.parseInt(page);
		int rowSize = 16;
		int start = (rowSize*curpage)-(rowSize-1); //rownum
		int end = (rowSize*curpage);
		
		// dao 호출 => 총 페이지(dao만들기) 계산 + request로 값 넘기기
		
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		
		List<LicenseVO> list = LicenseDAO.licenseListData(map);
		int totalpage = LicenseDAO.licenseTotalPage();
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
		request.setAttribute("main_jsp", "../license/license_list.jsp");
		return "../main/main.jsp";
	}
}
