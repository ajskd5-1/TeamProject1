<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>CodePen - Product Detail page</title>
  <link rel="stylesheet" href="../campgoods/style_detail.css">

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



</style>

</head>
<body>
   <div class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
         <a href="../campgoods/campgoods_list.do"><h2 class="title" style="color:#0ea2bd;">캠핑<sup>+</sup> 캠핑용품</h2></a>
          <ol>
            <li ><a href="../main/main.do" class="title" style="color:#0ea2bd;" >Home</a></li>
            <li><a href="../campgoods/campgoods_list.do">CampGoods_list</a></li>
             <li>CampGoods_detail</li>
          </ol>
        </div>

      </div>
    </div>  
<!-- partial:index.partial.html -->

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800&display=swap" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css"><div class="pd-wrap">
		<div class="container">
	        
	        <div class="row">
	        	<div class="col-md-6">
	        		<div id="slider" class="owl-carousel product-slider">
						<div class="item">
						  	<img src="${vo.g_image }" />
						</div>
						
						
					</div>
					
	        	</div>
	        	<div class="col-md-6">
	        		<div class="product-dtl">
        				<div class="product-info">
		        			<div class="product-name" style="font-family: 'BMJUA'; color:#4C4C4C;">${vo.g_name }</div>
		        		
		        	
     
    
		        			
		        			<div class="reviews-counter">
								
								<span style="font-family: 'NanumSquareRound';">${vo.g_brand }</span>
							</div>
		        			<div class="product-price-discount" style="font-family: 'NanumSquareRound'; color:#0ea2bd; font-weight:bold;"><span>￦: ${vo.g_price }</span></div>
		        			

		        		</div>

	        			
	        			<div class="product-count">
	        				<label for="size">수량 선택</label>
	        			
	        				<form action="#" class="display-flex" style="font-family: 'NanumSquareRound';">
	        				<!--  
	        					<input type="hidden" val="${vo.g_id }" id="no">-->
							    <div class="qtyminus">-</div>
							    <input type="text" name="quantity" value="1" class="qty" >
							    <div class="qtyplus">+</div>
							    <!--  
							    <a href="#" class="round-black-btn">Add to Cart</a>
							    -->
							</form>
							<a href="#" class="round-black-btn" style="font-family: 'NanumSquareRound'; font-weight:bold">장바구니 담기</a><!--  <div class="jjim">
              <img src="https://cdn.pixabay.com/photo/2014/04/02/10/47/red-304570_1280.png" style="width: 35px; height: 30px; margin-top: -67px; margin-left:200px;">
             
            </div>
             -->
              <c:if test="${sessionScope.id!=null }">
        
         <c:choose>
          <c:when test="${jcount==0 }">
          <a href="../campgoods/jjim.do?g_id=${vo.g_id }"><img src="../campgoods/black-love_2.png" style="width: 35px; height: 30px; margin-left:5px;"></a>
          </c:when>
        <c:otherwise>
         <img src="../campgoods/color-love_2.png" style="width: 35px; height: 30px; margin-left:5px;">

        </c:otherwise>
       </c:choose>
      </c:if>
      
     		</div>
	        		</div>
	        	</div>
	        </div>
	       
	        	
	        <div class="product-info-tabs">
		        <ul class="nav nav-tabs" id="myTab" role="tablist">
				  	<li class="nav-item">
				    	<a class="nav-link active" id="description-tab" data-toggle="tab" href="#description" role="tab" aria-controls="description" aria-selected="true">Description</a>
				  	</li>
				  	<li class="nav-item">
				    	<a class="nav-link" id="review-tab" data-toggle="tab" href="#review" role="tab" aria-controls="review" aria-selected="false">Reviews (0)</a>
				  	</li>
				</ul>
				<div class="tab-content" id="myTabContent">
				  	<div class="tab-pane fade show active" id="description" role="tabpanel" aria-labelledby="description-tab" style="text-align: center">
						<img src="${vo.g_detail }"/>
				  	</div>
				  	<div class="tab-pane fade" id="review" role="tabpanel" aria-labelledby="review-tab">
				  		<div class="review-heading">REVIEWS</div>
				  		<p class="mb-20">There are no reviews yet.</p>
				  		<form class="review-form">
		        			<div class="form-group">
			        			<label>Your rating</label>
			        			<div class="reviews-counter">
									<div class="rate">
									    <input type="radio" id="star5" name="rate" value="5" />
									    <label for="star5" title="text">5 stars</label>
									    <input type="radio" id="star4" name="rate" value="4" />
									    <label for="star4" title="text">4 stars</label>
									    <input type="radio" id="star3" name="rate" value="3" />
									    <label for="star3" title="text">3 stars</label>
									    <input type="radio" id="star2" name="rate" value="2" />
									    <label for="star2" title="text">2 stars</label>
									    <input type="radio" id="star1" name="rate" value="1" />
									    <label for="star1" title="text">1 star</label>
									</div>
								</div>
							</div>
		        			<div class="form-group">
			        			<label>Your message</label>
			        			<textarea class="form-control" rows="10"></textarea>
			        		</div>
			        		<div class="row">
				        		<div class="col-md-6">
				        			<div class="form-group">
					        			<input type="text" name="" class="form-control" placeholder="Name*">
					        		</div>
					        	</div>
				        		<div class="col-md-6">
				        			<div class="form-group">
					        			<input type="text" name="" class="form-control" placeholder="Email Id*">
					        		</div>
					        	</div>
					        </div>
					        <button class="round-black-btn">Submit Review</button>
			        	</form>
				  	</div>
				</div>
			</div>
		
      
     
		</div>
	</div>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="	sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<!-- partial -->
  <script  src="./script_detail.js"></script>

</body>
</html>
