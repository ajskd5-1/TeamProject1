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
	<!-- ======= Breadcrumbs ======= -->
    <div class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>캠핑<sup>+</sup> 캠핑장</h2>
          <ol>
            <li><a href="../main/main.do">Home</a></li>
            <li><a href="../camp/list.do">캠핑장</a></li>
          </ol>
        </div>

      </div>
    </div><!-- End Breadcrumbs -->

	<!-- ======= Features Section ======= -->
    <section id="features" class="features">
      <div class="container" data-aos="fade-up">
        <div class="tab-content">
		<c:forEach var="vo" items="${list }">
          <div class="tab-pane active show" id="tab-1">
            <div class="row gy-4" style=" cursor: pointer; margin-bottom: 50px;" onclick="location.href='../camp/detail.do?no=${vo.no}'">
              <div class="col-lg-8 order-2 order-lg-1" data-aos="fade-up" data-aos-delay="100">
                <h3 class="title">${vo.c_title }</h3>
                <p>
                  <i class="bi bi-map-fill" style="color: #0ea2bd;"></i>
                  ${vo.c_addr }
                </p>
                <ul>
                  <li><i class="bi bi-check-circle-fill"></i> ${vo.c_content }</li>
                  <li><i class="bi bi-check-circle-fill"></i> 캠핑장 시설</li>
                  <li>&nbsp;&nbsp;&nbsp;&nbsp;
                    <c:forTokens items="${vo.c_info2 }" delims=" " var="info">
                      <c:choose>
                        <c:when test="${info eq '전기' }"><img src="https://img.icons8.com/external-phatplus-lineal-phatplus/64/000000/external-electric-electric-vehicles-phatplus-lineal-phatplus.png"/>&nbsp;&nbsp;&nbsp;&nbsp;</c:when>
                        <c:when test="${info eq '와이파이' }"><img src="https://img.icons8.com/glyph-neue/64/000000/wifi.png"/>&nbsp;&nbsp;&nbsp;&nbsp;</c:when>
                        <c:when test="${info eq '장작판매' }"><img src="https://img.icons8.com/pastel-glyph/64/000000/bonfire.png"/>&nbsp;&nbsp;&nbsp;&nbsp;</c:when>
                        <c:when test="${info eq '온수' }"><img src="https://img.icons8.com/external-inipagistudio-mixed-inipagistudio/64/000000/external-water-manicure-and-pedicure-inipagistudio-mixed-inipagistudio.png"/>&nbsp;&nbsp;&nbsp;&nbsp;</c:when>
                        <c:when test="${info eq '트렘폴린' }"><img src="https://img.icons8.com/ios/50/000000/trampoline-park.png"/>&nbsp;&nbsp;&nbsp;&nbsp;</c:when>
                        <c:when test="${info eq '물놀이장' }"><img src="https://img.icons8.com/cotton/64/000000/swimming-pool--v2.png"/>&nbsp;&nbsp;&nbsp;&nbsp;</c:when>
                        <c:when test="${info eq '놀이터' }"><img src="https://img.icons8.com/ios/50/000000/playground.png"/>&nbsp;&nbsp;&nbsp;&nbsp;</c:when>
                        <c:when test="${info eq '산책로' }"><img src="https://img.icons8.com/ios/50/000000/trail--v2.png"/>&nbsp;&nbsp;&nbsp;&nbsp;</c:when>
                        <c:when test="${info eq '운동장' }"><img src="https://img.icons8.com/dotty/80/000000/stadium.png"/>&nbsp;&nbsp;&nbsp;&nbsp;</c:when>
                        <c:when test="${info eq '운동시설' }"><img src="https://img.icons8.com/fluency-systems-regular/48/000000/sports.png"/>&nbsp;&nbsp;&nbsp;&nbsp;</c:when>
                        <c:when test="${info eq '마트.편의점' }"><img src="https://img.icons8.com/ios-glyphs/60/000000/shop.png"/></c:when>
                        <c:otherwise></c:otherwise>
                      </c:choose>
                    </c:forTokens>
                  </li>
                </ul>
                <p>
                  
                </p>
              </div>
              <div class="col-lg-4 order-1 order-lg-2 text-center" data-aos="fade-up" data-aos-delay="200">
                <img src="${vo.c_poster }" alt="" class="img-fluid" style="height: 300px">
              </div>
            </div>
          </div><!-- End Tab Content 1 -->
		</c:forEach>
        </div>
        
        <!-- 페이지  중앙?style="justify-content: center"-->
        <div class="row">
          <div class="col-sm-12">
            <nav class="pagination-a">
              <ul class="pagination justify-content-center"><!--start, center, end -->
                <c:if test="${startPage>1 }">
                  <li class="page-item prev">
                    <a class="page-link" href="../camp/list.do?page=${startPage-1 }" tabindex="-1">
                      <span class="bi bi-chevron-left"></span>
                    </a>
                  </li>
                </c:if>
                <c:forEach var="i" begin="${startPage }" end="${endPage }">
		          <c:if test="${i==curpage }">
		            <li class="page-item active"><a class="page-link" href="../camp/list.do?page=${i }">${i }</a></li>
		          </c:if>
		          <c:if test="${i!=curpage }">
		            <li class="page-item"><a class="page-link" href="../camp/list.do?page=${i }">${i }</a></li>
		          </c:if>
		        </c:forEach>
                <c:if test="${endPage<totalpage }">
                  <li class="page-item next">
                    <a class="page-link" href="../camp/list.do?page=${endPage+1 }">
                      <span class="bi bi-chevron-right"></span>
                    </a>
                  </li>
                </c:if>
              </ul>
            </nav>
          </div>
        </div>
        
      </div>
    </section><!-- End Features Section -->
    
</body>
</html>