package com.sist.dao;

import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.sist.vo.RecipeVO;

public class RecipeDAO {
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
	//<select id="recipeListData" resultType="RecipeVO" parameterType="hashmap">
	public static List<RecipeVO> recipeListData(Map map)
	{
		SqlSession session=null;
		List<RecipeVO> list=null;
		try 
		{
			session=ssf.openSession();
			list=session.selectList("recipeListData",map);
		}catch(Exception ex)
		{
			System.out.println("recipeListData : error");
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
	//<select id="recipeTotalPage" resultType="int" parameterType="hashmap">
	public static int recipeTotalPage(Map map)
	{
		SqlSession session=null;
		int total=0;
		try 
		{
			session=ssf.openSession();
			total=session.selectOne("recipeTotalPage",map);
		}catch(Exception ex)
		{
			System.out.println("recipeTotalPage : error");
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
	//<select id="recipeDetailData" resultType="RecipeVO" parameterType="int">
	//<update id="recipeHitIncrement" parameterType="int">
	public static RecipeVO recipeDetailData(int cr_no)
	{
		SqlSession session=null;
		RecipeVO vo=null;
		try 
		{
			session=ssf.openSession();
			session.update("recipeHitIncrement",cr_no);
			session.commit();
			vo=session.selectOne("recipeDetailData",cr_no);
		}catch(Exception ex)
		{
			System.out.println("recipeDetailData:error");
			ex.printStackTrace();
		}
		finally
		{
			if(session!=null)
			{
				session.close();
			}
		}
		return vo;
	}
	
}
