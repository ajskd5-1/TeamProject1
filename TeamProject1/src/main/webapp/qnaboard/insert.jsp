<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
.wrapper{
	margin-top: 100px;
}
.table{
}
.sectiontitle{
	margin-bottom: 30px;
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
.button{
	margin-left: 300px;
}
.div1{
	margin-left: 200px;
}
</style>
</head>
<body>
<!-- <div class="wrapper row3">
  <div id="breadcrumb" class="clear"> 
    ################################################################################################
    <ul>
      <li><a href="#">Home</a></li>
      <li><a href="#">문의게시판</a></li>
    </ul>
    ################################################################################################ 
  </div>
</div> -->
<div class="wrapper row3">
<main class="container clear">
	<div class=div1>
    <h2 class="sectiontitle" style="font-weight: bold">글쓰기</h2>
     <form method=post action="../qnaboard/insert_ok.do" id="frm">
      <table class="table">
        <tr>
          <th width=20%>제목</th>
          <td width=10%>
            <input type=text name=subject size=50 class="input-sm" id="subject">
          </td>
        </tr>
        <tr>
          <th width=20%>내용</th>
          <td width=80%>
            <textarea rows="10" cols="50" name=content id="content"></textarea>
          </td>
        </tr>
        <tr>
		  <th width=15%>첨부파일</th>
		  <td width=85%>
			<input type=file name=upload size=25>
		  </td>
		</tr>
		<tr>
          <td colspan="2" class="text-center">
            <input type=button value="글쓰기" class="btn1 btn-sm" id="writeBtn">
            <input type=button value="취소" class="btn2 btn-sm"
              onclick="javascript:history.back()">
          </td>
        </tr>
        </div>
      	</table>
      </form>
</main>
</div>
</body>
</html>