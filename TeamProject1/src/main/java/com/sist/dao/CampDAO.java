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
	
	// 캠핑장 지도 검색 <select id="campMapFind" resultType="CampVO" parameterType="String">
	public static List<CampVO> campMapFind(String title) {
		SqlSession session = null;
		List<CampVO> list = null;
		try {
			session = ssf.openSession();
			list = session.selectList("campMapFind", title);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	
	
/* 리뷰 목록 출력 */	
	//<select id="campReviewData" resultType="ReviewVO" parameterType="ReviewVO">
	public static List<ReviewVO> campReviewData(ReviewVO re_vo)
	{
		SqlSession session=null;
		List<ReviewVO> list=null;
		try 
		{
			session=ssf.openSession();
			list=session.selectList("campReviewData",re_vo);
		}catch(Exception ex)
		{
			System.out.println("campReviewData : error");
			ex.printStackTrace();
		}
		finally
		{
			if(session!=null)
			{
				session.close();
			}
		}
		return list;
	}
/* 리뷰 작성 */
	//<insert id="campReviewInsert" parameterType="ReviewVO">
	public static void campReviewInsert(ReviewVO vo)
	{
		SqlSession session=null;
		try 
		{
			session=ssf.openSession(true);
			session.insert("campReviewInsert",vo);
		}catch(Exception ex)
		{
			System.out.println("campReviewInsert : error");
			ex.printStackTrace();
		}
		finally
		{
			if(session!=null)
			{
				session.close();
			}
		}
	}
/* 리뷰 삭제 */
	//<delete id="campReviewDelete" parameterType="int">
	public static void campReviewDelete(int re_no)
	{
		SqlSession session=null;
		try 
		{
			session=ssf.openSession(true);
			session.delete("campReviewDelete",re_no);
		}catch(Exception ex)
		{
			System.out.println("campReviewDelete : error");
			ex.printStackTrace();
		}
		finally
		{
			if(session!=null)
			{
				session.close();
			}
		}
	}
/* 리뷰 수정 */
	//<update id="campReviewUpdate" parameterType="ReviewVO">
	public static void campReviewUpdate(ReviewVO vo)
	{
		SqlSession session=null;
		try 
		{
			session=ssf.openSession(true);
			session.update("campReviewUpdate",vo);
		}catch(Exception ex)
		{
			System.out.println("campReviewUpdate : error");
			ex.printStackTrace();
		}
		finally
		{
			if(session!=null)
			{
				session.close();
			}
		}
	}
}
