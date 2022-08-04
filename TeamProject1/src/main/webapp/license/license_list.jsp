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
  <main id="main">
    <!-- ======= Intro Single ======= -->
    <section class="intro-single">
      <div class="container">
        <div class="row">
          <div class="col-md-12 col-lg-8">
            <div class="title-single-box">
              <h1 class="title-single">자격증</h1>
              <span class="color-text-a">자격증</span>
            </div>
          </div>
          <div class="col-md-12 col-lg-4">
            <nav aria-label="breadcrumb" class="breadcrumb-box d-flex justify-content-lg-end">
              <ol class="breadcrumb">
                <li class="breadcrumb-item">
                  <a href="index.html">Home</a>
                </li>
                <li class="breadcrumb-item active" aria-current="page">
                  자격증
                </li>
              </ol>
            </nav>
          </div>
        </div>
      </div>
    </section><!-- End Intro Single-->

    <!-- =======  Blog Grid ======= -->
    <section class="news-grid grid">
      <div class="container">
        <div class="row">
          <c:forEach var="vo" items="${list }" varStatus="s">
          <div class="col-md-3">
            <div class="card-box-b card-shadow news-box">
              <div class="img-box-b">
                <img src="${vo.lp_poster }" alt="" class="img-b img-fluid">
              </div>
              <div class="card-overlay">
                <div class="card-header-b">
                  <div class="card-category-b">
                    <a href="#" class="category-b">${vo.l_cname}</a>
                  </div>
                  <div class="card-title-b">
                    <h2 class="title-2">
                      <a href="blog-single.html">${vo.l_name }</a>
                    </h2>
                  </div>
                  <div class="card-date">
                    <!-- <span class="date-b">18 Sep. 2017</span> -->
                  </div>
                </div>
              </div>
            </div>
          </div>
          </c:forEach>
          
        <!-- 페이지  중앙?style="justify-content: center"-->
        <div class="row">
          <div class="col-sm-12">
            <nav class="pagination-a">
              <ul class="pagination justify-content-center"><!--start, center, end -->
                <c:if test="${startPage>1 }">
                  <li class="page-item prev">
                    <a class="page-link" href="../license/license_list.do?page=${startPage-1 }" tabindex="-1">
                      <span class="bi bi-chevron-left"></span>
                    </a>
                  </li>
                </c:if>
                <c:forEach var="i" begin="${startPage }" end="${endPage }">
		          <c:if test="${i==curpage }">
		            <li class="page-item active"><a class="page-link" href="../license/license_list.do?page=${i }">${i }</a></li>
		          </c:if>
		          <c:if test="${i!=curpage }">
		            <li class="page-item"><a class="page-link" href="../license/license_list.do?page=${i }">${i }</a></li>
		          </c:if>
		        </c:forEach>
                <c:if test="${endPage<totalpage }">
                  <li class="page-item next">
                    <a class="page-link" href="../license/license_list.do?page=${endPage+1 }">
                      <span class="bi bi-chevron-right"></span>
                    </a>
                  </li>
                </c:if>
              </ul>
            </nav>
          </div>
        </div>
      </div>
    </section><!-- End Blog Grid-->
  </main><!-- End #main -->
</body>
</html>