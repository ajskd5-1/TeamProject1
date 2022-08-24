package com.sist.dao;

import java.io.*;
import java.util.*;
import com.sist.vo.*;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class OrderDAO {
	private static SqlSessionFactory ssf;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("Config.xml");
			ssf = new SqlSessionFactoryBuilder().build(reader); // 파싱
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//<select id="orderMemberData" resultType="MemberVO" parameterType="String">
	public static MemberVO orderMemberData(String id) {
		MemberVO vo = null;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			vo = session.selectOne("orderMemberData", id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return vo;
	}
	
	//<select id="orderCartData" resultType="CartVO" parameterType="String">
	public static List<CartVO> orderCartData(String id){
		List<CartVO> list = null;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			list = session.selectList("orderCartData", id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
}
