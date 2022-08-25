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
  <h1>결제 정보</h1>
  <table class="table">
    <tr class="table-info">
      <th width="15%">수령인</th>
      <th width="45%">주소</th>
      <th width="20%">이메일</th>
      <th width="20%">전화번호</th>
    </tr>
    <tr>
      <td>${vo.o_name }</td>
      <td>${vo.o_addr1 } ${vo.o_addr2 }</td>
      <td>${vo.o_email }</td>
      <td>${vo.o_tel }</td>
    </tr>
    <tr>
      <th class="table-info">요구사항</th>
      <td>${vo.o_content }</td>
      <th class="table-info">결제 금액</th>
      <td>${vo.o_total }원</td>
    </tr>
  </table>
  <h1>상품 정보</h1>
  <table class="table">
    <tr class="table-info">
      <th>이미지</th>
      <th>상품명</th>
      <th>가격</th>
      <th>수량</th>
      <th>총 금액</th>
    </tr>
    <c:forEach var="cvo" items="${list }">
      <tr>
        <td><img src="${cvo.g_image }" style="width: 100px; height: 100px;"></td>
        <td>${cvo.g_name }</td>
        <td>${cvo.g_price }원</td>
        <td>${cvo.c_account }개</td>
        <td>${cvo.c_price }원</td>
      </tr>
    </c:forEach>
  </table>
</body>
</html>