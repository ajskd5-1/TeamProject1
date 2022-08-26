<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@font-face {
    font-family: 'NanumSquareRound';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/NanumSquareRound.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'BMJUA';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMJUA.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
*,span{
	font-family: 'NanumSquareRound';
	font-weight: bold;
}
.title{
	font-family: 'BMJUA';
}
</style>
</head>
<body>
<main id="main">

    <!-- ======= 페이지 상단 ======= -->
    <div class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <a href="../recipe/recipe_category.do"><h2 class="title">카테고리별 레시피</h2></a>
          <ol>
            <li><a href="../main/main.do" class="title" style="color:#0ea2bd;">Home</a></li>
            <li style="color:#0ea2bd;">recipe_category</li>
          </ol>
        </div>

      </div>
    </div>

    <!-- ======= Features Section ======= -->
    <section id="features" class="features" style="padding: 0px;">
      <div class="container" data-aos="fade-up">

        <ul class="nav nav-tabs row gy-4 d-flex">

          <li class="nav-item col-6 col-md-4 col-lg-2">
            <a class="nav-link active show" data-bs-toggle="tab" data-bs-target="#tab-1">
              <i class="bi bi-fire color-red"></i>
              <span style="text-align: center; margin-top: 20px; font-weight: bold; text-shadow:1px 1px 1px #fff; font-size: 16pt;">불멍 때리면서 구워먹는 꼬치 요리</span>
            </a>
          </li><!-- End Tab 1 Nav -->

          <li class="nav-item col-6 col-md-4 col-lg-2">
            <a class="nav-link" data-bs-toggle="tab" data-bs-target="#tab-2">
              <i class="bi bi-moon-stars-fill color-black"></i>
              <span style="text-align: center; margin-top: 20px; font-weight: bold; text-shadow:1px 1px 1px #fff; font-size: 16pt;">캠핑의 밤이 무르익을 때</span>
            </a>
          </li><!-- End Tab 2 Nav -->

          <li class="nav-item col-6 col-md-4 col-lg-2">
            <a class="nav-link" data-bs-toggle="tab" data-bs-target="#tab-3">
              <i class="bi bi-brightness-alt-high color-orange"></i>
              <span style="text-align: center; margin-top: 20px; font-weight: bold; text-shadow:1px 1px 1px #fff; font-size: 16pt;">아침엔 얼큰한 국물으로 해장하기</span>
            </a>
          </li><!-- End Tab 3 Nav -->

          <li class="nav-item col-6 col-md-4 col-lg-2">
            <a class="nav-link" data-bs-toggle="tab" data-bs-target="#tab-4">
              <i class="bi bi-cup-straw color-yellow"></i>
              <span style="text-align: center; margin-top: 20px; font-weight: bold; text-shadow:1px 1px 1px #fff; font-size: 16pt;">후식으로 기분 UP!UP!</span>
            </a>
          </li><!-- End Tab 4 Nav -->

          <li class="nav-item col-6 col-md-4 col-lg-2">
            <a class="nav-link" data-bs-toggle="tab" data-bs-target="#tab-5">
              <i class="bi bi-speedometer2 color-blue"></i>
              <span style="text-align: center; margin-top: 20px; font-weight: bold; text-shadow:1px 1px 1px #fff; font-size: 16pt;">캠핑에서도 다이어트는 계속된다</span>
            </a>
          </li><!-- End Tab 5 Nav -->

          <li class="nav-item col-6 col-md-4 col-lg-2">
            <a class="nav-link" data-bs-toggle="tab" data-bs-target="#tab-6">
              <i class="bi bi-emoji-laughing color-orange"></i>
              <span style="text-align: center; margin-top: 20px; font-weight: bold; text-shadow:1px 1px 1px #fff; font-size: 16pt;">우리 아이를 위한 맞춤 요리</span>
            </a>
          </li><!-- End Tab 6 Nav -->
        </ul>
		<br><br>
        <div class="tab-content col-md-10 offset-md-1 col-lg-10 offset-lg-1">

          <div class="tab-pane active show" id="tab-1">
            <div class="row gy-4">
              <div class="col-md-10 offset-md-1 col-lg-10 offset-lg-1" data-aos="fade-up" data-aos-delay="100">
                <h4 style="text-align: center; font-size: 22pt;"><span class="title" style=" background-color:#bed5d93b">[&nbsp;&nbsp;&nbsp;불멍 때리면서 구워먹는 바베큐 꼬치&nbsp;&nbsp;&nbsp;]</span></h4>
                <br><br><br><br>
                <c:forEach items="${list }" var="vo">
                <c:if test="${vo.cr_cno==1 }">
	            <div class="post-author d-flex align-items-center">
	              <a href="../recipe/recipe_detail_before.do?cr_no=${vo.cr_no}"><img src="${vo.cr_poster }" style="width: 150px; height: 150px;" class="rounded-circle flex-shrink-0" alt=""></a>
	              <div>&nbsp;&nbsp;&nbsp;</div>
	              <div >
	                <a href="../recipe/recipe_detail_before.do?cr_no=${vo.cr_no}"><span class="title" style="font-size: 16pt;">${vo.cr_title }</span></a>
	                <div class="social-links">
                      <i class="bi bi-person"></i>
                      <i class="bi bi-clock"></i>
                      <i class="bi bi-chat-dots"></i>
	                </div>
	                <p>
	                  ${vo.cr_subject }
	                </p>
	              </div>
	            </div><!-- End post author -->
	            <br><br>
	            </c:if>
	            </c:forEach>			
              </div>
            </div>
          </div><!-- End Tab Content 1 -->

          <div class="tab-pane" id="tab-2">
             <div class="row gy-4">
              <div class="col-md-10 offset-md-1 col-lg-10 offset-lg-1" data-aos="fade-up" data-aos-delay="100">
                <h4 style="text-align: center; font-size: 22pt;"><span class="title" style=" background-color:#bed5d93b">[&nbsp;&nbsp;&nbsp;캠핑의 밤이 무르익을 때&nbsp;&nbsp;&nbsp;]</span></h4>
                <br><br><br><br>
                <c:forEach items="${list }" var="vo">
                <c:if test="${vo.cr_cno==5 }">
	            <div class="post-author d-flex align-items-center">
	              <a href="../recipe/recipe_detail_before.do?cr_no=${vo.cr_no}"><img src="${vo.cr_poster }" style="width: 150px; height: 150px;" class="rounded-circle flex-shrink-0" alt=""></a>
	              <div>&nbsp;&nbsp;&nbsp;</div>
	              <div >
	                <a href="../recipe/recipe_detail_before.do?cr_no=${vo.cr_no}"><span class="title" style="font-size: 16pt;">${vo.cr_title }</span></a>
	                <div class="social-links">
                      <i class="bi bi-person"></i>
                      <i class="bi bi-clock"></i>
                      <i class="bi bi-chat-dots"></i>
	                </div>
	                <p>
	                  ${vo.cr_subject }
	                </p>
	              </div>
	            </div><!-- End post author -->
	            <br><br>
	            </c:if>
	            </c:forEach>			
              </div>
            </div>
          </div><!-- End Tab Content 2 -->

          <div class="tab-pane" id="tab-3">
                       <div class="row gy-4">
              <div class="col-md-10 offset-md-1 col-lg-10 offset-lg-1" data-aos="fade-up" data-aos-delay="100">
                <h4 style="text-align: center; font-size: 22pt;"><span class="title" style=" background-color:#bed5d93b">[&nbsp;&nbsp;&nbsp;아침엔 얼큰한 국물으로 해장하기&nbsp;&nbsp;&nbsp;]</span></h4>
                <br><br><br><br>
                <c:forEach items="${list }" var="vo">
                <c:if test="${vo.cr_cno==2 }">
	            <div class="post-author d-flex align-items-center">
	              <a href="../recipe/recipe_detail_before.do?cr_no=${vo.cr_no}"><img src="${vo.cr_poster }" style="width: 150px; height: 150px;" class="rounded-circle flex-shrink-0" alt=""></a>
	              <div>&nbsp;&nbsp;&nbsp;</div>
	              <div >
	                <a href="../recipe/recipe_detail_before.do?cr_no=${vo.cr_no}"><span class="title" style="font-size: 16pt;">${vo.cr_title }</span></a>
	                <div class="social-links">
                      <i class="bi bi-person"></i>
                      <i class="bi bi-clock"></i>
                      <i class="bi bi-chat-dots"></i>
	                </div>
	                <p>
	                  ${vo.cr_subject }
	                </p>
	              </div>
	            </div><!-- End post author -->
	            <br><br>
	            </c:if>
	            </c:forEach>			
              </div>
            </div>
          </div><!-- End Tab Content 3 -->

          <div class="tab-pane" id="tab-4">
                       <div class="row gy-4">
              <div class="col-md-10 offset-md-1 col-lg-10 offset-lg-1" data-aos="fade-up" data-aos-delay="100">
               <h4 style="text-align: center; font-size: 22pt;"><span class="title" style=" background-color:#bed5d93b">[&nbsp;&nbsp;&nbsp;후식으로 기분 UP!UP!&nbsp;&nbsp;&nbsp;]</span></h4>
                <br><br><br><br>
                <c:forEach items="${list }" var="vo">
                <c:if test="${vo.cr_cno==7 }">
	            <div class="post-author d-flex align-items-center">
	              <a href="../recipe/recipe_detail_before.do?cr_no=${vo.cr_no}"><img src="${vo.cr_poster }" style="width: 150px; height: 150px;" class="rounded-circle flex-shrink-0" alt=""></a>
	              <div>&nbsp;&nbsp;&nbsp;</div>
	              <div >
	                <a href="../recipe/recipe_detail_before.do?cr_no=${vo.cr_no}"><span class="title" style="font-size: 16pt;">${vo.cr_title }</span></a>
	                <div class="social-links">
                      <i class="bi bi-person"></i>
                      <i class="bi bi-clock"></i>
                      <i class="bi bi-chat-dots"></i>
	                </div>
	                <p>
	                  ${vo.cr_subject }
	                </p>
	              </div>
	            </div><!-- End post author -->
	            <br><br>
	            </c:if>
	            </c:forEach>			
              </div>
            </div>
          </div><!-- End Tab Content 4 -->

          <div class="tab-pane" id="tab-5">
                       <div class="row gy-4">
              <div class="col-md-10 offset-md-1 col-lg-10 offset-lg-1" data-aos="fade-up" data-aos-delay="100">
                <h4 style="text-align: center; font-size: 22pt;"><span class="title" style=" background-color:#bed5d93b">[&nbsp;&nbsp;&nbsp;캠핑에서도 다이어트는 계속된다&nbsp;&nbsp;&nbsp;]</span></h4>
                <br><br><br><br>
                <c:forEach items="${list }" var="vo">
                <c:if test="${vo.cr_cno==9 }">
	            <div class="post-author d-flex align-items-center">
	              <a href="../recipe/recipe_detail_before.do?cr_no=${vo.cr_no}"><img src="${vo.cr_poster }" style="width: 150px; height: 150px;" class="rounded-circle flex-shrink-0" alt=""></a>
	              <div>&nbsp;&nbsp;&nbsp;</div>
	              <div >
	                <a href="../recipe/recipe_detail_before.do?cr_no=${vo.cr_no}"><span class="title" style="font-size: 16pt;">${vo.cr_title }</span></a>
	                <div class="social-links">
                      <i class="bi bi-person"></i>
                      <i class="bi bi-clock"></i>
                      <i class="bi bi-chat-dots"></i>
	                </div>
	                <p>
	                  ${vo.cr_subject }
	                </p>
	              </div>
	            </div><!-- End post author -->
	            <br><br>
	            </c:if>
	            </c:forEach>			
              </div>
            </div>
          </div><!-- End Tab Content 5 -->

          <div class="tab-pane" id="tab-6">
                       <div class="row gy-4">
              <div class="col-md-10 offset-md-1 col-lg-10 offset-lg-1" data-aos="fade-up" data-aos-delay="100">
                <h4 style="text-align: center; font-size: 22pt;"><span class="title" style=" background-color:#bed5d93b">[&nbsp;&nbsp;&nbsp;우리 아이를 위한 맞춤 요리&nbsp;&nbsp;&nbsp;]</span></h4>
                <br><br><br><br>
                <c:forEach items="${list }" var="vo">
                <c:if test="${vo.cr_cno==13 }">
	            <div class="post-author d-flex align-items-center">
	              <a href="../recipe/recipe_detail_before.do?cr_no=${vo.cr_no}"><img src="${vo.cr_poster }" style="width: 150px; height: 150px;" class="rounded-circle flex-shrink-0" alt=""></a>
	              <div>&nbsp;&nbsp;&nbsp;</div>
	              <div >
	                <a href="../recipe/recipe_detail_before.do?cr_no=${vo.cr_no}"><span class="title" style="font-size: 16pt;">${vo.cr_title }</span></a>
	                <div class="social-links">
                      <i class="bi bi-person"></i>
                      <i class="bi bi-clock"></i>
                      <i class="bi bi-chat-dots"></i>
	                </div>
	                <p>
	                  ${vo.cr_subject }
	                </p>
	              </div>
	            </div><!-- End post author -->
	            <br><br>
	            </c:if>
	            </c:forEach>			
              </div>
            </div>
          </div><!-- End Tab Content 6 -->

        </div>

      </div>
    </section><!-- End Features Section -->
</main>
</body>
</html>