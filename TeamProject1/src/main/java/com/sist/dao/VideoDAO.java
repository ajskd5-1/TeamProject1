package com.sist.dao;

import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.sist.vo.VideoVO;

public class VideoDAO {
	private static SqlSessionFactory ssf;
	static {
		try {
			Reader reader=Resources.getResourceAsReader("Config.xml");
			ssf=new SqlSessionFactoryBuilder().build(reader);
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}
	//<select id="videoListData" resultType="VideoVO" parameterType="hashmap">
	public static List<VideoVO> videoListData(Map map)
	{
		SqlSession session=null;
		List<VideoVO> list=null;
		try
		{
			session=ssf.openSession();
			list=session.selectList("videoListData",map);
		}catch(Exception ex)
		{
			System.out.println("videoListData : error");
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
	//<select id="videoDetailListData" resultType="VideoVO" parameterType="hashmap">
	public static List<VideoVO> videoDetailListData(Map map)
	{
		SqlSession session=null;
		List<VideoVO> list=null;
		try
		{
			session=ssf.openSession();
			list=session.selectList("videoDetailListData",map);
		}catch(Exception ex)
		{
			System.out.println("videoDetailListData : error");
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
	
	//<select id="videoListTotalPage" resultType="int" parameterType="hashmap">
	public static int videoListTotalPage(Map map)
	{
		int total=0;
		SqlSession session=null;
		try{
			session=ssf.openSession();
			total=session.selectOne("videoListTotalPage",map);
		}catch(Exception ex)
		{
			System.out.println("videoListTotalPage : error");
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
	
	//<select id="videoDetailData" resultType="VideoVO" parameterType="int">
	public static VideoVO videoDetailData(int vd_no)
	{
		VideoVO vo=null;
		SqlSession session=null;
		try{
			session=ssf.openSession();
			vo=session.selectOne("videoDetailData",vd_no);
		}catch(Exception ex)
		{
			System.out.println("videoDetailData : error");
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
















