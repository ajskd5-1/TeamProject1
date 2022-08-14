<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
/* $(document).ready(function(){
	 $('#delBtn').click(function(){  
		let no=$(this).attr("data-no");
		if()
		{

		}
    }
})
		$.ajax({
			type:'post',
			url:'../qnaboard/delete.do',
			data:{"no":no},
			success:function(result)
			{
				location.href="../qnaboard/list.do"
			    error:function(request, status, error)
			{
				alert(error);
			}
		}) */
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
.div1{
	margin-left: 150px;
}
</style>
</head>
<body>
<div class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <a href="../qnaboard/list.do"><h2 style="font-size: 18pt; font-weight: bold;">캠핑<sup>+</sup> 문의</h2></a>
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
  <div class="div1">
    <h2 class="sectiontitle" style="font-weight: bold">상세보기</h2>
    <hr class="hr">
    <div class="two_first">
     <table class="table">
       <tr>
         <th width=20% class="text-center">제목</th>
         <td width=30% class="text-center">${vo.title }</td>
         <th width=20% class="text-center">작성일</th>
         <td width=30% class="text-center">${vo.dbday }</td>
       </tr>
       <tr>
      	 <th width=20% class="text-center">파일첨부</th>
         <td width=30% class="text-center">${vo.filename }</td>
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
           <a href="../qnaboard/update.do?no=${vo.no }" class="btn1 btn-sm">수정</a>
           <span class="btn2 btn-xs" id="delBtn">삭제</span>
           <a href="../qnaboard/list.do" class="btn1 btn-sm">목록</a>
         </td>
       </tr>
    </div>
     </table>
      </div>
   </main>
</div>
</body>
</html>