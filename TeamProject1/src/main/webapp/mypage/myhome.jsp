<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.myInfo th{
	width: 30%;
}
</style>
</head>
<body>
  <main id="main">
    <section id="blog" class="blog" style="margin-top: -60px;">
      
      <div class="container" data-aos="fade-up">

        <div class="row g-5">

          <div class="col-lg-12">

            <article class="blog-details">
            
            <!-- ======= About Section ======= -->
			    <section id="about" class="about" style="margin-top: 20px; background-color: #ebebed;">
			      <div class="container" data-aos="fade-up">
			        <div class="row g-4 g-lg-5" data-aos="fade-up" data-aos-delay="200">
			
			          <div class="col-lg-4 text-center">
			            <div class="img" style="margin-top: 30px;">
			              <img src="https://img.icons8.com/pastel-glyph/64/000000/person-male--v3.png" style="width: 100px; height: 100px;">
			            </div>
			            <!-- <input type="button" class="btn btn-sm btn-info" value="수정"> -->
			          </div>
			
			          <div class="col-lg-8" style="margin-top: 0px;">
			            <h3 class="title">${vo.nickname }님 안녕하세요</h3>
			            <table class="myInfo" style="margin-top: 30px; margin-bottom: 30px;">
			              <tr>
			                <th>이름</th>
			                <td>${vo.name }</td>
			              </tr>
			              <tr>
			                <th>전화번호</th>
			                <td>${vo.tel }</td>
			              </tr>
			              <tr>
			                <th>이메일</th>
			                <td>${vo.email }</td>
			              </tr>
			              <tr>
			                <th>주소</th>
			                <td>${vo.addr1 }</td>
			              </tr>
			            </table>
			            <div style="margin-left: 20px;">
			              <input type="button" class="btn btn-sm btn-primary" value="회원정보 수정" style="width: 100px;" onclick="location.href='../member/join_update_before.do'">&nbsp;
			              <input type="button" class="btn btn-sm btn-success" value="비밀번호 수정" style="width: 100px;" onclick="location.href='../member/pwd_update.do'">&nbsp;
			              <input type="button" class="btn btn-sm btn-danger" value="회원탈퇴" style="width: 100px;" onclick="location.href='../member/join_delete.do'">
			            </div>
			          </div>

			        </div>
			      </div>
			    </section><!-- End About Section -->
			    
              <div class="content">
				<h2 class="title">최근 예약내역</h2>
              	<table class="table table-hover">
              	  <thead class="table-info">
                    <tr class="text-left">
                      <th>예약번호</th>
                      <th>캠핑장</th>
                      <th>예약일</th>
                      <th>인원수</th>
                      <th>등록일</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>${rvo.no }</td>
                      <td>${title}</td>
                      <td>${date }</td>
                      <td>${rvo.inwon }</td>
                      <td>${rvo.dbday }</td>
                    </tr>
                  </tbody>
                </table>
                <!-- <input type="text" class="btn btn-sm btn-primary" value="더보기" style="float: right;"> -->
                <a href="../mypage/mypage_reserve.do" class="btn btn-sm btn-primary" style="float: right;">더보기</a>
                <br>
                <hr>
                
                <h2 class="title">최근 결제내역</h2>
              	<table class="table table-hover">
              	  <thead class="table-info">
                    <tr class="text-left">
                      <th width="15%">결제번호</th>
                      <th width="15%">수령인</th>
                      <th width="55%">주소</th>
                      <th width="15%">결제 금액</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td width="15%">${ovo.no }</td>
                      <td width="15%">${ovo.o_name }</td>
                      <td>${addr}</td>
                      <td>${ovo.o_total }원</td>
                    </tr>
                  </tbody>
                </table>
                <a href="../mypage/mypage_order.do" class="btn btn-sm btn-primary" style="float: right;">더보기</a>
                <br>
                <hr>
                
                <h2 class="title">내가 작성한 문의사항</h2>
              	<table class="table table-hover">
              	  <thead class="table-info">
                    <tr>
                      <th>글번호</th>
                      <th>글제목</th>
                      <th>작성일</th>
                      <th>조회수</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach var="qvo" items="${q_list }">
                      <tr>
                        <td>${qvo.no }</td>
                        <td>${qvo.title }</td>
                        <td>${qvo.dbday }</td>
                        <td>${qvo.count }</td>
                      </tr>
                    </c:forEach>
                  </tbody>
                </table>
                <a href="../mypage/mypage_qnaboard.do" class="btn btn-sm btn-primary" style="float: right;">더보기</a>
                <br>
                <hr>
              </div><!-- End post content -->

              <div class="meta-bottom">
                <i class="bi"></i>

              </div><!-- End meta bottom -->

            </article><!-- End blog post -->

          </div>

        </div>

      </div>
    </section><!-- End Blog Details Section -->

  </main><!-- End #main -->
</body>
</html>