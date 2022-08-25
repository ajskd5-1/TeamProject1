package com.sist.dao;

import java.io.*;
import java.util.*;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import com.sist.dao.*;
import com.sist.vo.*;

public class MypageDAO {
	private static SqlSessionFactory ssf;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("Config.xml");
			ssf = new SqlSessionFactoryBuilder().build(reader); // 파싱
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 마이페이지 홈 기본 정보
	//<select id="myhomeData" resultType="MemberVO" parameterType="String">
	public static MemberVO campVideo(String id){
		MemberVO vo = null;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			vo = session.selectOne("myhomeData", id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return vo;
	}
	
	// 최근 결제 내역  <select id="mypageOrderListData" resultType="OrderVO" parameterType="String">
	public static OrderVO mypageOrderListData(String id) {
		OrderVO vo = new OrderVO();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			vo = session.selectOne("mypageOrderListData", id);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return vo;
	}
	
	// 결제 내역 리스트 <select id="mypageOrderList" resultType="OrderVO" parameterType="String">
	public static List<OrderVO> mypageOrderList(String id){
		List<OrderVO> list = null;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			list = session.selectList("mypageOrderList", id);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}
	
	// 결제 상세 내역 (장바구니 => 상품 정보) <select id="mypageOrderGoods" resultType="CartVO" parameterType="int">
	public static List<CartVO> mypageOrderGoods(int o_no){
		List<CartVO> list = null;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			list = session.selectList("mypageOrderGoods", o_no);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}
	// 결제 상세내역 수령정보 <select id="mypageOrderDetailData" resultType="OrderVO" parameterType="int">
	public static OrderVO mypageOrderDetailData(int no) {
		OrderVO vo = new OrderVO();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			vo = session.selectOne("mypageOrderDetailData", no);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return vo;
	}
	
	// 문의사항 <select id="mypageQnaBoard" resultType="QnaBoardVO" parameterType="hashmap">
	public static List<QnaBoardVO> mypageQnaBoard(String id){
		List<QnaBoardVO> list = null;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			list = session.selectList("mypageQnaBoard", id);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}
	// 마이페이지 홈 (미답변) <select id="mypageQnaBoardNo" resultType="QnaBoardVO" parameterType="String">
	public static List<QnaBoardVO> mypageQnaBoardNo(String id){
		List<QnaBoardVO> list = null;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			list = session.selectList("mypageQnaBoardNo", id);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

}
