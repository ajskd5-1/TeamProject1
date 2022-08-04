package com.sist.vo;
/*
L_NO       NOT NULL NUMBER         
L_NAME     NOT NULL VARCHAR2(50)   
L_INFO     NOT NULL VARCHAR2(100)  
L_INFO2             CLOB           
L_SCHEDULE          VARCHAR2(100)  
L_IMG               VARCHAR2(1000) 
L_CONTENT           CLOB           
L_CNO      NOT NULL NUMBER         
LP_NO      NOT NULL NUMBER 
 */
public class LicenseVO {
	private int l_no, l_cno, lp_no;
	private String l_name, l_info, l_info2, l_schedule, l_img, l_content;
	private String l_cname, lp_poster;
	public int getL_no() {
		return l_no;
	}
	public void setL_no(int l_no) {
		this.l_no = l_no;
	}
	public int getL_cno() {
		return l_cno;
	}
	public void setL_cno(int l_cno) {
		this.l_cno = l_cno;
	}
	public int getLp_no() {
		return lp_no;
	}
	public void setLp_no(int lp_no) {
		this.lp_no = lp_no;
	}
	public String getL_name() {
		return l_name;
	}
	public void setL_name(String l_name) {
		this.l_name = l_name;
	}
	public String getL_info() {
		return l_info;
	}
	public void setL_info(String l_info) {
		this.l_info = l_info;
	}
	public String getL_info2() {
		return l_info2;
	}
	public void setL_info2(String l_info2) {
		this.l_info2 = l_info2;
	}
	public String getL_schedule() {
		return l_schedule;
	}
	public void setL_schedule(String l_schedule) {
		this.l_schedule = l_schedule;
	}
	public String getL_img() {
		return l_img;
	}
	public void setL_img(String l_img) {
		this.l_img = l_img;
	}
	public String getL_content() {
		return l_content;
	}
	public void setL_content(String l_content) {
		this.l_content = l_content;
	}
	public String getL_cname() {
		return l_cname;
	}
	public void setL_cname(String l_cname) {
		this.l_cname = l_cname;
	}
	public String getLp_poster() {
		return lp_poster;
	}
	public void setLp_poster(String lp_poster) {
		this.lp_poster = lp_poster;
	}
	
}
