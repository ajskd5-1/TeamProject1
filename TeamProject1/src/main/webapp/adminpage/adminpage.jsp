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
          <h2 class="title">관리자페이지</h2>
          <ol>
            <li><a href="index.html">Home</a></li>
            <li>관리자페이지</li>
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
            
              <div class="sidebar-item">
				<h3 class="sidebar-title title">예약/결제내역</h3>
                <div class="mt-3">
                  <ul>
                    <li><a href="#">예약내역</a></li>
                    <li><a href="#">결제내역</a></li>
                  </ul>
                </div>
              </div>
              
              <div class="sidebar-item">
				<h3 class="sidebar-title title">문의게시판 관리</h3>
                <div class="mt-3">
                  <ul>
                    <li><a href="#">답변</a></li>
                  </ul>
                </div>
              </div>

              </div><!-- End sidebar recent posts-->


            </div><!-- End Blog Sidebar -->

          

          <div class="col-lg-9"><%-- 홈 --%>
			<h1 class="title" style="margin-top: -60px; margin-left: 15px;"> 관리자페이지</h1>
            <div class="row gy-4 posts-list">
			  <jsp:include page="${adminpage_jsp }"></jsp:include>
              

            </div><!-- End blog posts list -->
          </div>
        </div>
      </div>
    </section><!-- End Blog Section -->

  </main><!-- End #main -->
</body>
</html>