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
	   
	   // 게시글 파일 첨부
		public void qnaboardInsertdata(QnaBoardVO vo)
		{
			SqlSession session=null;
			try
			{
				 session=ssf.openSession();
				 session.insert("qnaboardInsertdata",vo);
				 session.commit();
			}catch(Exception ex)
			{
				System.out.println("qnaboardInsertdata : error");
				ex.printStackTrace();
			}
			finally
			{
				if(session!=null)
					session.close();
			}
		}
		// 게시글 파일 다운로드
		public static QnaBoardVO qnaboardDownload(String no)
		{
			QnaBoardVO vo=new QnaBoardVO();
			SqlSession session=null;
			try
			{
				session=ssf.openSession();
				session.commit();
				vo=session.selectOne("qnaboardDownload",no);
			}catch(Exception ex)
			{
				 System.out.println("qnaboardDownload : error");
				 ex.printStackTrace();
			}
			finally
			{
				 if(session!=null)
					 session.close();
			}
			return vo;
		}
		
	   // 게시글 쓰기
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
	   
	   // 상세보기
	   public static QnaBoardVO qnaboardDetailData(int no) 
	   {
		   QnaBoardVO vo=new QnaBoardVO();
		   SqlSession session=null;
		   
		   try
		   {
			   session=ssf.openSession();
			   session.update("countIncrement",no);
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
	   
	   // 게시글 수정하기
	   public static QnaBoardVO qnaboardupdateData(int no) 
	   {
		   QnaBoardVO vo=new QnaBoardVO();
		   SqlSession session=null;
		   
		   try
		   {
			   session=ssf.openSession();
			   vo=session.selectOne("qnaboardDetailData",no);
		   }catch(Exception ex)
		   {
			   System.out.println("qnaboardupdateData : error");
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
		   return vo;
	   }
	   
	   public static void qnaboardUpdate(QnaBoardVO vo)
	   {
		   SqlSession session=null;
		   try
		   {
			   session=ssf.openSession(true);
			   session.update("qnaboardUpdate",vo);
		   }catch(Exception ex)
		   {
			   System.out.println("qnaboardUpdate : error");
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
	   }
	   
	  // 게시글 삭제하기
	  public static String qnaboardDelete(int no)
	  {
		   String result="";
		   SqlSession session=null;
		   try
		   {
			   session=ssf.openSession();
			   session.delete("qnaboardDelete",no);
			   session.commit(); 
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
		   return result;
	   }
	  // 관리자 페이지
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
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
		   return list;
	   }
	  
	  public static QnaBoardVO boardReplyUpdateData(int no)
	   {
		  QnaBoardVO vo=null;
		  SqlSession session=null;
			  
		  try
		  {
			  session=ssf.openSession();
			  vo=session.selectOne("qnaboardReplyDetailData", no);
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
	  
	   
}

