<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css'><link rel="stylesheet" href="./style.css">
  <link rel="stylesheet" href="./style_cart.css">

<style type="text/css">

p1{color:#0ea2bd;
font-family: 'BMJUA';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMJUA.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
p2{color:#4C4C4C;
@font-face {
    font-family: 'NanumSquareRound';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/NanumSquareRound.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
li{
@font-face {
    font-family: 'NanumSquareRound';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/NanumSquareRound.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
}
div.arrow{


@font-face {
    font-family: 'NanumSquareRound';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/NanumSquareRound.woff') format('woff');
    font-weight: bold;
    font-style: normal;
}

}
}
</style>
</head>
<body>
<main id="main">

    <!-- ======= Breadcrumbs ======= -->
      <div class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
         <a href="../campgoods/campgoods_list.do"><h2 class="title" style="color:#0ea2bd;">캠핑<sup>+</sup> 캠핑용품</h2></a>
          <ol>
            <li ><a href="../main/main.do" class="title" style="color:#0ea2bd;" >Home</a></li>
            <li>CampGoods_list</li>
             <li>CampGoods_detail</li>
          </ol>
        </div>

      </div>
    </div>  
      
      
    <!-- ======= Blog Details Section ======= -->
    <section id="blog" class="blog">
      <div class="container" data-aos="fade-up">

        <div class="row g-5">
		<!-- 용품 사진 -->
          <div class="col-lg-6">
              <div class="post-img">
                <img src="${vo.g_image }" alt="" class="img-fluid">
              </div>
         
          </div><!--  사진 -->
          <!-- 용품 이름, 가격 브랜드 -->
          <div class="col-lg-6">
            <article class="blog-details">
              <h2 class="title" style="font-size: 18pt; color:#008299;">${vo.g_name }</h2>
                <div class="content">
              <blockquote>
                <img src="../campgoods/best-price.png" style="width:60px; heigh:60px;"><p1 style="font-size: 23pt;  font-weight: bold;"><br>${vo.g_price/10000 }원</p1>
                <br>
                 <br>
                  
                 <img src="../campgoods/brand-image.png" style="width:60px; heigh:60px;"><p2 style="font-size: 15pt; font-weight: bold;"><br> * ${vo.g_brand } *</p2>
                 
               </blockquote>
   <div id="content">
    <div class="arrow" style="font-weight: bold;">장바구니 담기</div>
  </div>
         
              </div><!-- End post content -->
              
            </article><!-- End blog post -->
          </div><!-- 용품 상세이미지 -->
          <hr style="color: gray; margin: 150px 0px 100px;">
          <div class="col-lg-12"><!-- 캠핑용품 상세이미지 -->
            	<div class="campgoods_detail" style="text-align: center">
            	<img src="${vo.g_detail }"/>
            	</div>
          </div>

          
			


        </div>

      </div>
    </section><!-- End Blog Details Section -->

  </main><!-- End #main -->
</body>
</html>