package com.sist.vo;
/*
이름          널?       유형             
----------- -------- -------------- 
VD_NO       NOT NULL NUMBER         
VD_TITLE    NOT NULL VARCHAR2(300)  
VD_SUBTITLE NOT NULL VARCHAR2(200)  
VD_POSTER   NOT NULL VARCHAR2(1000) 
VD_DEADLINE NOT NULL VARCHAR2(100)  
VD_TERM     NOT NULL VARCHAR2(100)  
VD_TIME     NOT NULL VARCHAR2(100)  
VD_BOOK     NOT NULL VARCHAR2(3000) 
VD_PEOPLE   NOT NULL VARCHAR2(100)  
VD_LEVEL    NOT NULL VARCHAR2(100)  
VD_CEND     NOT NULL VARCHAR2(3000) 
VD_INTRO    NOT NULL VARCHAR2(2000) 
VD_LIST     NOT NULL CLOB           
VD_PRICE    NOT NULL NUMBER   
 */
public class VideoVO {
	private int vd_no,vd_price;
	private String vd_title,vd_subtitle,vd_poster,vd_deadline,vd_term,vd_time,
		vd_book,vd_people,vd_level,vd_cend,vd_intro,vd_list;
	public int getVd_no() {
		return vd_no;
	}
	public void setVd_no(int vd_no) {
		this.vd_no = vd_no;
	}
	public int getVd_price() {
		return vd_price;
	}
	public void setVd_price(int vd_price) {
		this.vd_price = vd_price;
	}
	public String getVd_title() {
		return vd_title;
	}
	public void setVd_title(String vd_title) {
		this.vd_title = vd_title;
	}
	public String getVd_subtitle() {
		return vd_subtitle;
	}
	public void setVd_subtitle(String vd_subtitle) {
		this.vd_subtitle = vd_subtitle;
	}
	public String getVd_poster() {
		return vd_poster;
	}
	public void setVd_poster(String vd_poster) {
		this.vd_poster = vd_poster;
	}
	public String getVd_deadline() {
		return vd_deadline;
	}
	public void setVd_deadline(String vd_deadline) {
		this.vd_deadline = vd_deadline;
	}
	public String getVd_term() {
		return vd_term;
	}
	public void setVd_term(String vd_term) {
		this.vd_term = vd_term;
	}
	public String getVd_time() {
		return vd_time;
	}
	public void setVd_time(String vd_time) {
		this.vd_time = vd_time;
	}
	public String getVd_book() {
		return vd_book;
	}
	public void setVd_book(String vd_book) {
		this.vd_book = vd_book;
	}
	public String getVd_people() {
		return vd_people;
	}
	public void setVd_people(String vd_people) {
		this.vd_people = vd_people;
	}
	public String getVd_level() {
		return vd_level;
	}
	public void setVd_level(String vd_level) {
		this.vd_level = vd_level;
	}
	public String getVd_cend() {
		return vd_cend;
	}
	public void setVd_cend(String vd_cend) {
		this.vd_cend = vd_cend;
	}
	public String getVd_intro() {
		return vd_intro;
	}
	public void setVd_intro(String vd_intro) {
		this.vd_intro = vd_intro;
	}
	public String getVd_list() {
		return vd_list;
	}
	public void setVd_list(String vd_list) {
		this.vd_list = vd_list;
	}
	
	
}
