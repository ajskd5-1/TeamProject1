package com.sist.dao;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import com.sist.dao.*;
import com.sist.vo.*;
import java.util.*;
public class CampDAO {
	private static SqlSessionFactory ssf;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("Config.xml");
			ssf = new SqlSessionFactoryBuilder().build(reader); // 파싱
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 캠핑장 리스트출력 <select id="campListData" resultType="CampVO" parameterType="hashmap">
	public static List<CampVO> campListData(Map map){
		List<CampVO> list = null;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			list = session.selectList("campListData", map);
		} catch (Exception e) {
			System.out.println("DAO campListData error");
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	
	// 캠핑장 총페이지 <select id="campTotalPage" resultType="int">
	public static int campTotalPage() {
		int total = 0;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			total = session.selectOne("campTotalPage");
		} catch (Exception e) {
			System.out.println("DAO campTotalPage error");
			e.printStackTrace();
		} finally {
			if(session != null) {
				session.close();
			}
		}
		return total;
	}
	
	
	// 안전수칙 동영상 <select id="campVideo" resultType="CampVideoVO">
	public static List<CampVideoVO> campVideo(){
		List<CampVideoVO> list = null;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			list = session.selectList("campVideo");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	
	// 캠핑장 상세보기
	// <select id="campDetailData" resultType="CampVO" parameterType="int">  조회수 증가 <update id="campHitIncrement" parameterType="int">
	public static CampVO campDetailData(int no) {
		SqlSession session = null;
		CampVO vo = new CampVO();
		try {
			session = ssf.openSession();
			session.update("campHitIncrement", no);
			vo = session.selectOne("campDetailData", no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return vo;
	}
}
