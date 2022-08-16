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

    <!-- ======= 페이지 상단 ======= -->
    <div class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <a href="../recipe/recipe_list.do"><h2 class="title">캠핑<sup>+</sup> 레시피</h2></a>
          <ol>
            <li><a href="index.html">Home</a></li>
            <li>recipe</li>
          </ol>
        </div>

      </div>
    </div>

    <!-- ======= 페이지 본문 ======= -->
    <section id="blog" class="blog">
      <div class="container" data-aos="fade-up">
      	<div class="row g-5">
          <div class="col-lg-12" >
          <!-- ======= 상세보기 출력 ======= -->
            <div class="row gy-4 posts-list">
              <c:forEach var="vo" items="${list }">
              <div class="col-lg-4" >
                <article class="d-flex flex-column">
                  <div class="post-img"  style="height: 400px;" onclick="location.href='../recipe/recipe_detail_before.do?cr_no=${vo.cr_no}'">
                    <img src="${vo.cr_poster }" style="height: 110%; width: 140%;"alt="" class="img-fluid" >
                  </div>
                  <h2 class="title" style="margin-top: 18px;">
                    <a href="../recipe/recipe_detail_before.do?cr_no=${vo.cr_no}">${vo.cr_title }</a>
                  </h2>
                  <div class="meta-top">
                    <ul>
                      <li class="d-flex align-items-center"><i class="bi bi-person"></i> <a href="blog-details.html">${vo.cr_hit }</a></li>
                      <li class="d-flex align-items-center"><i class="bi bi-clock"></i> <a href="blog-details.html">${vo.cr_dbday }</a></li>
                      <li class="d-flex align-items-center"><i class="bi bi-chat-dots"></i> <a href="blog-details.html">!!수정필!!</a></li>
                    </ul>
                  </div>
                  <div class="content"style="margin-top: 15px;">
                    <p style="margin-bottom: 0px;">${vo.cr_subtitle }</p>
                  </div>
                  <div class="read-more mt-auto align-self-end">
                    <a href="../recipe/recipe_detail_before.do?cr_no=${vo.cr_no}
                    "style="margin-bottom: 0px; background-color: white; color:#0ea2bd; padding-right: 5px;">레시피 보기 →</a>
                  </div>
                </article>
              </div><!-- End post list item -->
                </c:forEach>
            </div><!-- End blog posts list -->
             <div class="row" style="height: 50px;"></div>
			<!-- 하단 페이지 영역 -->
            <nav class="pagination-a">
              <ul class="pagination justify-content-center"><!--start, center, end -->
                <c:if test="${startPage>1 }">
                  <li class="page-item prev">
                    <a class="page-link" href="../recipe/recipe_list.do?page=${startPage-1 }" tabindex="-1">
                      <span class="bi bi-chevron-left"></span>
                    </a>
                  </li>
                </c:if>
                <c:forEach var="i" begin="${startPage }" end="${endPage }">
		          <c:if test="${i==curpage }">
		            <li class="page-item active"><a class="page-link" href="../recipe/recipe_list.do?page=${i }">${i }</a></li>
		          </c:if>
		          <c:if test="${i!=curpage }">
		            <li class="page-item"><a class="page-link" href="../recipe/recipe_list.do?page=${i }">${i }</a></li>
		          </c:if>
		        </c:forEach>
                <c:if test="${endPage<totalPage }">
                  <li class="page-item next">
                    <a class="page-link" href="../recipe/recipe_list.do?page=${endPage+1 }">
                      <span class="bi bi-chevron-right"></span>
                    </a>
                  </li>
                </c:if>
              </ul>
            </nav>
             <div class="row" style="height: 30px;"></div>
          </div>
     	 </div>
      </div>
    </section><!-- End Blog Section -->
  </main><!-- End blog-details.htmlmain -->
</body>
</html>