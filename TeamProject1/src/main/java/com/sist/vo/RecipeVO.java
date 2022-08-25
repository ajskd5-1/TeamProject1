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
	private int cr_no,cr_hit,cr_cno;
	private String cr_title,cr_subtitle,cr_subject,cr_poster,cr_recipe,cr_detail,cr_writer,cr_dbday;
	private String cr_people,cr_Eing,cr_Sing,cr_img,cr_des;
	private Date cr_regdate;
	
	public int getCr_cno() {
		return cr_cno;
	}
	public void setCr_cno(int cr_cno) {
		this.cr_cno = cr_cno;
	}
	public String getCr_people() {
		return cr_people;
	}
	public void setCr_people(String cr_people) {
		this.cr_people = cr_people;
	}
	public String getCr_Eing() {
		return cr_Eing;
	}
	public void setCr_Eing(String cr_Eing) {
		this.cr_Eing = cr_Eing;
	}
	public String getCr_Sing() {
		return cr_Sing;
	}
	public void setCr_Sing(String cr_Sing) {
		this.cr_Sing = cr_Sing;
	}
	public String getCr_img() {
		return cr_img;
	}
	public void setCr_img(String cr_img) {
		this.cr_img = cr_img;
	}
	public String getCr_des() {
		return cr_des;
	}
	public void setCr_des(String cr_des) {
		this.cr_des = cr_des;
	}
	public Date getCr_regdate() {
		return cr_regdate;
	}
	public void setCr_regdate(Date cr_regdate) {
		this.cr_regdate = cr_regdate;
	}
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

	
	
}
