package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;
import java.util.*;
import java.text.*;
@Controller
public class ReserveModel {
	@RequestMapping("reserve/reserve.do")
	public String reserve_main(HttpServletRequest request, HttpServletResponse response) {
		String title = request.getParameter("title");
		String no = request.getParameter("no");
		
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-M-d"); // 08 -> 오류
		String today = sdf.format(date); // 오늘 날짜
		
		StringTokenizer st = new StringTokenizer(today, "-");
		String sy = st.nextToken();
		String sm = st.nextToken();
		String sd = st.nextToken(); 
		
		// default
		String strYear = request.getParameter("year");
		if(strYear == null) {
			strYear = sy;
		}
		String strMonth = request.getParameter("month");
		if(strMonth == null) {
			strMonth = sm;
		}
		
		int year = Integer.parseInt(strYear);
		int month = Integer.parseInt(strMonth);
		int day = Integer.parseInt(sd);
		
		request.setAttribute("year", year);
		request.setAttribute("month", month);
		request.setAttribute("day", day);
		
		request.setAttribute("title", title);
		request.setAttribute("no", no);
		return "../reserve/reserve.jsp";
	}
	
	// 달력출력 => 맛집 클릭하면
	@RequestMapping("reserve/reserve_date.do")
	public String reserve_date(HttpServletRequest request, HttpServletResponse response) {
		//String fno = request.getParameter("fno");
		String smonth = request.getParameter("smonth");
		
		String today = new SimpleDateFormat("yyyy-M-d").format(new Date()); // 오늘 날짜 가져오기
		StringTokenizer st = new StringTokenizer(today, "-");
		String strYear = st.nextToken();	
		String strMonth = st.nextToken();
		String strDay = st.nextToken();
		
		int sm1 = Integer.parseInt(strMonth); // 오늘 날짜 달
		int sm2 = 0;
		if(smonth!=null) {
			sm2 = Integer.parseInt(smonth); // 변경된 달
			strMonth = smonth;
		} else if(smonth == null) {
			
		}
		
		int year = Integer.parseInt(strYear);
		int month = Integer.parseInt(strMonth);
		int day = Integer.parseInt(strDay);
		
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.YEAR, year);
		cal.set(Calendar.MONTH, month-1);
		cal.set(Calendar.DATE, 1); // 1일의 요일을 알아야 함
		int week = cal.get(Calendar.DAY_OF_WEEK); // 1일의 요일 가져옴
		int lastday = cal.getActualMaximum(Calendar.DATE); // 마지막 날짜 가져옴(30 / 31 / 28 / 29)
		
		// DAO => 예약이 가능한 날 체크
		
		request.setAttribute("year", year);
		request.setAttribute("month", month);
		request.setAttribute("day", day);
		request.setAttribute("week", week-1);
		request.setAttribute("lastday", lastday);
		String[] strWeek = {"일", "월", "화", "수", "목", "금", "토"};
		request.setAttribute("strWeek", strWeek);
		
		
		int[] days = new int[32];
		for(int d=1; d<=31; d++) {
			if(day <= d) {
				days[d] = 1;
			} else {
				days[d] = 0;
			}
		}
		
		// 선택된 달이 현재 달보다 작으면 예약 못하게 0 현재 달보다 크면 모두 예약 가능하게 1
		if(sm2 != 0) {
			if(sm2 > sm1) {
				for(int d=1; d<=31; d++) {
					days[d] = 1;
				}
			} else if (sm2 < sm1) {
				for(int d=1; d<=31; d++) {
					days[d] = 0;
				}
			}
		}
		
		// 0이면 예약 없는날   1이면 예약 가능한 날    days에 0을 전부 채워 놓고 예약날짜에 해당하는 인덱스를 1로 바꿈
		request.setAttribute("days", days);
		return "../reserve/reserve_date.jsp";
	}
	
	
	// 달력출력 => 맛집 클릭하면
	@RequestMapping("reserve/reserve_date2.do")
	public String reserve_date2(HttpServletRequest request, HttpServletResponse response) {
		String smonth = request.getParameter("smonth"); // 선택된 달 (체크아웃)
		String selD = request.getParameter("day");// 선택된 날짜
		String inmonth = request.getParameter("inmonth"); // 체크인 달
	
		
		String today = new SimpleDateFormat("yyyy-M-d").format(new Date()); // 오늘 날짜 가져오기
		StringTokenizer st = new StringTokenizer(today, "-");
		String strYear = st.nextToken();	
		String strMonth = st.nextToken();
		String strDay = st.nextToken();
		int sm1 = Integer.parseInt(strMonth); // 오늘 날짜 달
		int sm2 = 0;
		if(smonth!=null) {
			sm2 = Integer.parseInt(smonth); // 변경된 달
			strMonth = smonth;
		} else if(smonth == null) {
			
		}
		sm2 = Integer.parseInt(smonth); // 변경된 달
		strMonth = smonth;
		strDay = selD;
		
		int year = Integer.parseInt(strYear);
		int month = Integer.parseInt(strMonth);
		int day = Integer.parseInt(strDay);
		
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.YEAR, year);
		cal.set(Calendar.MONTH, month-1);
		cal.set(Calendar.DATE, 1); // 1일의 요일을 알아야 함
		int week = cal.get(Calendar.DAY_OF_WEEK); // 1일의 요일 가져옴
		int lastday = cal.getActualMaximum(Calendar.DATE); // 마지막 날짜 가져옴(30 / 31 / 28 / 29)
		
		// DAO => 예약이 가능한 날 체크
		
		request.setAttribute("year", year);
		request.setAttribute("month", month);
		request.setAttribute("day", day);
		request.setAttribute("week", week-1);
		request.setAttribute("lastday", lastday);
		String[] strWeek = {"일", "월", "화", "수", "목", "금", "토"};
		request.setAttribute("strWeek", strWeek);
		System.out.println(day);
		
		// 달이 같을때 선택된 일보다 크거나 같은날만 예약 가능
		int[] days = new int[32];
		for(int d=1; d<=31; d++) {
			if(day <= d) {
				days[d] = 1;
			} else {
				days[d] = 0;
			}
		}
		
		// 체크인달보다 선택된 달(체크아웃 달)이 더 작으면 예약불가(0), 더 크면 예약가능(1)
		int in = Integer.parseInt(inmonth);
		if(in < month) {
			for(int d=1; d<=31; d++) {
				days[d] = 1;
			}
		} else if(in > month){
			for(int d=1; d<=31; d++) {
				days[d] = 0;
			}
		}

		
		// 0이면 예약 없는날   1이면 예약 가능한 날    days에 0을 전부 채워 놓고 예약날짜에 해당하는 인덱스를 1로 바꿈
		request.setAttribute("days", days);
		return "../reserve/reserve_date2.jsp";
	}

	// 예약버튼
	@RequestMapping("reserve/reserve_ok.do")
	public String reserve_ok(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {
			// TODO: handle exception
		}
		String fno = request.getParameter("fno");
		String cin = request.getParameter("cin");
		String cout = request.getParameter("cout");
		String inwon = request.getParameter("inwon");
		System.out.println(fno);
		System.out.println(cin);
		System.out.println(cout);
		System.out.println(inwon);
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		ReserveVO vo = new ReserveVO();
		vo.setFno(Integer.parseInt(fno));
		vo.setId(id);
		vo.setCin(cin);
		vo.setCout(cout);
		vo.setInwon(inwon);
		
		ReserveDAO.ReserveInsertData(vo);
		
		return "redirect:../mypage/mypage_reserve.do";
	}
}
