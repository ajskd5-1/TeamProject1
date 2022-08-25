package com.sist.dao;

import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.sist.vo.CampGoodsVO;

import com.sist.vo.JjimVO;
import com.sist.vo.ReviewVO;




//파싱
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
//목록 출력
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
	
	//메인슬라이더 목록 출력
	//<select id="campgoodsHomeData" resultType="CampGoodsVO" parameterType="hashmap">
	 public static List<CampGoodsVO> campgoodsHomeData()
	    {
	    	List<CampGoodsVO> list=null;
	    	SqlSession session=null;
	    	try
	    	{
	    		session=ssf.openSession();
	    		list=session.selectList("campgoodsHomeData");
	    	}catch(Exception ex)
	    	{
	    		ex.printStackTrace();
	    	}
	    	finally
	    	{
	    		if(session!=null)
	    			session.close();
	    	}
	    	return list;
	    }

//페이지 출력
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
// 상세보기 출력
//	<select id="campgoodsDetailData" resultType="CampGoodsVO" parameterType="int">
		public static CampGoodsVO campgoodsDetailData(int g_id)
		{
			SqlSession session=null;
			CampGoodsVO vo=null;
			try 
			{
				session=ssf.openSession();
				vo=session.selectOne("campgoodsDetailData",g_id);
			}catch(Exception ex)
			{
				System.out.println("campgoodsDetailData:error");
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
// 검색
		 public static List<CampGoodsVO> campgoodsFindData(Map map)
		   {
			   List<CampGoodsVO> list=null;
			   SqlSession session=null;
			   try
			   {
				   session=ssf.openSession();
				   list=session.selectList("campgoodsFindData", map);
			   }catch(Exception ex)
			   {
				   ex.printStackTrace();
			   }
			   finally
			   {
				   if(session!=null)
					   session.close();
			   }
			   return list;
		   }
		   
		   public static int campgoodsFindTotalPage(String g_brand)
		   {
			   int total=0;
			   SqlSession session=null;
			   try
			   {
				   session=ssf.openSession();
				   total=session.selectOne("campgoodsFindTotalPage", g_brand);
			   }catch(Exception ex)
			   {
				   ex.printStackTrace();
			   }
			   finally
			   {
				   if(session!=null)
					   session.close();
			   }
			   return total;
		   }
		   
		   //찜하기
		   public static void campgoodsJjimInsert(JjimVO vo)
		   {
			   SqlSession session=null;
			   try
			   {
				   session=ssf.openSession(true);
				   session.insert("campgoodsJjimInsert",vo);
			   }catch(Exception ex)
			   {
				   ex.printStackTrace();
			   }
			   finally
			   {
				   if(session!=null)
					   session.close();
			   }
		   }
		   public static int campgoodsJjimCount(JjimVO vo)
		   {
			   int count=0;
			   SqlSession session=null;
			   try
			   {
				   session=ssf.openSession();
				   count=session.selectOne("campgoodsJjimCount", vo);
			   }catch(Exception ex)
			   {
				   ex.printStackTrace();
			   }
			   finally
			   {
				   if(session!=null)
					   session.close();
			   }
			   return count;
		   }
		  
		   public static CampGoodsVO campgoodsJjimListData(int g_id)
		   {
			   CampGoodsVO vo=null;
			   SqlSession session=null;
			   try
			   {
				   session=ssf.openSession();
				   vo=session.selectOne("campgoodsJjimListData", g_id);
			   }catch(Exception ex)
			   {
				   ex.printStackTrace();
			   }
			   finally
			   {
				   if(session!=null)
					   session.close();
			   }
			   return vo;
		   }
		  
		   public static List<Integer> campgoodsJjimGetg_id(String name)
		   {
			   List<Integer> list=null;
			   SqlSession session=null;
			   try
			   {
				   session=ssf.openSession();
				   list=session.selectList("campgoodsJjimGetg_id",name);
			   }catch(Exception ex)
			   {
				   ex.printStackTrace();
			   }
			   finally
			   {
				   if(session!=null)
					   session.close();
			   }
			   return list;
		   }
		   
		   public static void campgoodsJjimDelete(JjimVO vo)
		   {
			   SqlSession session=null;
			   try
			   {
				   session=ssf.openSession(true);
				   session.delete("campgoodsJjimDelete",vo);
			   }catch(Exception ex)
			   {
				   ex.printStackTrace();
			   }
			   finally
			   {
				   if(session!=null)
					   session.close();
			   }
		   }
		   /* 리뷰 목록 출력 */	
			
			public static List<ReviewVO> campgoodsReviewData(ReviewVO re_vo)
			{
				SqlSession session=null;
				List<ReviewVO> list=null;
				try 
				{
					session=ssf.openSession();
					list=session.selectList("campgoodsReviewData",re_vo);
				}catch(Exception ex)
				{
					System.out.println("campgoodsReviewData : error");
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
			
			public static void campgoodsReviewInsert(ReviewVO vo)
			{
				SqlSession session=null;
				try 
				{
					session=ssf.openSession(true);
					session.insert("campgoodsReviewInsert",vo);
				}catch(Exception ex)
				{
					System.out.println("campgoodsReviewInsert : error");
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
		
			public static void campgoodsReviewDelete(int re_no)
			{
				SqlSession session=null;
				try 
				{
					session=ssf.openSession(true);
					session.delete("campgoodsReviewDelete",re_no);
				}catch(Exception ex)
				{
					System.out.println("campgoodsReviewDelete : error");
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
			
			public static void campgoodsReviewUpdate(ReviewVO vo)
			{
				SqlSession session=null;
				try 
				{
					session=ssf.openSession(true);
					session.update("campgoodsReviewUpdate",vo);
				}catch(Exception ex)
				{
					System.out.println("campgoodsReviewUpdate : error");
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
			/* <update id="campgoodshit" parameterType="int" >*/
			public static void campgoodshit(int g_id)
			{
				SqlSession session=null;
				try 
				{
					session=ssf.openSession(true);
					session.update("campgoodshit",g_id);
				}catch(Exception ex)
				{
					System.out.println("campgoodshit : error");
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
