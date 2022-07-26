<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
  <main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <div class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <a href="../mypage/myhome.do"><h2 class="title">캠핑<sup>+</sup> 마이페이지</h2></a>
          <ol>
         <li><a href="../main/main.do" class="title" style="color:#0ea2bd;">Home</a></li>
            <li style="color:#0ea2bd; font-family: 'NanumSquareRound'">마이페이지</li>
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
                    <li><a href="../mypage/mypage_reserve.do">예약내역</a></li>
                    <li><a href="../mypage/mypage_order.do">결제내역</a></li>
                    <li><a href="../cart/cart_home.do">장바구니</a></li>
                  </ul>
                </div>
              </div>
              
              <div class="sidebar-item">
				<h3 class="sidebar-title title">내가 쓴 글</h3>
                <div class="mt-3">
                  <ul>
                    <li><a href="../mypage/mypage_qnaboard.do">묻고답하기</a></li>
                    <li><a href="../mypage/mypage_review.do">리뷰</a></li>
                  </ul>
                </div>
              </div>
              
              <div class="sidebar-item">
                <h3 class="sidebar-title title">회원정보 관리</h3>
                <div class="mt-3">
                  <ul>
                    <li><a href="../member/join_update_before.do">회원정보 수정</a></li>
                    <li><a href="../member/join_delete.do">회원 탈퇴</a></li>
                 
                  </ul>
                </div>
                
                
                  <div class="sidebar-item">
                <h3 class="sidebar-title title">찜 내역</h3>
                <div class="mt-3">
                  <ul>
                    <li><a href="../campgoods/jjim_list.do">찜 목록 관리</a></li>
                   
                 
                  </ul>
                </div>
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