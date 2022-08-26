<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#reserveBtn').click(function(){
		if(${sessionScope.id==null }){
			alert('로그인 후 이용가능합니다!');
			return;
		}
		
		let title = $('#ctitle').text();
		let no = $('#cno').val();
		$.ajax({
			type:'post',
			url:'../reserve/reserve.do',
			data:{"title":title, "no":no},
			success:function(result){
				$('#reservePrint').html(result);
			}
		})
	})
	
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
</head>
<body>
	<div class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <a href="../camp/list.do"><h2 class="title">캠핑<sup>+</sup> 캠핑장</h2></a>
          <ol>
            <li><a href="../main/main.do" class="title" style="color:#0ea2bd;">Home</a></li>
            <li style="color:#0ea2bd;"><a href="../camp/list.do">camping</a></li>
            <li style="color:#0ea2bd;">camping detail</li>
          </ol>
        </div>

      </div>
    </div>

    
	<!-- ======= About Section ======= -->
    <section id="about" class="about">
      <div class="container" data-aos="fade-up">

        <div class="section-header">
          <h2 class="title" id="ctitle">${vo.c_title }</h2>
          <input type="hidden" id="cno" value="${vo.no }">
        </div>

        <div class="row g-4 g-lg-5" data-aos="fade-up" data-aos-delay="200">

          <div class="col-lg-5">
            <div>
              <img src="${vo.c_poster }" class="img-fluid" alt="">
            </div>
          </div>

          <div class="col-lg-7">

            <!-- Tabs -->
            <ul class="nav nav-pills mb-3">
              <li><a class="nav-link active" data-bs-toggle="pill" href="#tab1">캠핑장 기본정보</a></li>
              <li><a class="nav-link" data-bs-toggle="pill" href="#tab2">사진</a></li>
              <li><a class="nav-link" data-bs-toggle="pill" href="#tab3">이용안내</a></li>
              <li><span class="btn btn-sm btn-primary" style="margin-top: 10px;" id="reserveBtn">예약하기</span></li>
              <!-- <li><input type="text" value="예약하기" class="btn btn-sm btn-primary" size="10" style="margin-top: 10px;"></li> -->
            </ul><!-- End Tabs -->

            <!-- Tab Content -->
            <div class="tab-content">

              <div class="tab-pane fade show active" id="tab1">
                ${info }
              </div><!-- End Tab 1 Content -->
              
              <div class="tab-pane fade show" id="tab2">
                <div class="row">
                  <c:forTokens items="${vo.c_imgs }" delims="^" var="image">
		            <img src="${image }" style="width: 30%" class="img-fluid" alt="">
		          </c:forTokens>
                </div>
              </div><!-- End Tab 2 Content -->
              
              <div class="tab-pane fade show" id="tab3">
                <div class="row">
                  <table class="table table-hover text-center">
                    <tr>
                      <th rowspan="2">구분</th>
                      <th colspan="2">평상시</th>
                      <th colspan="2">성수기</th>
                    </tr>
                    <tr>
                      <td>주중</td>
                      <td>주말</td>
                      <td>주중</td>
                      <td>주말</td>
                    </tr>
                    <tr>
                      <th>비용</th>
                      <td>30,000</td>
                      <td>30,000</td>
                      <td>30,000</td>
                      <td>30,000</td>
                    </tr>
                  </table>
                </div>
              </div><!-- End Tab 3 Content -->
              
            </div>
            
          </div>

        </div>
        
        <div class="row" id="reservePrint"></div>
        
        <hr class="border border-primary opacity-75">
        <!-- 추가 -->
        <h4>캠핑장 소개</h4>
          ${vo.c_content }
        <hr class="border border-primary opacity-50">
          <h4>캠핑장 시설정보</h4>
          <c:forTokens items="${vo.c_info2 }" delims=" " var="info">
            <c:choose>
              <c:when test="${info eq '전기' }"><img src="https://img.icons8.com/external-phatplus-lineal-phatplus/64/000000/external-electric-electric-vehicles-phatplus-lineal-phatplus.png"/>&nbsp;&nbsp;&nbsp;&nbsp;</c:when>
              <c:when test="${info eq '와이파이' }"><img src="https://img.icons8.com/glyph-neue/64/000000/wifi.png"/>&nbsp;&nbsp;&nbsp;&nbsp;</c:when>
              <c:when test="${info eq '장작판매' }"><img src="https://img.icons8.com/pastel-glyph/64/000000/bonfire.png"/>&nbsp;&nbsp;&nbsp;&nbsp;</c:when>
              <c:when test="${info eq '온수' }"><img src="https://img.icons8.com/external-inipagistudio-mixed-inipagistudio/64/000000/external-water-manicure-and-pedicure-inipagistudio-mixed-inipagistudio.png"/>&nbsp;&nbsp;&nbsp;&nbsp;</c:when>
              <c:when test="${info eq '트렘폴린' }"><img src="https://img.icons8.com/ios/50/000000/trampoline-park.png"/>&nbsp;&nbsp;&nbsp;&nbsp;</c:when>
              <c:when test="${info eq '물놀이장' }"><img src="https://img.icons8.com/cotton/64/000000/swimming-pool--v2.png"/>&nbsp;&nbsp;&nbsp;&nbsp;</c:when>
              <c:when test="${info eq '놀이터' }"><img src="https://img.icons8.com/ios/50/000000/playground.png"/>&nbsp;&nbsp;&nbsp;&nbsp;</c:when>
              <c:when test="${info eq '산책로' }"><img src="https://img.icons8.com/ios/50/000000/trail--v2.png"/>&nbsp;&nbsp;&nbsp;&nbsp;</c:when>
              <c:when test="${info eq '운동장' }"><img src="https://img.icons8.com/dotty/80/000000/stadium.png"/>&nbsp;&nbsp;&nbsp;&nbsp;</c:when>
              <c:when test="${info eq '운동시설' }"><img src="https://img.icons8.com/fluency-systems-regular/48/000000/sports.png"/>&nbsp;&nbsp;&nbsp;&nbsp;</c:when>
              <c:when test="${info eq '마트.편의점' }"><img src="https://img.icons8.com/ios-glyphs/60/000000/shop.png"/></c:when>
              <c:otherwise></c:otherwise>
            </c:choose>
          </c:forTokens>
        <hr class="border border-primary opacity-50">
          <h4>기타 주요시설</h4>
          ${etcinfo}
        <hr class="border border-primary opacity-50">
      </div>

    </section><!-- End About Section -->

	<section id="about" class="about">
      <div class="container" data-aos="fade-up">
        <div class="row g-4 g-lg-5" data-aos="fade-up" data-aos-delay="200">
          <div class="col-lg-12">
            <div id="map" style="height:500px;"></div>

			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4361dd205c905a772605200caa3e5d2d&libraries=services"></script>
			<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };  
			
			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 
			
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
			
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch('${vo.c_addr }', function(result, status) {
			
			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {
			
			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });
			
			        // 인포윈도우로 장소에 대한 설명을 표시합니다
			        var infowindow = new kakao.maps.InfoWindow({
			            content: '<div style="width:150px;text-align:center;padding:6px 0;">${vo.c_title}</div>'
			        });
			        infowindow.open(map, marker);
			
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } 
			});    
		</script>
          </div>
        </div>
      </div>
	
	</section>
    
    <!-- ======= Portfolio Section ======= -->
    <section id="portfolio" class="portfolio" data-aos="fade-up">

      <div class="container">
        <div class="section-header">
          <h2><i class="bi bi-images text-left" style="color: #0ea2bd;"></i>${vo.c_title }</h2>
        </div>
      </div>
      <div class="container-fluid" data-aos="fade-up" data-aos-delay="200">
        <div class="portfolio-isotope" data-portfolio-filter="*" data-portfolio-layout="masonry" data-portfolio-sort="original-order">
          <div class="row g-0 portfolio-container">
			<c:forTokens items="${vo.c_gallery }" delims="^" var="image">
              <div class="col-xl-3 col-lg-4 col-md-6 portfolio-item">
	            <img src="${image }" style="width: 100%" class="img-fluid" alt="">
              </div><!-- End Portfolio Item -->
			</c:forTokens>
          </div><!-- End Portfolio Container -->
        </div>
      </div>
      
    </section><!-- End Portfolio Section -->

    <section id="blog" class="blog">
      <div class="container" data-aos="fade-up">

        <div class="row g-5">
	<!-- 후기 -->
		<div class="col-md-8 offset-md-2 col-lg-8 offset-lg-2">
		<!-- 후기 목록 -->
          <div class="comments">
            <br><br><br><br>
              <div >
             	 <h2 class="title" style="display: inline;">&nbsp;&nbsp;캠핑 후기</h2><img src="../camp/images/touring.png" style="margin:5px 10px 20px 20px;; height:60px; width: 60px;">
              </div>
              <c:forEach items="${list }" var="rvo">
              <hr>
              <div id="comment-1" class="comment" style="text-align: right; margin: 0px;">
                <c:forEach begin="1" end="${rvo.re_score }"><span style="color:#f1c40f; margin-right: 4px; font-size: 18pt;">★</span></c:forEach></div>
              <div id="comment-2" class="comment" style="margin: 0px;">
                <div class="d-flex" style="margin-bottom: 15px;">
                  <div class="comment-img"><img src="../camp/images/man.png" style="margin:5px 30px 20px 20px; height: 70px; width: 70px; "></div>
                  <div>
                    <h5 style="font-size:15pt; margin-bottom: 5px; font-style: italic; font-weight: bold; color: gray;">${rvo.re_writer}</h5>
                    <h5 style="font-size:13pt; margin-bottom: 8px; color: gray;"> <fmt:formatDate value="${rvo.re_regdate }" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></h5>
                    <p style="font-size:14pt; font-weight: bold;">
                      ${rvo.re_msg}
                    </p>
                    <c:if test="${sessionScope.id==rvo.re_writer }">
                    <div class="button">
                      <input type="button" class="btn btn-primary" style=" border: none;" value="삭제" 
                    	onclick="location.href='../camp/camp_review_delete.do?re_no=${rvo.re_no}&no=${vo.no }'">
                      <input id="updateBtn" type="button" class="btn btn-primary" style="background-color: #528e5b; border: none; margin-left: " value="수정"><br>
                    	<div id ="update_tr" class="button" style="margin: 20px 0px; display:none;" >
                    	   <form method="post" id="update_frm" action="../camp/camp_review_update.do?re_no=${rvo.re_no}&no=${vo.no }" >
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
                <form method="post" action="../camp/camp_review_ok.do" name="review_frm" id="review_frm">
                  <div class="row" style="margin-top: 20px;">
                    <div class="col form-group" >
                      <input type="text"  id="re_msg" name="re_msg" class="form-control" placeholder="캠핑장 후기를 자유롭게 작성해주세요. 별점은 캠핑장 평가를 위해 사용됩니다.">
                    </div>
                      <input id="re_score" name="re_score" value="2" type="hidden">
                      <input id="re_tno" name="re_tno" value="${vo.no }" type="hidden" >
                      <input id="re_tno" name="re_type" value="2" type="hidden"><!-- type 1은 레시피예요, type 숫자 정해서 value="?" 물음표에 숫자 넣어주시면 됩니다.  -->
                  </div>
               </form>
                  <button type="submit" id="reviewBtn" class="btn btn-primary" style="background-color: #0ea2bd">작성하기</button>
              </div>
          </div>
		</div>
	    </div>
	  </div>
	</section>
</body>
</html>