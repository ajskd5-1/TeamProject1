package com.sist.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;

@Controller
public class MainModel {
	@RequestMapping("main/main.do")
	public String main_page(HttpServletRequest request, HttpServletResponse response) {
		Map map=new HashMap();
		 //안전수칙 동영상
		List<CampVideoVO> vd_vo = CampDAO.campVideo();
		List<CampGoodsVO> list=CampGoodsDAO.campgoodsHomeData();
		
		for(CampGoodsVO vo : list) {
			String image = vo.getG_image();
			if(image.indexOf(";") != -1) {
				image = image.substring(0, image.indexOf(";"));
			} 
			vo.setG_image(image);
		}
			
		request.setAttribute("list",list);
		request.setAttribute("vd_vo", vd_vo);
		request.setAttribute("main_jsp", "../main/home.jsp");
		return "../main/main.jsp";
	}
	
}
