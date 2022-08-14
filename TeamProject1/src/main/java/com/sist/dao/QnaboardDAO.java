package com.sist.dao;

import java.io.Reader;  
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.sist.vo.QnaBoardVO;

public class QnaboardDAO {
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
	   // 문의게시판 총페이지 출력
	   public static int qnaboardTotalPage()
	   {
		   int total=0;
		   SqlSession session=null;
		   try
		   {
			   session=ssf.openSession();
			   total=session.selectOne("qnaboardTotalPage");
		   }catch(Exception ex)
		   {
			   System.out.println("qnaboardTotalPage : error");
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close(); // POOL => 반환 
		   }
		   return total;
	   }
	   
	   // 문의게시판 목록 출력
	   public static List<QnaBoardVO> qnaboardListData(Map map)
	   {
		   SqlSession session=null;
		   List<QnaBoardVO> list=null;
		   try
		   {
			   session=ssf.openSession();
			   list=session.selectList("qnaboardListData",map);
		   }catch(Exception ex)
		   {
			   System.out.println("qnaboardListData : error");
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
		   return list;
	   }
	     
	   // 게시글 쓰기(사용자)
	   public static void qnaboardInsert(QnaBoardVO vo)
	   {
		   SqlSession session=null;
		   try
		   {
			   session=ssf.openSession();
			   session.insert("qnaboardInsert",vo);
			   session.commit();
		   }catch(Exception ex)
		   {
			   System.out.println("qnaboardInsert : error");
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
	   }
	   // 답변 달기(관리자)
	   public static List<QnaBoardVO> qnaboardReplyAdminData()
	   {
		   List<QnaBoardVO> list=null;
		   SqlSession session=null;
			  
		   try
		   {
			   session=ssf.openSession(true);
			   list=session.selectList("qnaboardReplyAdminData");
		   }catch(Exception ex)
		   {
			   System.out.println("qnaboardReplyAdminData : error");
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
		   return list;
	   }
	   
	   // 상세보기
	   public static QnaBoardVO qnaboardDetailData(int no) 
	   {
		   QnaBoardVO vo=new QnaBoardVO();
		   SqlSession session=null;
		   
		   try
		   {
			   session=ssf.openSession();
			   session.update("hitIncrement",no);
			   session.commit();
			   vo=session.selectOne("qnaboardDetailData",no);
		   }catch(Exception ex)
		   {
			   System.out.println("qnaboardDetailData : error");
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
		   return vo;
	   }
	   

}

