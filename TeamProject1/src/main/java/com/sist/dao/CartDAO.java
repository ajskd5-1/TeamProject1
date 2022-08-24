package com.sist.dao;

import java.io.*;
import java.util.*;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import com.sist.vo.*;

public class CartDAO {
	private static SqlSessionFactory ssf;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("Config.xml");
			ssf = new SqlSessionFactoryBuilder().build(reader); // 파싱
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 상품정보 <select id="cartGoodsDetailData" resultType="CampGoodsVO" parameterType="int">
	public static CampGoodsVO cartGoodsDetailData(int g_id) {
		CampGoodsVO vo = null;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			vo = session.selectOne("cartGoodsDetailData", g_id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return vo;
	}
	
	// 장바구니 리스트출력 <select id="cartListData" resultType="CartVO" parameterType="String">
	public static List<CartVO> cartListData(String id){
		List<CartVO> list = null;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			list = session.selectList("cartListData", id);
		} catch (Exception e) {
			System.out.println("DAO cartListData error");
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	
	// 장바구니 추가<insert id="cartInsertData" parameterType="CartVO">
	public static void cartInsertData(CartVO vo){
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			session.insert("cartInsertData", vo);
		} catch (Exception e) {
			System.out.println("DAO cartInsertData error");
			e.printStackTrace();
		} finally {
			session.close();
		}
	}
	
	// 상품 삭제 <delete id="cartDeleteDate" parameterType="CartVO">
	public static void cartDeleteDate(CartVO vo) {
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			session.delete("cartDeleteDate", vo);
		} catch (Exception e) {
			System.out.println("DAO cartDeleteDate error");
			e.printStackTrace();
		} finally {
			session.close();
		}
	}
	
	// 수량 수정 <update id="cartUpdate" parameterType="CartVO">
	public static void cartUpdate(CartVO vo) {
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			session.update("cartUpdate", vo);
		} catch (Exception e) {
			System.out.println("DAO cartUpdate error");
			e.printStackTrace();
		} finally {
			session.close();
		}
	}
	
}
