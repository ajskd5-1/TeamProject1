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
	   
	   // 게시글 파일 첨부
	   public static void qnaboardInsert(QnaBoardVO vo)
	   {
		   SqlSession session=null;
		   List<QnaBoardVO> list=null;
		   try
		   {
			   session=ssf.openSession();
			   session.insert("qnaboardInsert",vo);
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
	  
	   // 게시글 상세보기
	   /*public static QnaBoardVO qnaboardDetailData(int no) 
	   {
		   QnaBoardVO vo=new QnaBoardVO();
		   SqlSession session=null;		   
		   try
		   {
			   session=ssf.openSession();
			   // ? session.update("countIncrement",no);
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
	   }*/

}
