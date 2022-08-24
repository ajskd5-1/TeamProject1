<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>CodePen - Product Detail page</title>
 <script type="text/javascript" src="//code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
		$('#reviewBtn').click(function(){
		var id='<%=(String)session.getAttribute("id")%>';
 		let re_msg=$('#re_msg').val();
		if(id!="null")
		{
			if(re_msg.trim()==="")
			{
				$('#re_msg').focus();
				return;
			}
			else
			{
				$('#review_frm').submit();
			}
		}
		else
		{
			alert("로그인 시 작성 가능합니다.");
			return;
		} 
		
	})
	//수정 버튼 클릭 시 
	$('#updateBtn').click(function(){
		$('#update_tr').show("slow");
		let update_msg=$('#update_msg').val();
		if(update_msg==='')
		{
			$('#update_msg').focus();
		}
	})
	//취소 버튼 추가 클릭 시  
	$('#update_no_Btn').click(function(){
		$('#update_tr').hide("slow");
	})
	//추가하기 버튼 클릭 시 
	$('#update_ok_Btn').click(function(){
			$('#update_frm').submit();
	})
	//별점 
	$('#selectStar').change(function(){
		//var s = document.getElementById("selectStar");
		//var selectStar = s.option[s.selectedIndex].value;
		let star = $('#selectStar option:selected').val();
		$('#re_score').val(star);
	})
})

