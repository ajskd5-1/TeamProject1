package com.sist.dao;

import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.sist.vo.RecipeVO;
import com.sist.vo.ReviewVO;

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
/* 레시피 리스트*/
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
/* 레시피 총페이지 */
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
/* 레시피 상세보기 */
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
/* 레시피 카테고리 */
	//<select id="recipeCategoryListData" resultType="RecipeVO">
	public static List<RecipeVO> recipeCategoryListData()
	{
		SqlSession session=null;
		List<RecipeVO> list=null;
		try 
		{
			session=ssf.openSession();
			list=session.selectList("recipeCategoryListData");
		}catch(Exception ex)
		{
			System.out.println("recipeCategoryListData : error");
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
/* 리뷰 목록 출력 */	
	//<select id="recipeReviewData" resultType="ReviewVO" parameterType="ReviewVO">
	public static List<ReviewVO> recipeReviewData(ReviewVO re_vo)
	{
		SqlSession session=null;
		List<ReviewVO> list=null;
		try 
		{
			session=ssf.openSession();
			list=session.selectList("recipeReviewData",re_vo);
		}catch(Exception ex)
		{
			System.out.println("recipeReviewData : error");
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
	//<insert id="recipeReviewInsert" parameterType="ReviewVO">
	public static void recipeReviewInsert(ReviewVO vo)
	{
		SqlSession session=null;
		try 
		{
			session=ssf.openSession(true);
			session.insert("recipeReviewInsert",vo);
		}catch(Exception ex)
		{
			System.out.println("recipeReviewInsert : error");
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
	//<delete id="recipeReviewDelete" parameterType="int">
	public static void recipeReviewDelete(int re_no)
	{
		SqlSession session=null;
		try 
		{
			session=ssf.openSession(true);
			session.delete("recipeReviewDelete",re_no);
		}catch(Exception ex)
		{
			System.out.println("recipeReviewDelete : error");
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
	//<update id="recipeReviewUpdate" parameterType="ReviewVO">
	public static void recipeReviewUpdate(ReviewVO vo)
	{
		SqlSession session=null;
		try 
		{
			session=ssf.openSession(true);
			session.update("recipeReviewUpdate",vo);
		}catch(Exception ex)
		{
			System.out.println("recipeReviewUpdate : error");
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
/* 레시피 작성하기 */
	//<insert id="recipeInsert" parameterType="RecipeVO">
	public static void recipeInsert(RecipeVO vo)
	{
		SqlSession session=null;
		try 
		{
			session=ssf.openSession(true);
			session.insert("recipeInsert",vo);
		}catch(Exception ex)
		{
			System.out.println("recipeInsert : error");
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
