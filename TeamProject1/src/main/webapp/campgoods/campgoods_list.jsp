<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>CodePen - Product List (Grid Template)</title>
  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css'><link rel="stylesheet" href="./style_list.css">
  

    
<style type="text/css">
@font-face {
    font-family: 'BMJUA';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMJUA.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'NanumSquareRound';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/NanumSquareRound.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
a:hover{

color:#ffffff;
}

</style>
</head>
<body>
      <div class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
         <a href="../campgoods/campgoods_list.do"><h2 class="title" style="color:#0ea2bd;">캠핑<sup>+</sup> 캠핑용품</h2></a>
          <ol>
            <li ><a href="../main/main.do" class="title" style="color:#0ea2bd;">Home</a></li>
            <li style="color:#0ea2bd;">CampGoods_list</li>
          </ol>
        </div>

      </div>
    </div>  
<!-- partial:index.partial.html -->
<main class="main">

  <div class="product-list" style="margin-top: 60px;"  data-aos="fade-up">
 
<c:forEach var="vo" items="${list }">
  



    <article class="product">
      <a class="product__image-content">
        <img src="${vo.g_image }" alt="product Name" class="product__image" style="width: 350px; height: 300px">
      </a>
      <div class="product__content">
      
        <h2 class="product__name">
          <a href="#"></a>
        </h2>
        <p class="product__brand" style="font-family:'NanumSquareRound'; font-weight: bold">
          ${vo.g_brand }
        </p>
        <p class="product__price" style="font-family:'BMJUA'">
         ${vo.g_name }
        </p>
        <p class="product__info" style="font-size:18px; color:#0ea2bd; font-weight:bold; font-family: 'NanumSquareRound'">
         ￦: ${vo.g_price}
        </p>
        <div class="product__button-content">
          <a href="#" class="product__button" style="background-color: #0ea2bd; hover-color:#ffffff; font-family: 'NanumSquareRound'; font-weight:bold">
            <i class="fas fa-shopping-basket"></i>
          장바구니 담기
          </a>
        </div>
         <div class="product__button-content" style="margin:-40px 157px 0px 0px;">
          <a href="../campgoods/campgoods_detail_before.do?g_id=${vo.g_id}" class="product__button" style="background-color: #9FC93C; font-family: 'NanumSquareRound'; font-weight:bold">
            <i class=""></i>
            상세페이지 보기
          </a>
        </div>
      </div>
    </article>

   </c:forEach>

  </div>
</main>
<!-- partial -->
  
        <div class="row">
          <div class="col-sm-12">
        
            <nav class="pagination-a">
              <ul class="pagination justify-content-center" style="margin: 40px 40px;"><!--start, center, end -->
                <c:if test="${startPage>1 }">
                  <li class="page-item prev">
                    <a class="page-link" href="../campgoods/campgoods_list.do?page=${startPage-1 }" tabindex="-1">
                      <span class="bi bi-chevron-left"></span>
                    </a>
                  </li>
                </c:if>
                <c:forEach var="i" begin="${startPage }" end="${endPage }">
		          <c:if test="${i==curpage }">
		            <li class="page-item active"><a class="page-link" href="../campgoods/campgoods_list.do?page=${i }">${i }</a></li>
		          </c:if>
		          <c:if test="${i!=curpage }">
		            <li class="page-item"><a class="page-link" href="../campgoods/campgoods_list.do?page=${i }">${i }</a></li>
		          </c:if>
		        </c:forEach>
                <c:if test="${endPage<totalpage }">
                  <li class="page-item next">
                    <a class="page-link" href="../campgoods/campgoods_list.do?page=${endPage+1 }">
                      <span class="bi bi-chevron-right"></span>
                    </a>
                  </li>
                </c:if>
              </ul>
            </nav>
          </div>
        </div>
        
          <div class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
         <a href="#"><h2 class="title" style="color:#0ea2bd;">최근 본 캠핑용품</h2></a>
          <ol>
          
          </ol>
        </div>

      </div>
    </div>  
    
         <!-- ################################################################################################ -->

    <!-- ################################################################################################ -->
    
       <ul class="nospace group" style="margin-top:20px;">
      <c:forEach var="vo" items="${cList }" varStatus="s">
        <c:if test="${s.index<=4 }">
         <a href="../campgoods/campgoods_detail.do?g_id=${vo.g_id }" >
         
         <img src="${vo.g_image }" style="width: 105px;height: 100px" class="rounded border border-info">
         
         </a>
         
        </c:if>
        
      </c:forEach>
      
    </ul>
   
       
     

</body>
</html>

