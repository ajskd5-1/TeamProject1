package com.sist.vo;
/*
RE_NO      NOT NULL NUMBER       
RE_MSG     NOT NULL CLOB         
RE_WRITER  NOT NULL VARCHAR2(30) 
RE_REGDATE          DATE         
RE_SCORE            NUMBER       
RE_TNO     NOT NULL NUMBER       
RE_TYPE    NOT NULL NUMBER 
 */
import java.util.*;
public class ReviewVO {
	private int re_no,re_score,re_tno,re_type,dbday,table_name;
	private String re_msg,re_writer;
	private Date re_regdate;
	
	public int getDbday() {
		return dbday;
	}
	public void setDbday(int dbday) {
		this.dbday = dbday;
	}
	public int getTable_name() {
		return table_name;
	}
	public void setTable_name(int table_name) {
		this.table_name = table_name;
	}
	public int getRe_no() {
		return re_no;
	}
	public void setRe_no(int re_no) {
		this.re_no = re_no;
	}
	public int getRe_score() {
		return re_score;
	}
	public void setRe_score(int re_score) {
		this.re_score = re_score;
	}
	public int getRe_tno() {
		return re_tno;
	}
	public void setRe_tno(int re_tno) {
		this.re_tno = re_tno;
	}
	public int getRe_type() {
		return re_type;
	}
	public void setRe_type(int re_type) {
		this.re_type = re_type;
	}
	public String getRe_msg() {
		return re_msg;
	}
	public void setRe_msg(String re_msg) {
		this.re_msg = re_msg;
	}
	public String getRe_writer() {
		return re_writer;
	}
	public void setRe_writer(String re_writer) {
		this.re_writer = re_writer;
	}
	public Date getRe_regdate() {
		return re_regdate;
	}
	public void setRe_regdate(Date re_regdate) {
		this.re_regdate = re_regdate;
	}
	
	
}
