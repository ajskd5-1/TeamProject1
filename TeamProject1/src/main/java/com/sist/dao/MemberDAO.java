package com.sist.dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.Map;

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
/* 로그인 */	
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
/* 아이디 찾기 */	
	//<select id="idFindNameCount" resultType="int" parameterType="string">
	//<select id="idGetEmail" resultType="string" parameterType="string">
	//<select id="idFindEmail" resultType="string" parameterType="hashmap">
	public static String idFindEmail(String name,String email)
	{
		SqlSession session=null;
		String result="";
		int count=0;
		try
		{
			session=ssf.openSession();
			count=session.selectOne("idFindNameCount",name);
			if(count==0)
			{
				result="존재하지 않는 이름입니다.";
			}
			else
			{
				String db_email=session.selectOne("idGetEmail",name);
				if(db_email.equals(email))
				{
					Map map=new HashMap();
					map.put("name", name);
					map.put("email",email);
					result=session.selectOne("idFindEmail",map);
				}
				else
				{
					result="이메일이 틀립니다. 다시 입력하세요.";
				}
			}
		}catch(Exception ex)
		{
			System.out.println("idFindEmail : error");
			ex.printStackTrace();
		}
		finally
		{
			if(session!=null)
			{
				session.close();
			}
		}
		return result;
	}
	//<select id="idGetTel" resultType="string" parameterType="string">
	//<select id="idFindTel" resultType="string" parameterType="hashmap">
	public static String idFindTel(String name,String tel)
	{
		SqlSession session=null;
		String result="";
		int count=0;
		try
		{
			session=ssf.openSession();
			count=session.selectOne("idFindNameCount",name);
			if(count==0)
			{
				result="존재하지 않는 이름입니다.";
			}
			else
			{
				String db_tel=session.selectOne("idGetTel",name);
				if(db_tel.equals(tel))
				{
					Map map=new HashMap();
					map.put("name", name);
					map.put("tel",tel);
					result=session.selectOne("idFindTel",map);
				}
				else
				{
					result="전화번호가 틀립니다. 다시 입력하세요.";
				}
			}
		}catch(Exception ex)
		{
			System.out.println("idFindTel : error");
			ex.printStackTrace();
		}
		finally
		{
			if(session!=null)
			{
				session.close();
			}
		}
		return result;
	}
/* 비밀번호 찾기 */	
	//<select id="pwdFindIDCount" resultType="int" parameterType="string">
	//<select id="pwdGetEmail" resultType="string" parameterType="string">
	//<select id="pwdFindEmail" resultType="string" parameterType="hashmap">
	public static String pwdFindEmail(String id,String email)
	{
		SqlSession session=null;
		String result="";
		int count=0;
		try
		{
			session=ssf.openSession();
			count=session.selectOne("pwdFindIDCount",id);
			if(count==0)
			{
				result="존재하지 않는 아이디입니다.";
			}
			else
			{
				String db_email=session.selectOne("pwdGetEmail",id);
				if(db_email.equals(email))
				{
					Map map=new HashMap();
					map.put("id", id);
					map.put("email",email);
					result=session.selectOne("pwdFindEmail",map);
				}
				else
				{
					result="이메일이 틀립니다. 다시 입력하세요.";
				}
			}
		}catch(Exception ex)
		{
			System.out.println("pwdFindEmail : error");
			ex.printStackTrace();
		}
		finally
		{
			if(session!=null)
			{
				session.close();
			}
		}
		return result;
	}
	//<select id="pwdGetTel" resultType="string" parameterType="string">
	//<select id="pwdFindTel" resultType="string" parameterType="hashmap">
	public static String pwdFindTel(String id,String tel)
	{
		SqlSession session=null;
		String result="";
		int count=0;
		try
		{
			session=ssf.openSession();
			count=session.selectOne("pwdFindIDCount",id);
			if(count==0)
			{
				result="존재하지 않는 아이디입니다.";
			}
			else
			{
				String db_tel=session.selectOne("pwdGetTel",id);
				if(db_tel.equals(tel))
				{
					Map map=new HashMap();
					map.put("id", id);
					map.put("tel",tel);
					result=session.selectOne("pwdFindTel",map);
				}
				else
				{
					result="전화번호가 틀립니다. 다시 입력하세요.";
				}
			}
		}catch(Exception ex)
		{
			System.out.println("pwdFindTel : error");
			ex.printStackTrace();
		}
		finally
		{
			if(session!=null)
			{
				session.close();
			}
		}
		return result;
	}
/* 회원가입 */		
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
