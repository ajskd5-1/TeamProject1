<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<link rel="stylesheet" href="./style.css">


 
<style type="text/css">
section{
	margin-top: 100px;
	margin-bottom: 100px;
}

</style>
</head>
<body>
  <section id="hero-fullscreen" class="hero-fullscreen d-flex align-items-center">
    <div class="container d-flex flex-column align-items-center position-relative text-center" data-aos="zoom-out">
      <h2 style="font-size: 80px; font-family: 'BMJUA';">캠핑<sup><span>+</span></sup></h2>
      <p style="font-size: 40px; font-family: 'BMJUA';">캠핑을 시작한다면 이들처럼! 캠핑의 다양한 정보가 가득</p>
      
    </div>
  </section>

  <main id="main">

    <!-- ======= Featured Services Section ======= -->
    <section id="featured-services" class="featured-services">
      <div class="container">

        <div class="row gy-4">

          <div class="col-xl-3 col-md-6 d-flex" data-aos="zoom-out">
            <div class="service-item position-relative">
              <img src="https://img.icons8.com/emoji/48/000000/camping.png" style="width: 64px; height: 64px;"/>
              <h4><a href="" class="stretched-link">캠핑장</a></h4>
              <p>안전한 캠핑의 시작은? 캠핑플러스에서부터! 전국의 모든 캠핑장 정보를 제공합니다.</p>
            </div>
          </div><!-- End Service Item -->

          <div class="col-xl-3 col-md-6 d-flex" data-aos="zoom-out" data-aos-delay="200">
            <div class="service-item position-relative">
              <img src="data:image/png;base64,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" style="width:64px; height:64px;"/>
              <h4 style="margin : 10px 0px;"><a href="../campgoods/campgoods_list.do" class="stretched-link">캠핑용품</a></h4>
              <p>캠핑에 필요한 캠핑용품을 <br>탐색하고 구매할 수 있습니다<br>더불어 브랜드별로 제품을 찾아볼 수 있습니다</p>
            </div>
          </div><!-- End Service Item -->

          <div class="col-xl-3 col-md-6 d-flex" data-aos="zoom-out" data-aos-delay="400">
            <div class="service-item position-relative">
              <img src="../assets/img/main/main_recipe.png">
              <!-- <div class="icon"><i class="bi bi-calendar4-week icon"></i></div> -->
              <h4><a href="../recipe/recipe_category.do" class="stretched-link">캠핑 레시피</a></h4>
              <p>캠핑가서 뭐 먹지? 고민된다면 캠핑 레시피를 클릭해보세요</p>
            </div>
          </div><!-- End Service Item -->

          <div class="col-xl-3 col-md-6 d-flex" data-aos="zoom-out" data-aos-delay="600">
            <div class="service-item position-relative">
              <img src="../assets/img/main/qna.png" style="width: 55px; height: 65px; padding-bottom: 15px;">
              <!--<div class="icon"><i class="bi bi-broadcast icon"></i></div>-->
              <h4><a href="../qnaboard/list.do" class="stretched-link">문의</a></h4>
              <p>캠핑+ 사이트에 대해 궁금한 점이 생긴다면 언제든지 편하게 문의해주세요</p>
            </div>
          </div><!-- End Service Item -->

        </div>

      </div>
    </section><!-- End Featured Services Section -->

	<!-- ======= Team Section ======= -->
    <section id="team" class="team">
      <div class="container" data-aos="fade-up">

        <div class="section-header">
          <h2>캠핑장</h2>
          <p>Architecto nobis eos vel nam quidem vitae temporibus voluptates qui hic deserunt iusto omnis nam voluptas asperiores sequi tenetur dolores incidunt enim voluptatem magnam cumque fuga.</p>
        </div>

        <div class="row gy-5">

          <div class="col-xl-4 col-md-6 d-flex" data-aos="zoom-in" data-aos-delay="200">
            <div class="team-member">
              <div class="member-img">
                <img src="../assets/img/team/team-1.jpg" class="img-fluid" alt="">
              </div>
              <div class="member-info">
                <div class="social">
                  <a href=""><i class="bi bi-twitter"></i></a>
                  <a href=""><i class="bi bi-facebook"></i></a>
                  <a href=""><i class="bi bi-instagram"></i></a>
                  <a href=""><i class="bi bi-linkedin"></i></a>
                </div>
                <h4>Walter White</h4>
                <span>Chief Executive Officer</span>
              </div>
            </div>
          </div><!-- End Team Member -->

          <div class="col-xl-4 col-md-6 d-flex" data-aos="zoom-in" data-aos-delay="400">
            <div class="team-member">
              <div class="member-img">
                <img src="../assets/img/team/team-2.jpg" class="img-fluid" alt="">
              </div>
              <div class="member-info">
                <div class="social">
                  <a href=""><i class="bi bi-twitter"></i></a>
                  <a href=""><i class="bi bi-facebook"></i></a>
                  <a href=""><i class="bi bi-instagram"></i></a>
                  <a href=""><i class="bi bi-linkedin"></i></a>
                </div>
                <h4>Sarah Jhonson</h4>
                <span>Product Manager</span>
              </div>
            </div>
          </div><!-- End Team Member -->

          <div class="col-xl-4 col-md-6 d-flex" data-aos="zoom-in" data-aos-delay="600">
            <div class="team-member">
              <div class="member-img">
                <img src="../assets/img/team/team-3.jpg" class="img-fluid" alt="">
              </div>
              <div class="member-info">
                <div class="social">
                  <a href=""><i class="bi bi-twitter"></i></a>
                  <a href=""><i class="bi bi-facebook"></i></a>
                  <a href=""><i class="bi bi-instagram"></i></a>
                  <a href=""><i class="bi bi-linkedin"></i></a>
                </div>
                <h4>William Anderson</h4>
                <span>CTO</span>
              </div>
            </div>
          </div><!-- End Team Member -->

        </div>

      </div>
    </section><!-- End Team Section -->

     <!-- ======= Team Section ======= -->

	<section class="container">
		<h2 style=" font-family: 'BMJUA';">캠핑용품 인기순</h2>
		<div class="carousel">
			<div class="timeline"><div class="cursor"></div></div>
			<ul class="wrapper">
			  <c:forEach var="vo" items="${list }">
								<li class="card-slide item">
				<a href="../campgoods/campgoods_detail_before.do?g_id=${vo.g_id}"><img src="${vo.g_image }"></a>
					
				</li>
