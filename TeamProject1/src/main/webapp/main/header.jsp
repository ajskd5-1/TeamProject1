<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
  <!-- ======= Header ======= -->
  <header id="header" class="header fixed-top" data-scrollto-offset="0">
    <div class="container-fluid d-flex align-items-center justify-content-between">

      <!-- 아이콘 수정 -->
      <a href="../main/main.do"><img src="../assets/img/main/tent.png" class="d-flex align-items-center scrollto me-auto" style="width: 50px; height: 50px;"></a>
		
      <nav id="navbar" class="navbar">
        <ul>
          <li class="dropdown"><a href="#"><span>캠핑장</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
            <ul>
              <li><a href="../camp/list.do">캠핑장 전체보기</a></li>
              <li><a href="../camp/map.do">지역별 캠핑장 검색</a></li>
            </ul>
          </li>
          
          <li class="dropdown"><a href="#"><span>캠핑용품</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
             
            <ul>
              <li><a href="../campgoods/campgoods_list.do">캠핑용품 전체보기</a></li>
              <li><a href="../campgoods/campgoods_find.do">브랜드별 캠핑용품 찾기</a></li>
              <!-- 
              <li><a href="#">Drop Down 3</a></li>
              <li><a href="#">Drop Down 4</a></li>
               -->
            </ul>
          </li>
          
          <li class="dropdown"><a href="#"><span>캠핑 레시피</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
            <ul>
              <li><a href="../recipe/recipe_list.do">레시피 전체보기</a></li>
              <li><a href="#">카테고리별 레시피</a></li>
              <li><a href="#">레시피 작성하기???</a></li>
            </ul>
          </li>
          
          <li class="dropdown"><a href="../qnaboard/list.do"><span>문의</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
            <ul>
              <li><a href="#">Drop Down 1</a></li>
            </ul>
          </li>
          <c:if test="${sessionScope.id!=null }">
	          <c:if test="${sessionScope.m_admin=='n' }">
	          <li class="dropdown"><a href="#"><span>마이페이지</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
	            <ul>
	              <li><a href="../mypage/myhome.do">마이페이지</a></li>
	              <li><a href="#">Drop Down 2</a></li>
              	  <li><a href="#">Drop Down 3</a></li>
	              <li><a href="#">Drop Down 4</a></li>
	            </ul>
	          </li>
	          </c:if>
	          <c:if test="${sessionScope.m_admin=='y' }">
	          <li class="dropdown"><a href="#"><span>어드민페이지</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
	            <ul>
	              <li><a href="../adminpage/adminhome.do">어드민페이지</a></li>
	              <li><a href="#">Drop Down 2</a></li>
	              <li><a href="#">Drop Down 3</a></li>
	              <li><a href="#">Drop Down 4</a></li>
	            </ul>
	          </li>
	          </c:if>
          </c:if>
          
        </ul>
        <i class="bi bi-list mobile-nav-toggle d-none"></i><!-- 아마 모바일창 -->
      </nav><!-- .navbar -->

 		  <!--  
     <a class="btn-getstarted" href="index.html#about"">로그인</a>
      -->
   
   		<c:if test="${sessionScope.id!=null }">
		<p style="margin: 14px 20px; color:#3A4753B3">[ <span style="font-weight: bold;"><%=(String)session.getAttribute("id")%></span> ]님 환영합니다.</p>
		</c:if>
		<div class="header-icon" style="display: inline;">
        	<a href="../cart/shoppingcart.do"><img src="../cart/images/cart2.png" style="width:50px; height:50px;  margin-right: 10px;"></a>
        	<c:if test="${sessionScope.id==null }">
        		<a href="../member/login.do"><img src="../assets/img/main/user5.png"" style="width:50px; height:50px; margin-right: 20px;"></a>
      		</c:if>
        	<c:if test="${sessionScope.id!=null }">
        		<a href="../member/logout.do"><img src="../assets/img/main/logout2.png"" style="width:40px; height:40px; margin-right: 20px;margin-top: 8px;"></a>
      		</c:if>
      	</div>
   
     

    </div>
  </header><!-- End Header -->
</body>
</html>