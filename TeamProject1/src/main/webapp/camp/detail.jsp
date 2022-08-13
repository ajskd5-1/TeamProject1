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
            <li><a href="../camp/list.do">${vo.c_title }</a></li>
          </ol>
        </div>

      </div>
    </div><!-- End Breadcrumbs -->
	<!-- ======= About Section ======= -->
    <section id="about" class="about">
      <div class="container" data-aos="fade-up">

        <div class="section-header">
          <h2>${vo.c_title }</h2>
          <!-- <p>Architecto nobis eos vel nam quidem vitae temporibus voluptates qui hic deserunt iusto omnis nam voluptas asperiores sequi tenetur dolores incidunt enim voluptatem magnam cumque fuga.</p> -->
        </div>

        <div class="row g-4 g-lg-5" data-aos="fade-up" data-aos-delay="200">

          <div class="col-lg-5">
            <div>
              <img src="${vo.c_poster }" class="img-fluid" alt="">
            </div>
          </div>

          <div class="col-lg-7">
            <h3 class="pt-0 pt-lg-5" style="font-size: 20px;">${vo.c_content }</h3>

            <!-- Tabs -->
            <ul class="nav nav-pills mb-3">
              <li><a class="nav-link active" data-bs-toggle="pill" href="#tab1">캠핑장 기본정보</a></li>
              <li><a class="nav-link" data-bs-toggle="pill" href="#tab2">사진</a></li>
              <li><a class="nav-link" data-bs-toggle="pill" href="#tab3">이용안내</a></li>
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
              
            </div>
            
          </div>

        </div>
        <!-- 추가 -->
        ${vo.c_content }
        <hr>
        ${vo.c_info2 }
        <hr>
        ${etcinfo}
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