<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <main id="main">

    <!-- ======= Intro Single ======= -->
    <section class="intro-single">
      <div class="container">
        <div class="row">
          <div class="col-md-12 col-lg-8">
            <div class="title-single-box">
              <h1 class="title-single">${vo.vd_title }</h1>
              <span class="color-text-a">${vo.vd_subtitle }</span>
            </div>
          </div>
          <div class="col-md-12 col-lg-4">
            <nav aria-label="breadcrumb" class="breadcrumb-box d-flex justify-content-lg-end">
              <ol class="breadcrumb">
                <li class="breadcrumb-item">
                  <a href="index.html">Home</a>
                </li>
                <li class="breadcrumb-item">
                  <a href="property-grid.html">Properties</a>
                </li>
                <li class="breadcrumb-item active" aria-current="page">
                  304 Blaster Up
                </li>
              </ol>
            </nav>
          </div>
        </div>
      </div>
    </section><!-- End Intro Single-->

    <!-- ======= Property Single ======= -->
    <section class="property-single nav-arrow-b">
      <div class="container">
      	<!-- 사진 & 강의 기본 정보 -->
           <div class="col-md-12">
            <div class="row section-t3">
              <div class="col-sm-12">
              </div>
            </div>
            <div class="row">
              <div class="col-md-4 offset-md-1 col-lg-4 offset-lg-1">
                <img src="${vo.vd_poster }" alt="" style="width:400px; height:300px; border-radius:50px" >
              </div>
              <div class="col-md-5 col-lg-5">
                 <div class="property-summary">
                  <div class="row">
                    <div class="col-sm-12">
                    <div class="title-box-d">
                      <h3 class="title-d">강의 정보</h3>
                    </div>
                    </div>
                  </div>
                  <div class="summary-list">
                    <ul class="list">
                      <li class="d-flex justify-content-between">
                        <strong>신청기한 : </strong>
                        <span>${vo.vd_deadline }</span>
                      </li>
                      <li class="d-flex justify-content-between">
                        <strong>교육기간 : </strong>
                        <span>${vo.vd_term }</span>
                      </li>
                      <li class="d-flex justify-content-between">
                        <strong>이수시간 : </strong>
                        <span>${vo.vd_time }</span>
                      </li>
                      <li class="d-flex justify-content-between">
                        <strong>교재정보 : </strong>
                        <span>${vo.vd_book }</span>
                      </li>
                      <li class="d-flex justify-content-between">
                        <strong>정원 : </strong>
                        <span>${vo.vd_people }</span>
                      </li>
                      <li class="d-flex justify-content-between">
                        <strong>난이도 : </strong>
                        <span>${vo.vd_level }</span>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
              
             <div class="row" style="padding:30px;"></div>
       	<!-- 강의 소개~목차 --> 
       	      <div class="col-md-9 offset-md-1 col-lg-9 offset-lg-1">
                <div class="row">
                  <div class="col-sm-12">
                    <div class="title-box-d">
                      <h3 class="title-d">강의 소개</h3>
                    </div>
                  </div>
                </div>
                <div class="property-description">
                  <p class="description color-text-a">
                   ${vo.vd_intro }
                  </p>
                </div>
              <br>
              <br>
              <br>
                <div class="row">
                  <div class="col-sm-12">
                    <div class="title-box-d">
                      <h3 class="title-d">수료 기준</h3>
                    </div>
                  </div>
                </div>
                <div class="property-description">
                  <p class="description color-text-a">
                   ${vo.vd_cend }
                  </p>
                </div>
              <br>
              <br>
                <div class="row section-t3">
                  <div class="col-sm-12">
                    <div class="title-box-d">
                      <h3 class="title-d">강의 목차</h3>
                    </div>
                  </div>
                </div>
                <div class="amenities-list color-text-a">
                  <ul class="list-a no-margin">
					${vo.vd_list }
                  </ul>
                </div>
              </div>
			<div class="row" style="padding:30px;"></div>
       	     
		<!-- 리뷰와 댓글 --> 
		<div class="col-md-9 offset-md-1 col-lg-9 offset-lg-1">
            <div class="title-box-d">
              <h3 class="title-d">Comments (4)</h3>
            </div>
            <div class="box-comments">
              <ul class="list-comments">
                <li>
                  <div class="comment-avatar">
                    <img src="assets/img/author-2.jpg" alt="">
                  </div>
                  <div class="comment-details">
                    <h4 class="comment-author">Emma Stone</h4>
                    <span>18 Sep 2017</span>
                    <p class="comment-description">
                      Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolores reprehenderit, provident cumque
                      ipsam temporibus maiores
                      quae natus libero optio, at qui beatae ducimus placeat debitis voluptates amet corporis.
                    </p>
                    <a href="3">Reply</a>
                  </div>
                </li>
                <li class="comment-children">
                  <div class="comment-avatar">
                    <img src="assets/img/author-1.jpg" alt="">
                  </div>
                  <div class="comment-details">
                    <h4 class="comment-author">Oliver Colmenares</h4>
                    <span>18 Sep 2017</span>
                    <p class="comment-description">
                      Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolores reprehenderit, provident cumque
                      ipsam temporibus maiores
                      quae.
                    </p>
                    <a href="3">Reply</a>
                  </div>
                </li>
                <li>
                  <div class="comment-avatar">
                    <img src="assets/img/author-2.jpg" alt="">
                  </div>
                  <div class="comment-details">
                    <h4 class="comment-author">Emma Stone</h4>
                    <span>18 Sep 2017</span>
                    <p class="comment-description">
                      Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolores reprehenderit, provident cumque
                      ipsam temporibus maiores
                      quae natus libero optio.
                    </p>
                    <a href="3">Reply</a>
                  </div>
                </li>
              </ul>
            </div>
            <div class="form-comments">
              <div class="title-box-d">
                <h3 class="title-d"> Leave a Reply</h3>
              </div>
              <form class="form-a">
                <div class="row">
                  <div class="col-md-6 mb-3">
                    <div class="form-group">
                      <label for="inputName">Enter name</label>
                      <input type="text" class="form-control form-control-lg form-control-a" id="inputName" placeholder="Name *" required>
                    </div>
                  </div>
                  <div class="col-md-6 mb-3">
                    <div class="form-group">
                      <label for="inputEmail1">Enter email</label>
                      <input type="email" class="form-control form-control-lg form-control-a" id="inputEmail1" placeholder="Email *" required>
                    </div>
                  </div>
                  <div class="col-md-12 mb-3">
                    <div class="form-group">
                      <label for="inputUrl">Enter website</label>
                      <input type="url" class="form-control form-control-lg form-control-a" id="inputUrl" placeholder="Website">
                    </div>
                  </div>
                  <div class="col-md-12 mb-3">
                    <div class="form-group">
                      <label for="textMessage">Enter message</label>
                      <textarea id="textMessage" class="form-control" placeholder="Comment *" name="message" cols="45" rows="8" required></textarea>
                    </div>
                  </div>
                  <div class="col-md-12">
                    <button type="submit" class="btn btn-a">Send Message</button>
                  </div>
                </div>
              </form>
            </div>
          </div>
            </div>
          </div>

 
      </div>
    </section><!-- End Property Single-->

  </main><!-- End #main -->
</body>
</html>