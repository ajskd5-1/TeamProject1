package com.sist.vo;
import java.util.*;
/*
ID        NOT NULL VARCHAR2(20)  
PWD       NOT NULL VARCHAR2(20)  
NAME      NOT NULL VARCHAR2(34)  
NICKNAME  NOT NULL VARCHAR2(30)  
SEX       NOT NULL VARCHAR2(6)   
BIRTHDATE NOT NULL DATE          
EMAIL     NOT NULL VARCHAR2(100) 
POST      NOT NULL VARCHAR2(200) 
ADDR1     NOT NULL VARCHAR2(500) 
ADDR2     NOT NULL VARCHAR2(300) 
TEL       NOT NULL VARCHAR2(30)  
M_ADMIN            VARCHAR2(1)   
M_CONNECT          VARCHAR2(1)   
 */
public class MemberVO {
	private String id,pwd,name,nickname,sex,email,post,addr1,addr2,tel,m_admin,m_connect;
	private Date birthdate;
	private String tel1,tel2,msg;
	public String getTel1() {
		return tel1;
	}
	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}
	public String getTel2() {
		return tel2;
	}
	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getM_admin() {
		return m_admin;
	}
	public void setM_admin(String m_admin) {
		this.m_admin = m_admin;
	}
	public String getM_connect() {
		return m_connect;
	}
	public void setM_connect(String m_connect) {
		this.m_connect = m_connect;
	}
	public Date getBirthdate() {
		return birthdate;
	}
	public void setBirthdate(Date birthdate) {
		this.birthdate = birthdate;
	}
	
}
