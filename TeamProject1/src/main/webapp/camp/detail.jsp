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
})
</script>
</head>
<body>
	<!-- ======= Breadcrumbs ======= -->
    <div class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2 class="title">캠핑<sup>+</sup> 캠핑장</h2>
          <ol>
            <li><a href="../main/main.do">Home</a></li>
            <li><a href="../camp/list.do">캠핑장</a></li>
            <li>${vo.c_title }</li>
          </ol>
        </div>

      </div>
    </div><!-- End Breadcrumbs -->
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
      <div class="col-lg-12">
        <div class="comments">

	      <h4 class="comments-count">8 Comments</h4>
	
	      <div id="comment-1" class="comment">
	        <div class="d-flex">
	          <div class="comment-img"><img src="../assets/img/blog/comments-1.jpg" alt=""></div>
	          <div>
	            <h5><a href="">Georgia Reader</a> <a href="#" class="reply"><i class="bi bi-reply-fill"></i> Reply</a></h5>
	            <time datetime="2020-01-01">01 Jan,2022</time>
	            <p>
	              Et rerum totam nisi. Molestiae vel quam dolorum vel voluptatem et et. Est ad aut sapiente quis molestiae est qui cum soluta.
	              Vero aut rerum vel. Rerum quos laboriosam placeat ex qui. Sint qui facilis et.
	            </p>
	          </div>
	        </div>
	      </div><!-- End comment #1 -->
	
	      <div id="comment-2" class="comment">
	        <div class="d-flex">
	          <div class="comment-img"><img src="../assets/img/blog/comments-2.jpg" alt=""></div>
	          <div>
	            <h5><a href="">Aron Alvarado</a> <a href="#" class="reply"><i class="bi bi-reply-fill"></i> Reply</a></h5>
	            <time datetime="2020-01-01">01 Jan,2022</time>
	            <p>
	              Ipsam tempora sequi voluptatem quis sapiente non. Autem itaque eveniet saepe. Officiis illo ut beatae.
	            </p>
	          </div>
	        </div>
	
	        <div id="comment-reply-1" class="comment comment-reply">
	          <div class="d-flex">
	            <div class="comment-img"><img src="../assets/img/blog/comments-3.jpg" alt=""></div>
	            <div>
	              <h5><a href="">Lynda Small</a> <a href="#" class="reply"><i class="bi bi-reply-fill"></i> Reply</a></h5>
	              <time datetime="2020-01-01">01 Jan,2022</time>
	              <p>
	                Enim ipsa eum fugiat fuga repellat. Commodi quo quo dicta. Est ullam aspernatur ut vitae quia mollitia id non. Qui ad quas nostrum rerum sed necessitatibus aut est. Eum officiis sed repellat maxime vero nisi natus. Amet nesciunt nesciunt qui illum omnis est et dolor recusandae.
	
	                Recusandae sit ad aut impedit et. Ipsa labore dolor impedit et natus in porro aut. Magnam qui cum. Illo similique occaecati nihil modi eligendi. Pariatur distinctio labore omnis incidunt et illum. Expedita et dignissimos distinctio laborum minima fugiat.
	
	                Libero corporis qui. Nam illo odio beatae enim ducimus. Harum reiciendis error dolorum non autem quisquam vero rerum neque.
	              </p>
	            </div>
	          </div>
	
	          <div id="comment-reply-2" class="comment comment-reply">
	            <div class="d-flex">
	              <div class="comment-img"><img src="../assets/img/blog/comments-4.jpg" alt=""></div>
	              <div>
	                <h5><a href="">Sianna Ramsay</a> <a href="#" class="reply"><i class="bi bi-reply-fill"></i> Reply</a></h5>
	                <time datetime="2020-01-01">01 Jan,2022</time>
	                <p>
	                  Et dignissimos impedit nulla et quo distinctio ex nemo. Omnis quia dolores cupiditate et. Ut unde qui eligendi sapiente omnis ullam. Placeat porro est commodi est officiis voluptas repellat quisquam possimus. Perferendis id consectetur necessitatibus.
	                </p>
	              </div>
	            </div>
	
	          </div><!-- End comment reply #2-->
	
	        </div><!-- End comment reply #1-->
	
	      </div><!-- End comment #2-->
	
	      <div id="comment-3" class="comment">
	        <div class="d-flex">
	          <div class="comment-img"><img src="../assets/img/blog/comments-5.jpg" alt=""></div>
	          <div>
	            <h5><a href="">Nolan Davidson</a> <a href="#" class="reply"><i class="bi bi-reply-fill"></i> Reply</a></h5>
	            <time datetime="2020-01-01">01 Jan,2022</time>
	            <p>
	              Distinctio nesciunt rerum reprehenderit sed. Iste omnis eius repellendus quia nihil ut accusantium tempore. Nesciunt expedita id dolor exercitationem aspernatur aut quam ut. Voluptatem est accusamus iste at.
	              Non aut et et esse qui sit modi neque. Exercitationem et eos aspernatur. Ea est consequuntur officia beatae ea aut eos soluta. Non qui dolorum voluptatibus et optio veniam. Quam officia sit nostrum dolorem.
	            </p>
	          </div>
	        </div>
	
	      </div><!-- End comment #3 -->
	
	      <div id="comment-4" class="comment">
	        <div class="d-flex">
	          <div class="comment-img"><img src="../assets/img/blog/comments-6.jpg" alt=""></div>
	          <div>
	            <h5><a href="">Kay Duggan</a> <a href="#" class="reply"><i class="bi bi-reply-fill"></i> Reply</a></h5>
	            <time datetime="2020-01-01">01 Jan,2022</time>
	            <p>
	              Dolorem atque aut. Omnis doloremque blanditiis quia eum porro quis ut velit tempore. Cumque sed quia ut maxime. Est ad aut cum. Ut exercitationem non in fugiat.
	            </p>
	          </div>
	        </div>
	
	      </div><!-- End comment #4 -->
	
	      <div class="reply-form">
	
	        <h4>Leave a Reply</h4>
	        <p>Your email address will not be published. Required fields are marked * </p>
	        <form action="">
	          <div class="row">
	            <div class="col-md-6 form-group">
	              <input name="name" type="text" class="form-control" placeholder="Your Name*">
	            </div>
	            <div class="col-md-6 form-group">
	              <input name="email" type="text" class="form-control" placeholder="Your Email*">
	            </div>
	          </div>
	          <div class="row">
	            <div class="col form-group">
	              <input name="website" type="text" class="form-control" placeholder="Your Website">
	            </div>
	          </div>
	          <div class="row">
	            <div class="col form-group">
	              <textarea name="comment" class="form-control" placeholder="Your Comment*"></textarea>
	            </div>
	          </div>
	          <button type="submit" class="btn btn-primary">Post Comment</button>
	
	        </form>
	
	      </div>
	
	    </div><!-- End blog comments -->
	  </div>
    </div>
  </div>
</section>
</body>
</html>