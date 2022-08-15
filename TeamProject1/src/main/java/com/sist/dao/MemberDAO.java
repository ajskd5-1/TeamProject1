package com.sist.dao;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.sist.vo.MemberVO;

public class MemberDAO {
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
	//<select id="loginIdCount" resultType="int" parameterType="string">
	//<select id="loginInfoData" resultType="MemberVO" parameterType="string">
	public static MemberVO isLogin(String id,String pwd)
	{
		SqlSession session=null;
		MemberVO vo=new MemberVO();
		try
		{
			session=ssf.openSession();
			int count=session.selectOne("loginIdCount",id);
			
			if(count==0)
			{
				vo.setMsg("NOID");
			}
			else
			{
				vo=session.selectOne("loginInfoData",id);
				if(pwd.equals(vo.getPwd()))
				{
					vo.setMsg("LOGINOK");
				}
				else
				{
					vo.setMsg("NOPWD");
				}
			}
		}catch(Exception ex)
		{
			System.out.println("isLogin : error");
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
	//<select id="JoinIdCheck" resultType="int" parameterType="string">
	public static int joinIdCheck(String id)
	{
		SqlSession session=null;
		int count=0;
		try
		{
			session=ssf.openSession();
			count=session.selectOne("joinIdCheck",id);
		}catch(Exception ex)
		{
			System.out.println("joinIdCheck : error");
			ex.printStackTrace();
		}
		finally
		{
			if(session!=null)
			{
				session.close();
			}
		}
		return count;
	}
	//<select id="JoinNNCheck" resultType="int" parameterType="string">
	public static int joinNNCheck(String nickname)
	{
		SqlSession session=null;
		int count=0;
		try
		{
			session=ssf.openSession();
			count=session.selectOne("joinNNCheck",nickname);
		}catch(Exception ex)
		{
			System.out.println("joinNNCheck : error");
			ex.printStackTrace();
		}
		finally
		{
			if(session!=null)
			{
				session.close();
			}
		}
		return count;
	}
	//<select id="JoinTelCheck" resultType="int" parameterType="string">
	public static int joinTelCheck(String tel)
	{
		SqlSession session=null;
		int count=0;
		try
		{
			session=ssf.openSession();
			count=session.selectOne("joinTelCheck",tel);
		}catch(Exception ex)
		{
			System.out.println("joinTelCheck : error");
			ex.printStackTrace();
		}
		finally
		{
			if(session!=null)
			{
				session.close();
			}
		}
		return count;
	}
	//<select id="JoinEmailCheck" resultType="int" parameterType="string">
	public static int joinEmailCheck(String eamil)
	{
		SqlSession session=null;
		int count=0;
		try
		{
			session=ssf.openSession();
			count=session.selectOne("joinEmailCheck",eamil);
		}catch(Exception ex)
		{
			System.out.println("joinEmailCheck : error");
			ex.printStackTrace();
		}
		finally
		{
			if(session!=null)
			{
				session.close();
			}
		}
		return count;
	}
	//<insert id="joinInsert" parameterType="MemberVO">
	public static int joinInsert(MemberVO vo)
	{
		SqlSession session=null;
		int count=0;
		try
		{
			session=ssf.openSession(true);
			session.insert("joinInsert",vo);
		}catch(Exception ex)
		{
			System.out.println("joinInsert : error");
			ex.printStackTrace();
		}
		finally
		{
			if(session!=null)
			{
				session.close();
			}
		}
		return count;
	}
}
