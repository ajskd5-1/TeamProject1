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
			              <img src="../adminpage/user.png" style="width: 100px; height: 100px;">
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
			          </div>

			        </div>
			      </div>
			    </section><!-- End About Section -->
			    
              <div class="content">
				<h2 class="title">예약내역</h2>
              	<table class="table table-hover">
                  <tr class="text-center">
                    <th>예약번호</th>
                    <th>캠핑장</th>
                    <th>예약일</th>
                    <th>인원수</th>
                    <th>가격</th>
                  </tr>
                  <tr>
                    <td>12</td>
                    <td>1</td>
                    <td>2</td>
                    <td>3</td>
                    <td>4</td>
                  </tr>
                </table>
                <input type="text" class="btn btn-sm btn-primary" value="더보기" style="float: right;">
                <br>
                <hr>
                
                <h2 class="title">결제내역</h2>
              	<table class="table table-hover">
                  <tr class="text-center">
                    <th>결제번호</th>
                    <th>상품</th>
                    <th>수량</th>
                    <th>가격</th>
                  </tr>
                  <tr>
                    <td>1</td>
                    <td>2</td>
                    <td>3</td>
                    <td>4</td>
                  </tr>
                </table>
                <input type="text" class="btn btn-sm btn-primary" value="더보기" style="float: right;">
                <br>
                <hr>
                
                <h2 class="title">내가 답변한 문의사항</h2>
              	<table class="table table-hover">
                  <tr class="text-center">
                    <th>글제목</th>
                    <th>작성일</th>
                  </tr>
                  <tr style="background-color: #1ec3e0">
                    <td>글제목123</td>
                    <td>작성일123</td>
                  </tr>
                </table>
                <input type="text" class="btn btn-sm btn-primary" value="더보기" style="float: right;">
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