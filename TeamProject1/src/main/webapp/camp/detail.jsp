<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

</style>
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
            <li><a href="../camp/detail.do?no=${vo.no }">${vo.c_title }</a></li>
          </ol>
        </div>

      </div>
    </div><!-- End Breadcrumbs -->
	<!-- ======= About Section ======= -->
    <section id="about" class="about">
      <div class="container" data-aos="fade-up">

        <div class="section-header">
          <h2 class="title">${vo.c_title }</h2>
          <!-- <p>Architecto nobis eos vel nam quidem vitae temporibus voluptates qui hic deserunt iusto omnis nam voluptas asperiores sequi tenetur dolores incidunt enim voluptatem magnam cumque fuga.</p> -->
        </div>

        <div class="row g-4 g-lg-5" data-aos="fade-up" data-aos-delay="200">

          <div class="col-lg-5">
            <div>
              <img src="${vo.c_poster }" class="img-fluid" alt="">
            </div>
          </div>

          <div class="col-lg-7">
            <%-- <h3 class="pt-0 pt-lg-5" style="font-size: 20px;">${vo.c_content }</h3> --%>

            <!-- Tabs -->
            <ul class="nav nav-pills mb-3">
              <li><a class="nav-link active" data-bs-toggle="pill" href="#tab1">캠핑장 기본정보</a></li>
              <li><a class="nav-link" data-bs-toggle="pill" href="#tab2">사진</a></li>
              <li><a class="nav-link" data-bs-toggle="pill" href="#tab3">이용안내</a></li>
              <li><input type="text" value="예약하기" class="btn btn-sm btn-primary" size="10" style="margin-top: 10px;"></li>
            </ul><!-- End Tabs -->

            <!-- Tab Content -->
            <div class="tab-content">

              <div class="tab-pane fade show active" id="tab1">
                ${info }
              </div><!-- End Tab 1 Content -->
              
              <div class="tab-pane fade show" id="tab2">
                <div class="row">
                  <c:forTokens items="${vo.c_imgs }" delims="^" var="image">
		            <img src="${image }" style="width: 30%" class="img-fluid" alt="">
		          </c:forTokens>
                </div>
              </div><!-- End Tab 2 Content -->
              
              <div class="tab-pane fade show" id="tab3">
                <div class="row">
                  <table class="table table-hover text-center">
                    <tr>
                      <th rowspan="2">구분</th>
                      <th colspan="2">평상시</th>
                      <th colspan="2">성수기</th>
                    </tr>
                    <tr>
                      <td>주중</td>
                      <td>주말</td>
                      <td>주중</td>
                      <td>주말</td>
                    </tr>
                    <tr>
                      <th>비용</th>
                      <td>30,000</td>
                      <td>30,000</td>
                      <td>30,000</td>
                      <td>30,000</td>
                    </tr>
                  </table>
                </div>
              </div><!-- End Tab 3 Content -->
              
            </div>
            
          </div>

        </div>
        <hr class="border border-primary opacity-75">
        <!-- 추가 -->
        <h4>캠핑장 소개</h4>
          ${vo.c_content }
        <hr class="border border-primary opacity-50">
          <h4>캠핑장 시설정보</h4>
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
        <hr class="border border-primary opacity-50">
          <h4>기타 주요시설</h4>
          ${etcinfo}
        <hr class="border border-primary opacity-50">
      </div>

    </section><!-- End About Section -->
    
    
    <!-- ======= Portfolio Section ======= -->
    <section id="portfolio" class="portfolio" data-aos="fade-up">

      <div class="container">

        <div class="section-header">
          <h2><i class="bi bi-images text-left" style="color: #0ea2bd;"></i>${vo.c_title }</h2>
          <p></p>
        </div>

      </div>

      <div class="container-fluid" data-aos="fade-up" data-aos-delay="200">

        <div class="portfolio-isotope" data-portfolio-filter="*" data-portfolio-layout="masonry" data-portfolio-sort="original-order">


          <div class="row g-0 portfolio-container">
			<c:forTokens items="${vo.c_gallery }" delims="^" var="image">
              <div class="col-xl-3 col-lg-4 col-md-6 portfolio-item">
	              <img src="${image }" style="width: 100%" class="img-fluid" alt="">

              </div><!-- End Portfolio Item -->
			</c:forTokens>
          </div><!-- End Portfolio Container -->

        </div>

      </div>
    </section><!-- End Portfolio Section -->
    
</body>
</html>