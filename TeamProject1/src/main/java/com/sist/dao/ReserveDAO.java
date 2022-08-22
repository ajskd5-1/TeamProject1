package com.sist.dao;

import java.io.*;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.sist.vo.*;

public class ReserveDAO {
	private static SqlSessionFactory ssf;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("Config.xml");
			ssf = new SqlSessionFactoryBuilder().build(reader); // 파싱
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 예약하기 <insert id="reserveInsert" parameterType="ReserveVO">
	public static void ReserveInsertData(ReserveVO vo){
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			session.insert("reserveInsert", vo);
		} catch (Exception e) {
			System.out.println("DAO campListData error");
			e.printStackTrace();
		} finally {
			session.close();
		}
		
	}
	
	// 마이페이지에서 출력 예약리스트 <select id="reserveMypageData" resultType="ReserveVO" parameterType="String">
	public static List<ReserveVO> reserveMypageData(String id){
		SqlSession session = null;
		List<ReserveVO> list = null;
		try {
			session = ssf.openSession(true);
			list = session.selectList("reserveMypageData", id);
		} catch (Exception e) {
			System.out.println("DAO campListData error");
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	// 마이페이지에서 출력 예약 상세보기 <select id="reserveMypageDetail" resultType="ReserveVO" parameterType="int">
	public static ReserveVO reserveMypageDetail(int no){
		SqlSession session = null;
		ReserveVO vo = null;
		try {
			session = ssf.openSession(true);
			vo = session.selectOne("reserveMypageDetail", no);
		} catch (Exception e) {
			System.out.println("DAO campListData error");
			e.printStackTrace();
		} finally {
			session.close();
		}
		return vo;
	}
}
