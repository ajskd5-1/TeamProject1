package com.sist.vo;
/*
NO                 NUMBER       
R_NO      NOT NULL NUMBER       
R_TYPE             NUMBER       
R_NAME             VARCHAR2(34) 
R_CONTENT          CLOB         
R_REGDATE          DATE         
ID                 VARCHAR2(20)
 * 
 * */
import java.util.*;
public class QnaReplyVO {
	private int no,r_no,r_type;
	private String id,r_name,r_content,dbday;
	private Date r_regdate;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getR_no() {
		return r_no;
	}
	public void setR_no(int r_no) {
		this.r_no = r_no;
	}
	public int getR_type() {
		return r_type;
	}
	public void setR_type(int r_type) {
		this.r_type = r_type;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getR_name() {
		return r_name;
	}
	public void setR_name(String r_name) {
		this.r_name = r_name;
	}
	public String getR_content() {
		return r_content;
	}
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}
	public String getDbday() {
		return dbday;
	}
	public void setDbday(String dbday) {
		this.dbday = dbday;
	}
	public Date getR_regdate() {
		return r_regdate;
	}
	public void setR_regdate(Date r_regdate) {
		this.r_regdate = r_regdate;
	}
}