</c:forEach>
			</ul>
			<div class="controls">
				<button class="btn-prev btn btn-info">이전</button>
				<button class="btn-next btn btn-info">다음</button>
			</div>
		</div>


	</section>
	

    <!-- ======= Services Section ======= -->
    <section id="services" class="services" style="margin-bottom: 50px;">
      <div class="container" data-aos="fade-up">

        <div class="section-header">
          <h2><i class="bi bi-youtube" style="color: #0ea2bd;"></i>&nbsp;캠핑장 안전수칙 동영상</h2>
        </div>

        <div class="row gy-5">

          <c:forEach var="video" items="${vd_vo}">
            <div class="col-xl-4 col-md-6" data-aos="zoom-in" data-aos-delay="200" style="margin-bottom: 50px;">
              <div class="service-item" style="height: 250px;">
                <div class="img" style="height: 100%;">
                  <iframe width="100%" height="100%" src="${video.cv_link }?controls=1&showinfo=0&modestbranding=1"></iframe>
                </div>
                <div class="p-3 bg-info bg-opacity-10 border border-info border-start-0 rounded-end" style="margin-top: 10px;">
                  ${video.cv_title }
				</div>
              </div>
            </div><!-- End Service Item -->
		  </c:forEach>

        </div>
      </div>
    </section><!-- End Services Section -->


    <!-- ======= F.A.Q Section ======= -->
    <section id="faq" class="faq">
      <div class="container-fluid" data-aos="fade-up">

        <div class="row gy-4">

          <div class="col-lg-7 d-flex flex-column justify-content-center align-items-stretch  order-2 order-lg-1">

            <div class="content px-xl-5">
              <h3>캠핑<sup>+</sup><strong> 이런게 궁금해요</strong></h3>

            </div>

            <div class="accordion accordion-flush px-xl-5" id="faqlist">

              <div class="accordion-item" data-aos="fade-up" data-aos-delay="200">
                <h3 class="accordion-header">
                  <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq-content-1">
                    <i class="bi bi-question-circle question-icon"></i>
                    캠핑장에 반려동물과 함께 이용할 수 있나요
                  </button>
                </h3>
                <div id="faq-content-1" class="accordion-collapse collapse" data-bs-parent="#faqlist">
                  <div class="accordion-body">
                  </div>
                </div>
              </div><!-- # Faq item-->

              <div class="accordion-item" data-aos="fade-up" data-aos-delay="400">
                <h3 class="accordion-header">
                  <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq-content-3">
                    <i class="bi bi-question-circle question-icon"></i>
                    캠핑장 예약 취소 및 환불 규정이 어떻게 되나요
                  </button>
                </h3>
                <div id="faq-content-3" class="accordion-collapse collapse" data-bs-parent="#faqlist">
                  <div class="accordion-body">
                  </div>
                </div>
              </div><!-- # Faq item-->

              <div class="accordion-item" data-aos="fade-up" data-aos-delay="500">
                <h3 class="accordion-header">
                  <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq-content-4">
                    <i class="bi bi-question-circle question-icon"></i>
                    캠핑용품 재입고 알림을 받고싶어요
                  </button>
                </h3>
                <div id="faq-content-4" class="accordion-collapse collapse" data-bs-parent="#faqlist">
                  <div class="accordion-body">
                    <i class="bi bi-question-circle question-icon"></i>
                  </div>
                </div>
              </div><!-- # Faq item-->

              <div class="accordion-item" data-aos="fade-up" data-aos-delay="600">
                <h3 class="accordion-header">
                  <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq-content-5">
                    <i class="bi bi-question-circle question-icon"></i>
                    캠핑용품 환불 및 교환 규정이 궁금해요
                  </button>
                </h3>
                <div id="faq-content-5" class="accordion-collapse collapse" data-bs-parent="#faqlist">
                  <div class="accordion-body">
                  </div>
                </div>
              </div><!-- # Faq item-->

            </div>

          </div>
          <div class="col-lg-5 align-items-stretch order-1 order-lg-2 img" style='background-image: url("../assets/img/main/qna_camp.jpg");'>&nbsp;</div>
        </div>

      </div>
    </section><!-- End F.A.Q Section -->


    <!-- ======= Contact Section ======= -->
    

      

      
          

     
    
    <!-- START 추천 캠핑장 -->
    <section id="features" class="features">
    
    <div id="demo" class="carousel slide" data-bs-ride="carousel">
			
	  <!-- Indicators/dots -->
	  <div class="carousel-indicators">
	    <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active" style="background-color: black;"></button>
	    <button type="button" data-bs-target="#demo" data-bs-slide-to="1" style="background-color: black;"></button>
	    <button type="button" data-bs-target="#demo" data-bs-slide-to="2" style="background-color: black;"></button>
	  </div>
	  
	  <!-- The slideshow/carousel -->
	  <div class="carousel-inner">
	  
	    <div class="carousel-item active">
	      <div class="container" data-aos="fade-up">
	        <div class="tab-content">
	          <div class="tab-pane active show" id="tab-1">
	            <div class="row gy-4">
	              <div class="col-lg-8 order-2 order-lg-1" data-aos="fade-up" data-aos-delay="100">
	                <h3>Modinest</h3>
	                <p class="fst-italic">
	                  Lorem ipsum dolor sit amet, co
	                </p>
	                <ul>
	                  <li><i class="bi bi-check-circle-fill"></i> Ullamco laboris nisi ut aliquip ex ea commodo consequat.</li>
	                  <li><i class="bi bi-check-circle-fill"></i> Duis aute irure dolor in reprehenderit in voluptate velit.</li>
	                  <li><i class="bi bi-check-circle-fill"></i> Ullamco laboris nisi ut alrideta storacalaperda mastiro dolore eu fugiat nulla pariatur.</li>
	                </ul>
	              </div>
	              <div class="col-lg-4 order-1 order-lg-2 text-center" data-aos="fade-up" data-aos-delay="200">
	                <img src="../assets/img/features-1.svg" alt="" class="img-fluid">
	              </div>
	            </div>
	          </div><!-- End Tab Content 1 -->
	        </div>
	      </div>
        </div>
      
      <!-- asdf -->
	    <div class="carousel-item active">
	      <div class="container" data-aos="fade-up">
	        <div class="tab-content">
	          <div class="tab-pane active show" id="tab-1">
	            <div class="row gy-4">
	              <div class="col-lg-8 order-2 order-lg-1" data-aos="fade-up" data-aos-delay="100">
	                <h3>Modinest</h3>
	                <p class="fst-italic">
	                  Lorem ipsum dolor sit amet, co
	                </p>
	                <ul>
	                  <li><i class="bi bi-check-circle-fill"></i> Ullamco laboris nisi ut aliquip ex ea commodo consequat.</li>
	                  <li><i class="bi bi-check-circle-fill"></i> Duis aute irure dolor in reprehenderit in voluptate velit.</li>
	                  <li><i class="bi bi-check-circle-fill"></i> Ullamco laboris nisi ut alrideta storacalaperda mastiro dolore eu fugiat nulla pariatur.</li>
	                </ul>
	              </div>
	              <div class="col-lg-4 order-1 order-lg-2 text-center" data-aos="fade-up" data-aos-delay="200">
	                <img src="../assets/img/features-1.svg" alt="" class="img-fluid">
	              </div>
	            </div>
	          </div><!-- End Tab Content 1 -->
	        </div>
	      </div>
        </div>
      <!-- asdf -->
      
      </div>
      
      <!-- 화살표 -->
      <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
	    <span class="carousel-control-prev-icon" style="background-color: black;"></span>
	  </button>
	  <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
	    <span class="carousel-control-next-icon" style="background-color: black;"></span>
	  </button>
  	  <!-- 화살표 -->
  	  
      </div>
    </section>
	<!-- END 추천 캠핑장 -->

  </main><!-- End #main -->
  <!-- partial -->
  <script  src="./script.js"></script>
</body>
</html>