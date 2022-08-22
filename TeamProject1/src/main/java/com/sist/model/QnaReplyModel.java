package com.sist.model;

import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.QnaReplyDAO;
import com.sist.vo.QnaReplyVO;


@Controller
public class QnaReplyModel {
	@RequestMapping("qnareply/qnareply_insert.do")
	public String qnareply_insert(HttpServletRequest request,HttpServletResponse response)
	   {
		   try
		   {
			   request.setCharacterEncoding("UTF-8");
		   }catch(Exception ex) {}
		   
		   String no=request.getParameter("no");// 게시물 번호 
		   String r_type=request.getParameter("r_type"); // 카테고리 
		   String r_content=request.getParameter("r_content");
		   HttpSession session=request.getSession();
		   String id=(String)session.getAttribute("id");
		   String r_name=(String)session.getAttribute("name");
		   
		   QnaReplyVO vo=new QnaReplyVO();
		   vo.setNo(Integer.parseInt(no));
		   vo.setId(id);
		   vo.setR_name(r_name);
		   vo.setR_content(r_content);
		   vo.setR_type(Integer.parseInt(r_type));

		   QnaReplyDAO.qnareplyInsert(vo);
		   return "redirect:../qnaboard/detail.do?no="+no;
	   }
	   @RequestMapping("qnareply/qnareply_update.do")
	   public String reply_update(HttpServletRequest request,HttpServletResponse response)
	   {
		   try
		   {
			   request.setCharacterEncoding("UTF-8");
		   }catch(Exception ex) {}
		   String no=request.getParameter("no");// 게시물번호 => detail로 이동
		   String r_no=request.getParameter("r_no"); // 댓글 번호 => 삭제
		   String r_content=request.getParameter("r_content");
		   
		   QnaReplyVO vo=new QnaReplyVO();
		   vo.setNo(Integer.parseInt(no));
		   vo.setR_content(r_content);
		   QnaReplyDAO.qnareplyUpdate(vo);
		   //DAO연동 
		   return "redirect:../freeboard/detail.do?no="+r_no;
	   }
	   @RequestMapping("qnareply/qnareply_delete.do")
	   public String reply_delete(HttpServletRequest request,HttpServletResponse response)
	   {
			String no=request.getParameter("no"); // 게시물 번호
			String r_no=request.getParameter("r_no"); // 댓글 번호
			
			QnaReplyDAO.qnareplyDelete(Integer.parseInt(r_no));
			return "redirect:../qnaboard/detail.do?no="+no;
	   }
}