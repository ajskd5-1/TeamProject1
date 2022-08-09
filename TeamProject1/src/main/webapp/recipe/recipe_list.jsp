<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <div class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>캠핑<sup>+</sup> 레시피</h2>
          <ol>
            <li><a href="index.html">Home</a></li>
            <li>Blog</li>
          </ol>
        </div>

      </div>
    </div><!-- End Breadcrumbs -->

    <!-- ======= Blog Section ======= -->
    <section id="blog" class="blog">
      <div class="container" data-aos="fade-up">
      	<div class="row g-5">
          <div class="col-lg-12" >
          <!-- ======= 상세보기 출력 ======= -->
            <div class="row gy-4 posts-list">
              <c:forEach var="vo" items="${list }">
              <div class="col-lg-4" >
                <article class="d-flex flex-column">
                  <div class="post-img">
                    <img src="${vo.cr_poster }" alt="" class="img-fluid">
                  </div>
                  <h2 class="title">
                    <a href="blog-details.html">${vo.cr_title }</a>
                  </h2>
                  <div class="meta-top">
                    <ul>
                      <li class="d-flex align-items-center"><i class="bi bi-person"></i> <a href="blog-details.html">${vo.cr_hit }</a></li>
                      <li class="d-flex align-items-center"><i class="bi bi-clock"></i> <a href="blog-details.html">${vo.cr_dbday }</a></li>
                      <li class="d-flex align-items-center"><i class="bi bi-chat-dots"></i> <a href="blog-details.html">!!수정필!!</a></li>
                    </ul>
                  </div>
                  <div class="content">
                    <p>${vo.cr_subtitle }</p>
                  </div>
                  <div class="read-more mt-auto align-self-end">
                    <a href="blog-details.html">레시피 보기</a>
                  </div>
                </article>
              </div><!-- End post list item -->
                </c:forEach>
            </div><!-- End blog posts list -->
            
			<!-- 하단 페이지 영역 -->
            <div class="blog-pagination">
              <ul class="justify-content-center">
                <c:if test="${startPage>1 }">
                <li class="page-item prev">
                  <a class="page-link" href="../recipe/recipe_list.do?page=${startPage-1 }" tabindex="-1">
                    <span class="bi bi-chevron-left"></span>
                  </a>
                </li>
                </c:if>
              	<c:forEach var="i" begin="${startPage }" end="${endPage }">
                <li class="active"><a href="../recipe/recipe_list.do?page=${i }">${i }</a></li>
                </c:forEach>
                <c:if test="${endPage<totalpage }">
                <li class="page-item next">
                  <a class="page-link" href="../recipe/recipe_list.do?page=${endPage+1 }">
                    <span class="bi bi-chevron-right"></span>
                  </a>
                </li>
                </c:if>
              </ul>
            </div><!-- End blog pagination -->
          </div>
     	 </div>
      </div>
    </section><!-- End Blog Section -->
  </main><!-- End #main -->
</body>
</html>