</script>
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
		        			<div class="product-name" style="font-family: 'BMJUA'; color:#4C4C4C;">${vo.g_name } </div>
		        		
		        	
     
    
		        			
		        			
								
								
						<div class="product-price-discount" style="font-family: 'NanumSquareRound'; color:#0ea2bd; font-weight:bold;"><span>￦: ${vo.g_price }</span></div>
					

	        			
	        			<div class="product-count">
	        				<label for="size" style="font-family: 'NanumSquareRound'; font-weight:bold">수량 선택</label>
	        			
	        				<form action="#" class="display-flex">
	        				<!--  
	        					<input type="hidden" val="${vo.g_id }" id="no">-->
							    <div class="qtyminus">-</div>
							    <input type="text" name="quantity" value="1" class="qty" >
							    <div class="qtyplus">+</div>
							    <!--  
							    <a href="#" class="round-black-btn">Add to Cart</a>
							    -->
							</form>
							<a href="#" class="round-black-btn" style="font-family: 'NanumSquareRound'; font-weight:bold">장바구니 담기</a>
							<!-- 
							<a href="../campgoods/campgoods_list.do"><img src="../campgoods/back.png" style="width:30px; height:30px;"></a>
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
				    	<a class="nav-link active" id="description-tab" data-toggle="tab" href="#description" role="tab" aria-controls="description" aria-selected="true" style="font-family: 'NanumSquareRound';">상세이미지</a>
				  	</li>
				  	<li class="nav-item">
				    	<a class="nav-link" id="review-tab" data-toggle="tab" href="#review" role="tab" aria-controls="review" aria-selected="false" style="font-family: 'NanumSquareRound';">리뷰 작성하기</a>
				  	</li>
				</ul>
				<div class="tab-content" id="myTabContent">
				  	<div class="tab-pane fade show active" id="description" role="tabpanel" aria-labelledby="description-tab" style="text-align: center">
						<img src="${vo.g_detail }"/>
				  	</div>
				  	<div class="tab-pane fade" id="review" role="tabpanel" aria-labelledby="review-tab">
				  		<div class="review-heading"></div>
				  		<p class="mb-20"></p>
				  		<!-- 시작 -->
			<!-- 후기 -->
		
		<!-- 후기 목록 -->
           <div class="comments" style="margin-top:-100px;">
            <br><br><br><br>
              <div >
             	 <h2 class="title" style="display: inline;">&nbsp;&nbsp;캠핑용품 후기</h2><img src="../campgoods/tent.png" style="margin-left:15px; margin-top:-20px; height:50px; width: 50px;">
              </div>
              <c:forEach items="${list }" var="rvo">
              <hr>
              <div id="comment-1" class="comment" style="text-align: right; margin: 0px;">
                <c:forEach begin="1" end="${rvo.re_score }"><span style="color:#f1c40f; margin-right: 4px; font-size: 18pt;">★</span></c:forEach></div>
              <div id="comment-2" class="comment" style="margin: 0px;">
                <div class="d-flex" style="margin-bottom: 15px;">
                  <div class="comment-img"><img src="../campgoods/travel.png" style="margin:5px 30px 20px 20px; height: 70px; width: 70px; "></div>
                  <div>
                    <h5 style="font-size:15pt; margin-bottom: 5px; font-style: italic; font-weight: bold; color: gray;">${rvo.re_writer}</h5>
                    <h5 style="font-size:13pt; margin-bottom: 8px; color: gray;"> <fmt:formatDate value="${rvo.re_regdate }" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></h5>
                    <p style="font-size:14pt; font-weight: bold;">
                      ${rvo.re_msg}
                    </p>
                    <c:if test="${sessionScope.id==rvo.re_writer }">
                    <div class="button">
                      <input type="button" class="btn btn-primary" style=" border: none;" value="삭제" 
                    	onclick="location.href='../campgoods/campgoods_review_delete.do?re_no=${rvo.re_no}&g_id=${vo.g_id }'">
                      <input id="updateBtn" type="button" class="btn btn-primary" style="background-color: #528e5b; border: none; margin-left: " value="수정"><br>
                    	<div id ="update_tr" class="button" style="margin: 20px 0px; display:none;" >
                    	   <form method="post" id="update_frm" action="../campgoods/campgoods_review_update.do?re_no=${rvo.re_no}&g_id=${vo.g_id }" >
                    		 <input id="update_msg" name="update_msg" type="text" class="form-control" value="${rvo.re_msg}"> 
                    	   </form>
                    	<button type="submit" id="update_ok_Btn" class="btn btn-primary" style="background-color: #e7c04c;margin-top: 10px;border: none">수정하기</button>
                    	<button type="submit" id="update_no_Btn" class="btn btn-primary" style="background-color: #fff;margin-top: 10px; color: black;">취소</button>
                    	</div>
                    </div>	
                    </c:if>
                  </div>
                </div>
              </div><!-- End comment #1 -->
              </c:forEach>
              <br>
              <br>
         <!-- 후기 작성 -->
              <div class="reply-form">
                <h4 class="title">후기 작성</h4><br>
                <div class="star">
					<span style="font-size: 14pt; font-weight: bold;">별점 : </span><select id="selectStar" class="selectStar" name="selectStar" >
						<option value="1"> ★ </option>
						<option value="2"> ★ ★ </option>
						<option value="3"> ★ ★ ★ </option>
						<option value="4"> ★ ★ ★ ★ </option>
						<option value="5"> ★ ★ ★ ★ ★ </option>
					</select> 
				</div>
                <form method="post" action="../campgoods/campgoods_review_ok.do" name="review_frm" id="review_frm">
                  <div class="row" style="margin-top: 20px;">
                    <div class="col form-group" >
                      <input type="text"  id="re_msg" name="re_msg" class="form-control" placeholder="여러분의 소중한 후기는 사랑입니다:)">
                    </div>
                      <input id="re_score" name="re_score" value="1" type="hidden">
                      <input id="re_tno" name="re_tno" value="${vo.g_id }" type="hidden" >
                      <input id="re_tno" name="re_type" value="3" type="hidden"><!-- type 1은 레시피예요, type 숫자 정해서 value="?" 물음표에 숫자 넣어주시면 됩니다.  -->
                  </div>
               </form>
                  <button type="submit" id="reviewBtn" class="btn btn-info" style="margin-top:10px"><b style="color:#ffffff;">작성하기</b></button>
              </div>
          </div>
		</div>
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
