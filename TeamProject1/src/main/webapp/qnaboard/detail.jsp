<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@font-face {
    font-family: 'NanumSquareRound';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/NanumSquareRound.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
*{
	font-family: 'NanumSquareRound';
}
.container{
	margin-top: 5px;
}
.sectiontitle{
	margin-top: 30px;
}
.btn1{
	padding : 5px;
	background-color:#cbdfbd; 
	border-style: none;
}
.btn2{
	padding : 5px;
	background-color:#d3d3d3;
	border-style: none;  
}

.hr{
	border: 0;
    height: 5px;
    background: #cbdfbd;
}
.wrapper{
	margin-left: 150px;
}
.avatar{
	margint-left: 120px;
}
</style>
</head>
<body>
<div class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <a href="../qnaboard/list.do"><h2 class="title" style="font-size: 18pt; font-weight: bold;">캠핑<sup>+</sup> 문의</h2></a>
          <ol>
            <li><a href="index.html">Home</a></li>
            <li>문의게시판</li>
            <li>상세보기</li>
          </ol>
        </div>
      </div>
</div>

<div class="wrapper row3">
  <main class="container clear"> 
    <h2 class="sectiontitle title" style="font-weight: bold">상세보기</h2>
    <hr class="hr">
     <table class="table">
       <tr>
         <th width=20% class="text-center">제목</th>
         <td width=30% class="text-center">${vo.title }</td>
         <th width=20% class="text-center">작성일</th>
         <td width=30% class="text-center">${vo.dbday }</td>
       </tr>
       <tr>
      	 <th width=20% class="text-center">파일첨부</th>
         <td width=30% class="text-center"><a href="../qnaboard/download.do?fn=${vo.filename }">${vo.filename }</a></td>
         <th width=20% class="text-center">작성자</th>
         <td width=30% class="text-center">${vo.name }</td>
       </tr>
       <tr>
        <td colspan="4" height="400" valign="top" class="text-left">
          <pre style="white-space: pre-wrap;background-color: white;border:none">${vo.content }</pre>
        </td>
       </tr>
       <tr>
         <td colspan="4" class="text-center">
        <c:if test="${sessionScope.id!=null }">
           <a href="../qnaboard/update.do?no=${vo.no }" class="btn1 btn-sm">수정</a>
           <a href="../qnaboard/delete.do?no=${vo.no }" class="btn2 btn-sm" id="delBtn">삭제</a>
         </c:if>
           <a href="../qnaboard/list.do" class="btn1 btn-sm">목록</a>
         </td>
       </tr>
      </table>
      
   <!-- 댓글 -->   
     <div id="comments"> 
       <h4 class="title">답변</h4>
        <ul>
         <c:forEach var="rvo" items="${list }">
          <li>
            <article>
              <header>
                <figure class="avatar">
                 <c:if test="${sessionScope.id=='admin'}">
                  <span class="btn1 btn-xs up" style="color:black" data-no="${rvo.no }">수정</span>
                  <a href="../qnareply/qnareply_delete.do?r_no=${rvo.r_no }&no=${vo.no}" class="btn2 btn-xs" style="color:black">삭제</a>
                 </c:if>
                </figure>
                <address>
                <img src="../qnaboard/user.png" style="width: 20px; height:20px;">
                <a href="#">${rvo.r_name }&nbsp;(${rvo.dbday })</a>
                </address>
              </header>
              <div class="comcont">
                <p><pre style="white-space: pre-wrap;background-color:white;border:none"> ${rvo.r_content }</pre></p>
              </div>
            </article>
            
          </li>
            <div style="display:none" id="update${rvo.no }" class="updates">
	            <table class="table">
		          <tr>
		            <td>
		             <form method=post action="../qnareply/qnareply_update.do">
		               <input type=hidden name=no value="${vo.no }">
		               <input type=hidden name=r_type value="1">
		               <input type=hidden name=r_no value="${rvo.r_no }">
		               <textarea rows="5" cols="70" name="r_content" style="float: left">${rvo.r_content }</textarea>
		               <input type=submit class="btn btn-sm btn-primary" style="height: 105px"
		                value="댓글수정">
		              </form>
		            </td>
		          </tr>
		        </table>
	        </div>
          </c:forEach>
        </ul> 
       </div>
       <c:if test="${sessionScope.id=='admin' }"><%--로그인시에만 보여준다 --%> 
        <table class="table">
          <tr>
            <td>
             <form method=post action="../qnareply/qnareply_insert.do">
               <input type=hidden name=no value="${vo.no }">
               <input type=hidden name=r_type value="1">
               <textarea rows="4" cols="100" name="r_content" style="float: left"></textarea>
				<input type=submit class="btn1 btn-sm" style="height: 50px; margin-left: 10px; margin-top : 22px;" value="답변쓰기">
              </form>
            </td>
          </tr>
        </table>
       </c:if>
      </div>
   </main>
</div>
</body>
</html> 