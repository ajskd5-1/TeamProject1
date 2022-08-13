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
}
