package com.sist.dao;

import java.io.Reader; 
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.sist.vo.QnaReplyVO;

public class QnaReplyDAO {
	private static SqlSessionFactory ssf;
	   static
	   {
		   try
		   {
			   Reader reader=Resources.getResourceAsReader("Config.xml");
			   ssf=new SqlSessionFactoryBuilder().build(reader);
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
	   }
	// 댓글 목록 
	public static List<QnaReplyVO> qnareplyListData(int no)
	   {
		   List<QnaReplyVO> list=null;
		   SqlSession session=null;
		   try
		   {
			   session=ssf.openSession();
			   list=session.selectList("qnareplyListData",no);
		   }catch(Exception ex)
		   {
			   System.out.println("qnareplyListData : error");
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
		   return list;
	   }
	
	// 댓글 쓰기
	public static void qnareplyInsert(QnaReplyVO vo)
	   {
		   
		   SqlSession session=null;
		   try
		   {
			   session=ssf.openSession(true);
			   session.insert("qnareplyInsert",vo);
			   session.update("recountIncrement",vo);
		   }catch(Exception ex)
		   {
			   
			   System.out.println("qnareplyInsert : error");
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
	   }
	
	//댓글 수정  
	public static void qnareplyUpdate(QnaReplyVO vo)
	   {
		   SqlSession session=ssf.openSession(true);
		   session.update("qnareplyUpdate",vo);
		   session.close();
	   }
	
	//댓글 삭제
	public static void qnareplyDelete(int r_no)
	   {
		   SqlSession session=ssf.openSession(true);
		   session.delete("qnareplyDelete",r_no);
		   session.close();
	   }
	
}
