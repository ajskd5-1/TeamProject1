<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <table class="table">
    <tr>
      <td class="text-center" colspan="2"></td>
      <img src="${vo.c_poster }" style="width: 500px; height: 350px;">
    </tr>
    <tr>
      <td width="20%">예약번호</td>
      <td width="80%">${vo.no }</td>
    </tr>
    <tr>
      <td width="20%">체크인</td>
      <td width="80%">${vo.cin }</td>
    </tr>
    <tr>
      <td width="20%">체크아웃</td>
      <td width="80%">${vo.cout }</td>
    </tr>
    <tr>
      <td width="20%">인원</td>
      <td width="80%">${vo.inwon }명</td>
    </tr>
    <tr>
      <td width="20%">캠핑장</td>
      <td width="80%">${vo.c_title }</td>
    </tr>
    <tr>
      <td width="20%">주소</td>
      <td width="80%">${vo.c_addr }</td>
    </tr>
    <tr>
      <td width="20%">등록일</td>
      <td width="80%">${vo.dbday }</td>
    </tr>
  </table>
</body>
</html>