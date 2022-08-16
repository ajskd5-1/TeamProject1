<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
          <h2 class="title">마이페이지</h2>
          <ol>
            <li><a href="index.html">Home</a></li>
            <li>마이페이지</li>
          </ol>
        </div>

      </div>
    </div><!-- End Breadcrumbs -->

    <!-- ======= Blog Section ======= -->
    <section id="blog" class="blog">
      <div class="container" data-aos="fade-up">

        <div class="row g-5">
        
		  <div class="col-lg-3">

            <div class="sidebar">

              <div class="sidebar-item search-form">
                <h3 class="sidebar-title title">Search</h3>
                <form action="" class="mt-3">
                  <input type="text">
                  <button type="submit"><i class="bi bi-search"></i></button>
                </form>
              </div><!-- End sidebar search formn-->

              <div class="sidebar-item categories">
                <h3 class="sidebar-title title">Categories</h3>
                <ul class="mt-3">
                  <li><a href="#">General <span>(25)</span></a></li>
                  <li><a href="#">Lifestyle <span>(12)</span></a></li>
                  <li><a href="#">Travel <span>(5)</span></a></li>
                  <li><a href="#">Design <span>(22)</span></a></li>
                  <li><a href="#">Creative <span>(8)</span></a></li>
                  <li><a href="#">Educaion <span>(14)</span></a></li>
                </ul>
              </div><!-- End sidebar categories-->

              <div class="sidebar-item recent-posts">
                <h3 class="sidebar-title title">회원정보 관리</h3>

                <div class="mt-3">
				  <a href="../member/join_update.do">회원정보 수정</a> <br>
				  회원 탈퇴
                </div>

              </div><!-- End sidebar recent posts-->


            </div><!-- End Blog Sidebar -->

          </div>

          <div class="col-lg-9"><%-- 홈 --%>

            <div class="row gy-4 posts-list">
			  <jsp:include page="${mypage_jsp }"></jsp:include>
              

            </div><!-- End blog posts list -->
          </div>

          

        </div>

      </div>
    </section><!-- End Blog Section -->

  </main><!-- End #main -->
</body>
</html>