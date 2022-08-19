<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title></title>
<!--   <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
 <link rel="stylesheet" href="./style_find.css">
<link rel="stylesheet" href="style.css">
 
<style type="text/css">

span{
@font-face {
    font-family: 'NanumSquareRound';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/NanumSquareRound.woff') format('woff');
    font-weight: bold;
    font-style: normal;
}
}
li{
@font-face {
    font-family: 'NanumSquareRound';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/NanumSquareRound.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
}
p2{color:#4C4C4C;
@font-face {
    font-family: 'NanumSquareRound';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/NanumSquareRound.woff') format('woff');
    font-weight: normal;
    font-style: normal;
    
}


</style>


</head>
<body>
<main id="main">

    <!-- ======= Breadcrumbs ======= -->
      <div class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
         <a href="../campgoods/campgoods_find.do"><h2 class="title" style="color:#0ea2bd;">캠핑<sup>+</sup> 캠핑용품</h2></a>
          <ol>
            <li ><a href="../main/main.do" class="title" style="color:#0ea2bd;">Home</a></li>
            <li>CampGoods_brand_find</li>
          </ol>
        </div>

      </div>
    </div>  

	
	
	<div class="row inline" style="margin-top: 30px; margin-left: 144px;" >
      <form method="post" action="../campgoods/campgoods_find.do">
       <input type=text name=g_brand size=15 class="input-sm" value="${g_brand }">
       <input type=submit value="검색" class="btn btn-sm btn-primary">
       </form>
    </div>
    <div style="height: 20px"></div>



 

	<div class="content" style="margin-top: 10px;">
		
		<div class="product-grid product-grid--flexbox">
			<div class="product-grid__wrapper" data-aos="fade-up">
				<!-- Product list start here -->
				<c:forEach var="vo" items="${list }">
				<!-- Single product -->
				<div class="product-grid__product-wrapper">
					<div class="product-grid__product">
						<div class="product-grid__img-wrapper" onclick="location.href='../campgoods/campgoods_detail_before.do?g_id=${vo.g_id}'">
						 		
							<img src="${vo.g_image }" alt="Img" class="product-grid__img">
							
						</div>
						
						<div class="title" onclick=" location.href='../campgoods/campgoods_detail_before.do?g_id=${vo.g_id}'">${vo.g_name }</div>
						<div style="color:#0ea2bd; font-weight: bold;" onclick="location.href='../campgoods/campgoods_detail_before.do?g_id=${vo.g_id}'">￦: ${vo.g_price/100000 }원</div>
						<div class="product-grid__extend-wrapper">
							<div class="product-grid__extend">
								<p2 style="font-size: 12px;">${vo.g_brand }</p2>
								<br>
								<img src="../campgoods/cart2.png" style="width:35px; heigh:35px;">
								<a href="../campgoods/campgoods_detail_before.do?g_id=${vo.g_id}"><img src="../campgoods/information2.png" style="width:35px; heigh:35px;"></a>			
								
							</div>
						</div>
					</div>
				</div>
				</c:forEach>

				
			</div>		
		</div>
	</div>
		<!-- 페이지  중앙?style="justify-content: center"-->
		  
      
    

     
         <div class="row">
      <div class="text-center" style="margin: 40px; margin-left: 340px; color:#0ea2bd;">
        <a href="../campgoods/campgoods_find.do?g_brand=${g_brand }&page=${curpage>1?curpage-1:curpage}" class="btn btn-outline-primary " >이전</a>
        ${curpage } page / ${totalpage } pages
        <a href="../campgoods/campgoods_find.do?g_brand=${g_brand }&page=${curpage<totalpage?curpage+1:curpage}" class="btn btn-outline-primary" >다음</a>
      </div>
    </div>
				
        

</main>
</body>


</html>