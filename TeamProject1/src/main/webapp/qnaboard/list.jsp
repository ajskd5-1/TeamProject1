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
.qna_img{
	position: relative;
}
#text_box{
	padding: 5px 10px;
	text-align: center;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate( -50%, -50% );
}
.table_search{
  margin-bottom:20px;
  margin-left: 15px;
}
#submit_style{
	width:80px;
	height:30px;
	background-color:#cbdfbd; 
	border: none;
}
#submit_style:hover{
	background-color:#84a98c;
}
.button1{
	margin-left:650px;
	padding : 8px;
	background-color:#cbdfbd; 
}
.button2, .btn1{
	padding : 8px;
	background-color:#d3d3d3; 
}
a{
	color:#333;
	text-decoration : none;
}
.btn2{
	padding : 8px;
	background-color:#cbdfbd; 
}
.bn{
	margin-left:550px;
	margin-bottom:10px;
}
</style>
</head>
<body>
<div class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <a href="../qnaboard/list.do"><h2 class="title" style="font-size: 20pt; font-weight: bold; color:#0ea2bd;">캠핑<sup>+</sup> 문의</h2></a>
          <ol>
            <li><a href="../main/main.do" class="title" style="color:#0ea2bd;">Home</a></li>
            <li style="color:#0ea2bd; font-family: 'NanumSquareRound'">문의게시판</li>
          </ol>
        </div>
      </div>
</div>

   <div class="container">
    <div class="qna_img">  
     <p> 
   	   <img src="../assets/img/qnaboard/qna.jpg" style="width:100%;">
   	 </p>
       <h1 class="title" id="text_box" style="font-size:50px; color:#FFFFFF; font-weight: bold;">문의게시판</h1>
   </div>
     <div class="row">
     <div style="height: 500px;">
       <table class="table">
	     <tr style="background-color:#cbdfbd;">
	       <th class="text-center" width=10%>번호</th>
	       <th class="text-center" width=50%>제목</th>
	       <th class="text-center" width=15%>작성자</th>
	       <th class="text-center" width=15%>작성일</th>
	       <th class="text-center" width=10%>조회수</th>
	     </tr>
	     <c:forEach var="vo" items="${list }">
        <tr>
          <td width="10%" class="text-center">${vo.no }</td>
          <td width="50%"><a href="../qnaboard/detail.do?no=${vo.no }">${vo.title }</a>
            &nbsp;&nbsp;
           <c:if test="${vo.recount>0 }">
             (${vo.recount })
           </c:if>
          </td>
          <td width="15%" class="text-center">${vo.name }</td>
          <td width="15%" class="text-center">${vo.dbday }</td>
          <td width="10%" class="text-center">${vo.count }</td>
        </tr>
        </c:forEach>
     	</table>
    </div>
 	<div class=bn>
     	<td class="text-center inline">
		   <a href="../qnaboard/list.do?page=${curpage>1?curpage-1:curpage }" class="btn1 btn-sm">이전</a>
		   ${curpage } / ${totalpage }
		   <a href="../qnaboard/list.do?page=${curpage<totalpage?curpage+1:curpage }" class="btn2 btn-sm">다음</a>
		</td>
	</div>
    </div>
     <div class="row">
     	<table class="table_search">
			<tr>
			<td class="board_search">
			 	<select name=fs style="width:80px;height:30px";>
			 		<option value="name">작성자</option>
					<option value="title">제목</option>
					<option value="content">내용</option>
			 	</select>
			 	<input type=text name=ss size=40>
			 	<input id="submit_style" type=submit value="검색하기">
			 	<c:if test="${sessionScope.id!=null }">
			 	<a href="../qnaboard/insert.do" class="button1">작성</a>
            	<a href="#" class="button2">목록</a>
            	</c:if>
			 </td>
			</tr>
		</table>
     </div>
   </div>
</body>