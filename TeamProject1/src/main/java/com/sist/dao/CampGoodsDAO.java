package com.sist.dao;

import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.sist.vo.CampGoodsVO;

public class CampGoodsDAO {
	private static SqlSessionFactory ssf;
	static 
	{
		try {
			Reader reader=Resources.getResourceAsReader("Config.xml");
			ssf=new SqlSessionFactoryBuilder().build(reader);
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}
	//<select id="campgoodsListData" resultType="CampGoodsVO" parameterType="hashmap">
	public static List<CampGoodsVO> campgoodsListData(Map map)
	{
		SqlSession session=null;
		List<CampGoodsVO> list=null;
		try 
		{
			session=ssf.openSession();
			list=session.selectList("campgoodsListData",map);
		}catch(Exception ex)
		{
			System.out.println("campgoodsListData : error");
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
	//<select id="campgoodsTotalPage" resultType="int" parameterType="hashmap">
	public static int campgoodsTotalPage(Map map)
	{
		SqlSession session=null;
		int total=0;
		try 
		{
			session=ssf.openSession();
			total=session.selectOne("campgoodsTotalPage",map);
		}catch(Exception ex)
		{
			System.out.println("campgoodsTotalPage : error");
			ex.printStackTrace();
		}
		finally
		{
			if(session!=null)
			{
				session.close();
			}
		}
		return total;
	}

}
