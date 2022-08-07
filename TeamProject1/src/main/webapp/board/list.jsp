<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
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
	margin-top: 70px;
}
.img_free{
	margin-left: 170px;
	margin-right: 170px;
	position: relative;
}
.text_board{
	padding: 5px 10px;
	text-align: center;
	position: absolute;
	top: 40%;
	left: 50%;
	transform: translate( -50%, -50% );
}
.row{
	margin: 0px auto;
	width:800px;
}
/* .board_search{
  position: fixed;
  bottom: 10px;
   width: 100%
   left: 35%;
   right: 30%; 
} */
#submit_style{
	width:80px;
	height:25px;
	background-color:#cbdfbd; 
	border: none;
}
#submit_style:hover{
	background-color:#84a98c;
}
.button1{
	margin-left:240px;
	padding : 5px;
	background-color:#cbdfbd; 
}
.button2{
	padding : 5px;
	background-color:#d3d3d3; 
}
a{
	color:#333;
	text-decoration : none;
}
</style>
</head>
<body>
   <div class="container">
    <div class="img_free">
     <p>
   	   <img src="../assets/img/board/qna.jpg" style="width:100%; height:50%;">
   	 </p>
       <h1 class="text_board" style="font-size:50px; color:#FFFFFF; font-weight: bold;">문의게시판</h1>
   </div>
     <div class="row">
       <table class="table">
	     <tr style="background-color:#cbdfbd;">
	       <th class="text-center" width=10%>번호</th>
	       <th class="text-center" width=55%>제목</th>
	       <th class="text-center" width=15%>작성자</th>
	       <th class="text-center" width=10%>작성일</th>
	     </tr>
     	</table>
     	
     	

     </div>
     <div class="row">
     	<table class="table_search">
			<tr>
			<td class="board_search">
			 	<select name=fs style="width:80px;height:25px";>
			 		<option value="name">작성자</option>
					<option value="title">제목</option>
					<option value="content">내용</option>
			 	</select>
			 	<input type=text name=ss size=40>
			 	<input id="submit_style" type=submit value="검색하기">
			 	<a href="#" class="button1">작성</a>
            	<a href="#" class="button2">목록</a>
			 </td>
			</tr>
		</table>
     </div>
   </div>
</body>