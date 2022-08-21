<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <table class="table">
    <tr class="text-center">
      <th></th>
      <th>캠핑장</th>
      <th>주소</th>
      <th></th>
    </tr>
    <c:forEach var="vo" items="${list }">
      <tr>
        <td><img src="${vo.c_poster }" style="width: 100px; height: 100px;"></td>
        <td>${vo.c_title }</td>
        <td>${vo.c_addr }</td>
        <td><a href="../camp/detail_before.do?no=${vo.no}"><input type="text" class="btn btn-sm btn-danger" value="상세보기" size="10px;"></a></td>
      </tr>
    </c:forEach>
  </table>
</body>
</html>