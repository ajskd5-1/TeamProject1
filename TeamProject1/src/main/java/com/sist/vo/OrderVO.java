package com.sist.vo;
import java.util.*;
public class OrderVO {
	private int no, c_no, o_total;
	private String o_name, o_post, o_addr1, o_addr2, o_email, o_tel, o_content, id;
	private Date o_regdate, o_deldate;
	private String dbday1, dbday2;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getC_no() {
		return c_no;
	}
	public void setC_no(int c_no) {
		this.c_no = c_no;
	}
	public String getO_name() {
		return o_name;
	}
	public void setO_name(String o_name) {
		this.o_name = o_name;
	}
	public String getO_post() {
		return o_post;
	}
	public void setO_post(String o_post) {
		this.o_post = o_post;
	}
	public String getO_addr1() {
		return o_addr1;
	}
	public void setO_addr1(String o_addr1) {
		this.o_addr1 = o_addr1;
	}
	public String getO_addr2() {
		return o_addr2;
	}
	public void setO_addr2(String o_addr2) {
		this.o_addr2 = o_addr2;
	}
	public String getO_email() {
		return o_email;
	}
	public void setO_email(String o_email) {
		this.o_email = o_email;
	}
	public String getO_tel() {
		return o_tel;
	}
	public void setO_tel(String o_tel) {
		this.o_tel = o_tel;
	}
	public String getO_content() {
		return o_content;
	}
	public void setO_content(String o_content) {
		this.o_content = o_content;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getO_regdate() {
		return o_regdate;
	}
	public void setO_regdate(Date o_regdate) {
		this.o_regdate = o_regdate;
	}
	public Date getO_deldate() {
		return o_deldate;
	}
	public void setO_deldate(Date o_deldate) {
		this.o_deldate = o_deldate;
	}
	public int getO_total() {
		return o_total;
	}
	public void setO_total(int o_total) {
		this.o_total = o_total;
	}
	public String getDbday1() {
		return dbday1;
	}
	public void setDbday1(String dbday1) {
		this.dbday1 = dbday1;
	}
	public String getDbday2() {
		return dbday2;
	}
	public void setDbday2(String dbday2) {
		this.dbday2 = dbday2;
	}
	
}
