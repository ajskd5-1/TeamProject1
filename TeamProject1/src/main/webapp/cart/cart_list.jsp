<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="utf-8">

  <script src="js/jquery-3.3.1.min.js"></script>
  <script src="js/jquery-ui.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/aos.js"></script>
  <script src="js/main.js"></script>
  
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('.del').click(function(){
		let g_id = $(this).attr("data-g_id");
		$.ajax({
			type:'post',
			url:'../cart/cart_delete.do',
			data:{"g_id":g_id},
			success:function(result){
				alert('삭제');
				//$('#print').html(result);
				location.reload();
				
			}
		})
	})

 	$('.js-btn-minus').click(function(){
 		let s = $(this).attr("data-no"); // 몇번째인지
 		let account = $('#count'+s).val();
 		let g_id = $('#g_id'+s).attr("data-g_id");
 		let price = $(this).attr("data-price") * account;
 		$('#tp'+s).text(price);
		$.ajax({
			type:'post',
			url:'../cart/cart_update.do',
			data:{"g_id":g_id, "c_account":account, "c_price":price},
			success:function(result){

			}
		})
 	})
 	$('.js-btn-plus').click(function(){
 		let s = $(this).attr("data-no"); // 몇번째인지
 		let account = $('#count'+s).val();
 		let g_id = $('#g_id'+s).attr("data-g_id");
 		let price = $(this).attr("data-price") * account;
 		$('#tp'+s).text(price);
 		$.ajax({
			type:'post',
			url:'../cart/cart_update.do',
			data:{"g_id":g_id, "c_account":account, "c_price":price},
			success:function(result){
				
			}
		})
 	})
	
})
</script>
</head>
  <body>
  
  <div class="site-section" style="margin: 50px;" id="asdf">
      <div class="container">
        <div class="row mb-5">
          <form class="col-md-12" method="post">
            <div class="site-blocks-table">
              <table class="table table-bordered">
                <thead>
                  <tr>
                    <th class="product-thumbnail">Image</th>
                    <th class="product-name" width="35%">상품명</th>
                    <th class="product-price">가격</th>
                    <th class="product-quantity">수량</th>
                    <th class="product-total">총 금액</th>
                    <th class="product-remove">삭제</th>
                  </tr>
                </thead>
                <tbody id="print">
                <c:forEach var="vo" items="${list }" varStatus="s">
			    <tr>
			      <td class="product-thumbnail">
			        <img src="${vo.g_image }" alt="Image" class="img-fluid">
			      </td>
			      <td class="product-name">
			        <h2 class="h5 text-black">${vo.no} ${vo.g_name }</h2>
			      </td>
			      <td id="price">${vo.g_price }</td>
			      <td>
			        <div class="input-group mb-3" style="max-width: 120px;">
			          <div class="input-group-prepend">
			            <button class="btn btn-outline-primary js-btn-minus" type="button" data-price="${vo.g_price }" data-no="${s.index+1 }">&minus;</button>
			          </div>
			          <input type="text" class="form-control text-center" value="${vo.c_account }" placeholder="" aria-label="Example text with button addon" aria-describedby="button-addon1" id="count${s.index+1 }">
			          <div class="input-group-append">
			            <button class="btn btn-outline-primary js-btn-plus" type="button" data-price="${vo.g_price }" data-no="${s.index+1 }">&plus;</button>
			          </div>
			        </div>
			
			      </td>
			      <td id="tp${s.index+1 }">${vo.c_price }</td>
			      <td><a href="#" class="btn btn-primary height-auto btn-sm del" id="g_id${s.index+1 }" data-g_id="${vo.g_id }">X</a></td>
			    </tr>
			    </c:forEach>
                </tbody>
              </table>
            </div>
          </form>
        </div>

        <div class="row">
          <div class="col-md-6">
            <div class="row mb-5">
              <div class="col-md-6 mb-3 mb-md-0">
                <!-- <button class="btn btn-primary btn-sm btn-block" id="update">돌아가기</button> -->
                <a href="javascript:history.back();" class="btn btn-primary btn-sm btn-block" id="update" style="color: white; font-size: 20px;" >돌아가기</a>
              </div>
            </div>

          </div>
          <div class="col-md-6 pl-5">
            <div class="row justify-content-end">
              <div class="col-md-7">
                <!-- <div class="row">
                  <div class="col-md-12 text-right border-bottom mb-5">
                    <h3 class="text-black h4 text-uppercase">장바구니 총 금액</h3>
                  </div>
                </div> -->

                <%-- <div class="row mb-5">
                  <div class="col-md-6">
                    <span class="text-black">총 금액</span>
                  </div>
                  <div class="col-md-6 text-right">
                    <strong class="text-black total">${total }</strong>
                  </div>
                </div> --%>

                <div class="row">
                  <div class="col-md-12">
                    <a href="../cart/cart_order.do" style="color: white; font-size: 20px;" class="btn btn-primary btn-lg btn-block">결제하기</a>
                    
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

	
  </body>
</html>