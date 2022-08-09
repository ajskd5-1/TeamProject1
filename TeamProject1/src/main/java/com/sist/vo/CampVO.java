package com.sist.vo;
/*
C_NO      NOT NULL NUMBER         
C_TITLE            VARCHAR2(500)  
C_POSTER           VARCHAR2(2000) 
C_INFO             CLOB           
C_IMGS             CLOB           
C_CONTENT          CLOB           
C_INFO2            CLOB           
C_ETCINFO          CLOB           
C_GALLERY          CLOB           
C_HIT              NUMBER     
C_ADDR             VARCHAR2(500)  
 */
public class CampVO {
	private int no, c_hit;
	private String c_title, c_poster, c_info, c_imgs, c_content, c_info2, c_etcinfo, c_gallery, c_addr;
	
	public String getC_addr() {
		return c_addr;
	}
	public void setC_addr(String c_addr) {
		this.c_addr = c_addr;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getC_hit() {
		return c_hit;
	}
	public void setC_hit(int c_hit) {
		this.c_hit = c_hit;
	}
	public String getC_title() {
		return c_title;
	}
	public void setC_title(String c_title) {
		this.c_title = c_title;
	}
	public String getC_poster() {
		return c_poster;
	}
	public void setC_poster(String c_poster) {
		this.c_poster = c_poster;
	}
	public String getC_info() {
		return c_info;
	}
	public void setC_info(String c_info) {
		this.c_info = c_info;
	}
	public String getC_imgs() {
		return c_imgs;
	}
	public void setC_imgs(String c_imgs) {
		this.c_imgs = c_imgs;
	}
	public String getC_content() {
		return c_content;
	}
	public void setC_content(String c_content) {
		this.c_content = c_content;
	}
	public String getC_info2() {
		return c_info2;
	}
	public void setC_info2(String c_info2) {
		this.c_info2 = c_info2;
	}
	public String getC_etcinfo() {
		return c_etcinfo;
	}
	public void setC_etcinfo(String c_etcinfo) {
		this.c_etcinfo = c_etcinfo;
	}
	public String getC_gallery() {
		return c_gallery;
	}
	public void setC_gallery(String c_gallery) {
		this.c_gallery = c_gallery;
	}
	
}
