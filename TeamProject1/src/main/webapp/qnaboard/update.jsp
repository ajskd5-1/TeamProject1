<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#writeBtn').click(function(){
		
		let title=$('#title').val();
		if(title.trim()=="")
		{
			$('#title').focus();
			return;
		}
		
		let content=$('#content').val();
		if(content.trim()=="")
		{
			$('#content').focus();
			return;
		}
		
		/* let filename=$('#filename').val();
		if(filename.trim()=="")
		{
			$('#filename').focus();
			return;
		} */
		
		$('#frm').submit();
	})
})
</script>
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
.title{
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
.button{
	margin-left: 300px;
}
.div1{
	margin-left: 150px;
}
.hr{
	border: 0;
    height: 5px;
    background: #cbdfbd;
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
            <li>수정</li>
          </ol>
        </div>
      </div>
</div>

<div class="wrapper row3">
<main class="container clear">
	<div class=div1>
    <h2 class="title" style="font-weight: bold">수정하기</h2>
    <hr class="hr">
     <form method=post action="../qnaboard/update_ok.do" id="frm" enctype="multipart/form-data">
      <table class="table">
        <tr>
         <th width=20%>제목</th>
         <td width=10%>
            <input type=text name=title size=50 class="input-sm" id="title" value="${vo.title }">
            <input type="hidden" name="name" value="${sessionScope.name }">
            <input type="hidden" name="no" value="${vo.no }">
         </td>
        </tr>
        <tr>
          <th width=20%>내용</th>
          <td width=80%>
            <textarea rows="10" cols="50" name=content id="content">${vo.content }</textarea>
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
            <input type=button value="등록" class="btn1 btn-sm" id="writeBtn">
            <input type=button value="취소" class="btn2 btn-sm"
              onclick="javascript:history.back()">
          </td>
        </tr>
      </table>
      </form>
      </div>
</main>
</div>
</body>
</html>