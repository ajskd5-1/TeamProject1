package com.sist.vo;
import java.util.*;
/*
CR_NO       NOT NULL NUMBER         
CR_TITLE    NOT NULL VARCHAR2(100)  
CR_SUBTITLE NOT NULL VARCHAR2(100)  
CR_SUBJECT  NOT NULL VARCHAR2(2000) 
CR_POSTER   NOT NULL VARCHAR2(1000) 
CR_RECIPE   NOT NULL CLOB           
CR_DETAIL   NOT NULL CLOB           
CR_HIT               NUMBER         
CR_WRITER            VARCHAR2(30)   
CR_REGDATE           DATE  
 */
public class RecipeVO {
	private int cr_no,cr_hit;
	private String cr_title,cr_subtitle,cr_subject,cr_poster,cr_recipe,cr_detail,cr_writer,cr_dbday;
	private Date regdate;
	public int getCr_no() {
		return cr_no;
	}
	public void setCr_no(int cr_no) {
		this.cr_no = cr_no;
	}
	public int getCr_hit() {
		return cr_hit;
	}
	public void setCr_hit(int cr_hit) {
		this.cr_hit = cr_hit;
	}
	public String getCr_title() {
		return cr_title;
	}
	public void setCr_title(String cr_title) {
		this.cr_title = cr_title;
	}
	public String getCr_subtitle() {
		return cr_subtitle;
	}
	public void setCr_subtitle(String cr_subtitle) {
		this.cr_subtitle = cr_subtitle;
	}
	public String getCr_subject() {
		return cr_subject;
	}
	public void setCr_subject(String cr_subject) {
		this.cr_subject = cr_subject;
	}
	public String getCr_poster() {
		return cr_poster;
	}
	public void setCr_poster(String cr_poster) {
		this.cr_poster = cr_poster;
	}
	public String getCr_recipe() {
		return cr_recipe;
	}
	public void setCr_recipe(String cr_recipe) {
		this.cr_recipe = cr_recipe;
	}
	public String getCr_detail() {
		return cr_detail;
	}
	public void setCr_detail(String cr_detail) {
		this.cr_detail = cr_detail;
	}
	public String getCr_writer() {
		return cr_writer;
	}
	public void setCr_writer(String cr_writer) {
		this.cr_writer = cr_writer;
	}
	public String getCr_dbday() {
		return cr_dbday;
	}
	public void setCr_dbday(String cr_dbday) {
		this.cr_dbday = cr_dbday;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	
}
