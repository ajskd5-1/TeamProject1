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
	$('.reserves').click(function(){
		let no = $(this).attr("data-no");
		// 한번더 누르면 숨기기?
		//let a2 = $(this).attr("cli");
		//let a1 = $('.reserves').attr("cli");
		$.ajax({
			type:'post',
			url:'../mypage/reserve_info.do',
			data:{"no":no},
			success:function(result){
				$('#print').html(result);
			}
		})
	})
})
</script>
</head>
<body>
<main id="main">
    <section id="blog" class="blog" style="margin-top: -60px;">
      
      <div class="container" data-aos="fade-up">
        <div class="row g-5">
          <div class="col-lg-12">
            <article class="blog-details">
			    
              <div class="content">
				<h2 class="title">예약내역</h2>
              	<table class="table table-hover">
                  <tr class="text-center">
                    <th></th>
                    <th>캠핑장</th>
                    <th>예약 기간</th>
                    <th>인원수</th>
                    <th></th>
                  </tr>
                  <c:forEach var="vo" items="${list }" varStatus="a">
                    <tr>
                      <td><img src="${vo.c_poster }" style="width: 100px; height: 100px;"></td>
                      <td>${vo.c_title }</td>
                      <td>${vo.cin } ~ ${vo.cout }</td>
                      <td>${vo.inwon }</td>
                      
                      <c:if test="${vo.ischeck=='n' }">
                        <td><input type="text" class="btn btn-sm btn-primary reserves" value="예약 대기" size="15" data-no=${vo.no } cli="${a }"></td>
                      </c:if>
                      <c:if test="${vo.ischeck=='y' }">
                        <td><input type="text" class="btn btn-sm btn-primary reserves" value="예약 완료" size="15" data-no=${vo.no }></td>
                      </c:if>
                      
                    </tr>
                  </c:forEach>
                </table>
				<div id="print">
				
				</div>

              </div><!-- End post content -->


            </article><!-- End blog post -->
          </div>
        </div>
      </div>
    </section><!-- End Blog Details Section -->

  </main><!-- End #main -->
</body>
</html>