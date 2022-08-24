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

  <table class="table table-hover">
      <thead class="table-info">
    <tr class="text-center">
      <th scope="col"></th>
      <th scope="col">상품명</th>
      <th scope="col">가격</th>
      <th scope="col"></th>
    </tr>
  </thead>
  <tbody>
      <c:forEach var="vo" items="${cList }">
        <tr>
          <td class="text-center">
            <img src="${vo.g_image }" class="rounded border border-info" style="width: 50px;height: 50px">
          </td>
          <td class="text-center" ><a href="../campgoods/campgoods_detail.do?g_id=${vo.g_id }">${vo.g_name }</a></td>
          <td class="text-center">￦:${vo.g_price }</td>
           <td class="text-center">
            <a href="../campgoods/jjim_cancel.do?g_id=${vo.g_id }" class="btn btn-info">취소</a></td>
         
        </tr>
        
        
      </c:forEach>
      </tbody>
    </table>
</body>
</html>