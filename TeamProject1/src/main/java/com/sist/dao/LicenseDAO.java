package com.sist.dao;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.sist.vo.LicenseVO;

import java.util.*;
import java.io.*;
public class LicenseDAO {
	private static SqlSessionFactory ssf;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("Config.xml");
			ssf = new SqlSessionFactoryBuilder().build(reader); // 파싱
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 자격증 목록 <select id="licenseListData" resultType="LicenseVO" parameterType="hashmap">
	public static List<LicenseVO> licenseListData(Map map){
		SqlSession session = null;
		List<LicenseVO> list = null;
		try {
			session = ssf.openSession();
			list = session.selectList("licenseListData", map);
		} catch (Exception e) {
			System.out.println("DAO licenseListData : error");
			e.printStackTrace();
		} finally {
			if(session != null) {
				session.close();
			}
		}
		return list;
	}
	
	// 자격증 총페이지 <select id="licenseTotalPage" resultType="int">
	public static int licenseTotalPage() {
		int total = 0;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			total = session.selectOne("licenseTotalPage");
		} catch (Exception e) {
			System.out.println("DAO licenseTotalPage error");
			e.printStackTrace();
		} finally {
			if(session != null) {
				session.close();
			}
		}
		return total;
	}
}
