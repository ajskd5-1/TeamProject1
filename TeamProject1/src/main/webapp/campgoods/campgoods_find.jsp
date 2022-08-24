<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>CodePen - Product List (Grid Template)</title>
  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css'><link rel="stylesheet" href="./style_list.css">
<style type="text/css">
a:hover{

color:#ffffff;
}

</style>
</head>
<body>
 <div class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
         <a href="../campgoods/campgoods_find.do"><h2 class="title" style="color:#0ea2bd;">캠핑<sup>+</sup> 캠핑용품</h2></a>
          <ol>
            <li><a href="../main/main.do" class="title" style="color:#0ea2bd;">Home</a></li>
            <li><a href="../campgoods/campgoods_list.do" style="color:#0ea2bd;">CampGoods_list</a></li>
             <li style="color:#0ea2bd;">CampGoods_brand_find</li>
          </ol>
        </div>

      </div>
    </div>  
<main id="main">

    <!-- ======= Breadcrumbs ======= -->
 

	
	
	<div class="row inline" style="margin-top: 30px; margin-left: 144px;" >
      <form method="post" action="../campgoods/campgoods_find.do">
      <!--  
       <input type=text name=g_brand size=15 class="input-sm" value="${g_brand }">
       -->
     <select name="g_brand">
     <option
     	<c:if test="${g_brand=='---브랜드를 선택하세요---'}"> selected </c:if>>---브랜드를 선택하세요---</option>
     <option
     	<c:if test="${g_brand=='스노우피크'}"> selected </c:if>>스노우피크</option>
      <option
     	<c:if test="${g_brand=='헬스포츠'}"> selected </c:if>>헬스포츠</option>
     <option
        <c:if test="${g_brand=='유니프레임'}"> selected </c:if>>유니프레임</option>
     <option
        <c:if test="${g_brand=='캔버스캠프'}"> selected </c:if>>캔버스캠프</option>
     <option
        <c:if test="${g_brand=='텐트마크디자인'}"> selected </c:if>>텐트마크디자인</option>
     <option
        <c:if test="${g_brand=='페트로막스'}"> selected </c:if>>페트로막스</option>
     <option
        <c:if test="${g_brand=='코베아'}"> selected </c:if>>코베아</option>
     <option
        <c:if test="${g_brand=='베어본즈'}"> selected </c:if>>베어본즈</option>
     <option
        <c:if test="${g_brand=='헬리녹스'}"> selected </c:if>>헬리녹스</option>
     <option
        <c:if test="${g_brand=='힐레베르그'}"> selected </c:if>>힐레베르그</option>
     <option
        <c:if test="${g_brand=='에스폴'}"> selected </c:if>>에스폴</option>
     <option
        <c:if test="${g_brand=='크레모아'}"> selected </c:if>>크레모아</option>
     <option
        <c:if test="${g_brand=='라이트형제'}"> selected </c:if>>라이트형제</option>
      <option
        <c:if test="${g_brand=='abc아웃도어'}"> selected </c:if>>abc아웃도어</option>
      <option
        <c:if test="${g_brand=='달럼'}"> selected </c:if>>달럼</option>
   		<option
        <c:if test="${g_brand=='위너웰'}"> selected </c:if>>위너웰</option>
       <option
        <c:if test="${g_brand=='퓨어핸드'}"> selected </c:if>>퓨어핸드</option>
      <option
        <c:if test="${g_brand=='젠틀맨즈 하드웨어'}"> selected </c:if>>젠틀맨즈 하드웨어</option>
       <option
        <c:if test="${g_brand=='엠에스알'}"> selected </c:if>>엠에스알</option>
       <option
        <c:if test="${g_brand=='쏠콘'}"> selected </c:if>>쏠콘</option>
       <option
        <c:if test="${g_brand=='미스테리월'}"> selected </c:if>>미스테리월</option>
       <option
        <c:if test="${g_brand=='기어가드'}"> selected </c:if>>기어가드</option>
         <option
        <c:if test="${g_brand=='헬로닷'}"> selected </c:if>>헬로닷</option>
         <option
        <c:if test="${g_brand=='노박스'}"> selected </c:if>>노박스</option>
        <option
        <c:if test="${g_brand=='자체브랜드'}"> selected </c:if>>자체브랜드</option>
         <option
        <c:if test="${g_brand=='카고컨테이너'}"> selected </c:if>>카고컨테이너</option>
         <option
        <c:if test="${g_brand=='커밋체어'}"> selected </c:if>>커밋체어</option>
         <option
        <c:if test="${g_brand=='펜들턴'}"> selected </c:if>>펜들턴</option>
       <option
        <c:if test="${g_brand=='리빙앤라이프'}"> selected </c:if>>리빙앤라이프</option>
        <option
        <c:if test="${g_brand=='엑스패드'}"> selected </c:if>>엑스패드</option>
        <option
        <c:if test="${g_brand=='울프앤그리즐리'}"> selected </c:if>>울프앤그리즐리</option>
        <option
        <c:if test="${g_brand=='포카레인디어하이즈'}"> selected </c:if>>포카레인디어하이즈</option>
          <option
        <c:if test="${g_brand=='코쿤'}"> selected </c:if>>코쿤</option>
          <option
        <c:if test="${g_brand=='트란지아'}"> selected </c:if>>트란지아</option>
          <option
        <c:if test="${g_brand=='몽벨'}"> selected </c:if>>몽벨</option>
         
        
     </select>
    
       <input type=submit value="선택" class="btn btn-sm btn-primary">
       </form>
    </div>
    <div style="height: 20px"></div>



 

	<main class="main">

  <div class="product-list" style="margin-top: 20px;"  data-aos="fade-up">
 
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
          </a>
        </p>
        <p class="product__price" style="font-family: 'BMJUA'">
         ${vo.g_name }
        </p>
        <p class="product__info" style="font-size:18px; color:#0ea2bd; font-weight:bold; font-family: 'NanumSquareRound'">
         ￦: ${vo.g_price}
        </p>
        <div class="product__button-content">
          <a href="#" class="product__button"style="background-color: #0ea2bd; hover-color:#ffffff; font-family: 'NanumSquareRound'; font-weight:bold">
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
		<!-- 페이지  중앙?style="justify-content: center"-->
		  
      
    

     
         <div class="row">
      <div class="text-center" style="margin: 40px; margin-left: 340px; color:#0ea2bd;">
        <a href="../campgoods/campgoods_find.do?g_brand=${g_brand }&page=${curpage>1?curpage-1:curpage}" class="btn btn-outline-primary " >이전</a>
        ${curpage } page / ${totalpage } pages
        <a href="../campgoods/campgoods_find.do?g_brand=${g_brand }&page=${curpage<totalpage?curpage+1:curpage}" class="btn btn-outline-primary" >다음</a>
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
   
     
     	
        

</main>
</body>	


</html>