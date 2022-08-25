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
	
	// 결제 사용자 정보 가져오기 <select id="orderMemberData" resultType="MemberVO" parameterType="String">
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
	
	// 장바구니 저장된 상품 가져오기 <select id="orderCartData" resultType="CartVO" parameterType="String">
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
	
	// 결제 데이터 저장 & 장바구니에 결제 확인
	//<insert id="orderInsertData" parameterType="OrderVO">
	public static void orderInsertData(OrderVO vo) {
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			session.insert("orderInsertData", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
	}
	
	// 장바구니에 o_no 수정 <update id="orderCartUpdate" parameterType="CartVO"> <select id="orderRecentNo">
	public static void orderCartUpdate(String id) {
		SqlSession session = null;
		int o_no = 0;
		try {
			session = ssf.openSession(true);
			o_no = session.selectOne("orderRecentNo");
			CartVO vo = new CartVO();
			vo.setO_no(o_no);
			vo.setId(id);
			session.update("orderCartUpdate", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
	}
}
