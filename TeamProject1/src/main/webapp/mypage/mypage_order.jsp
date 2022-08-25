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
	$('.orders').click(function(){
		let no = $(this).attr("data-no");
		$.ajax({
			type:'post',
			url:'../mypage/order_info.do',
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
				<h2 class="title">결제 내역</h2>
              	<table class="table table-hover">
                  <tr class="text-center table-info">
                    <th>결제 번호</th>
                    <th>수령인</th>
                    <th>배송 주소</th>
                    <th>주문일</th>
                    <th>배송예정일</th>
                    <th></th>
                  </tr>
                  <c:forEach var="vo" items="${o_list }" varStatus="a">
                    <tr>
                      <td class="text-center">${vo.no }</td>
                      <td>${vo.o_name }</td>
                      <td>${vo.o_addr1 } ${vo.o_addr2 }</td>
                      <td>${vo.dbday1 }</td>
                      <td>${vo.dbday2 }</td>
                      <td><input type="text" class="btn btn-sm btn-primary orders" value="상세정보" size="15" data-no=${vo.no }></td>
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