<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title></title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 
    <link rel="stylesheet" href="fonts/icomoon/style.css">

    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">
    <link rel="stylesheet" href="css/jquery-ui.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">


    <link rel="stylesheet" href="css/aos.css">

    <link rel="stylesheet" href="css/style.css">
    
<script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script type="text/javascript">
$(function(){
	$('#postfind').click(function(){
		// 우편번호 검색 처리 
		new daum.Postcode({
			oncomplete:function(data){
				$('#c_post').val(data.zonecode)
				$('#c_address').val(data.address)
			}
		}).open();
	})
	
	let name = $('#g_name').text();
	let total1 = $('#total').text();
	let total = parseInt(total1);
	let bemail = $('#c_email').val();
	let bname = $('#c_name').val();
	let btel = $('#c_tel').val();
	let baddr = $('#c_addr1').val() + ' ' + $('#c_addr2').val();
	let bpost = $('#c_post').val();
	
	let addr1 = $('#c_addr1').val();
	let addr2 = $('#c_addr2').val();
	let content = $('#c_content').val();
	
	IMP.init("imp68206770");// 강사님 코드 : imp68206770   내 코드 : imp20872771
	function requestPay(){
		//가맹점 식별코드
		IMP.request_pay({
		    pg : 'html5_inicis.MID-a',
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : name , //결제창에서 보여질 이름
		    amount : total, //실제 결제되는 가격
		    buyer_email : bemail,
		    buyer_name : bname,
		    buyer_tel : btel,
		    buyer_addr : baddr,
		    buyer_postcode : bpost
		}, function(rsp) {
			console.log(rsp);
		    if ( rsp.success ) {
		    	var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
		        $.ajax({
		        	type:'post',
		        	url:'../cart/thankyou.do',
		        	data:{"o_name":bname, "o_post":bpost, "o_addr1":addr1, "o_addr2":addr2, "o_email":bemail, "o_tel":btel, "o_content":content, "o_total":total},
		        	success:function(result){
		        		location.href="../cart/order_ok.do";
		        	}
		         })
		    } else {
		    	 //var msg = '결제에 실패하였습니다.';
		         //msg += '에러내용 : ' + rsp.error_msg;
		         var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
		         $.ajax({
			        	type:'post',
			        	url:'../cart/thankyou.do',
			        	data:{"o_name":bname, "o_post":bpost, "o_addr1":addr1, "o_addr2":addr2, "o_email":bemail, "o_tel":btel, "o_content":content, "o_total":total},
			        	success:function(result){
			        		location.href="../cart/order_ok.do";
			        	}
			         })
		    }
		    alert(msg);
		});
	}
	
	$('#orderBtn').click(function(){
		name = $('#g_name').text();
		total1 = $('#total').text();
		total = parseInt(total1);
		bemail = $('#c_email').val();
		bname = $('#c_name').val();
		btel = $('#c_tel').val();
		baddr = $('#c_addr1').val() + ' ' + $('#c_addr2').val();
		bpost = $('#c_post').val();
		
		addr1 = $('#c_addr1').val();
		addr2 = $('#c_addr2').val();
		content = $('#c_content').val();
		requestPay();
	})
	
})
</script>

  </head>
  <body>
    <div class="site-section">
      <div class="container">
        <div class="row mb-1">
          <div class="col-md-12">
            
          </div>
        </div>
        <div class="row">
          <div class="col-md-6 mb-5 mb-md-0">
            <h2 class="h3 mb-3 text-black">배송 정보</h2>
            <div class="p-3 p-lg-5 border">

              <div class="form-group row">
                <div class="col-md-6">
                  <label for="c_fname" class="text-black"> 수령인 <span class="text-danger">*</span></label>
                  <input type="text" class="form-control" id="c_name" name="c_name" value="${vo.name }">
                  <input type="hidden" id="c_id" value="${vo.id }">
                </div>
              </div>


              <div class="form-group row">
                
              <div class="form-group row">
                <div class="col-md-6">
                    <label for="c_fname" class="text-black"> 우편번호 <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" id="c_post" name="c_post" value="${vo.post }">
                  </div>
                  <div class="col-md-6" style="margin-top:35px;">
                    <a class="btn btn-primary" style="color: white;" id="postfind">우편번호 찾기</a>
                  </div>
                </div>
                
                <div class="col-md-12">
                  <label for="c_address" class="text-black">주소 <span class="text-danger">*</span></label>
                  <input type="text" class="form-control" id="c_addr1" name="c_addr1" placeholder="기본 주소" readonly value="${vo.addr1 }">
                </div>
              </div>

              <div class="form-group">
                <input type="text" class="form-control" placeholder="상세 주소" id="c_addr2" name="c_addr2" value="${vo.addr2 }">
              </div>

              <div class="form-group row mb-5">
                <div class="col-md-6">
                  <label for="c_email_address" class="text-black">이메일 <span class="text-danger">*</span></label>
                  <input type="text" class="form-control" id="c_email" name="c_email" value="${vo.email }">
                </div>
                <div class="col-md-6">
                  <label for="c_phone" class="text-black">전화번호 <span class="text-danger">*</span></label>
                  <input type="text" class="form-control" id="c_tel" name="c_tel placeholder="Phone Number" value="${vo.tel }">
                </div>
              </div>

              <div class="form-group">
                <label for="c_order_notes" class="text-black">요구사항</label>
                <textarea name="c_order_notes" id="c_content" cols="30" rows="5" class="form-control" placeholder="요구사항 입력"></textarea>
              </div>

            </div>
          </div>
          <div class="col-md-6">
            
            <div class="row mb-5">
              <div class="col-md-12">
                <h2 class="h3 mb-3 text-black">결제상세</h2>
                <div class="p-3 p-lg-5 border">
                  <table class="table site-block-order-table mb-5">
                    <thead>
                      <th width="65%">상품명</th>
                      <th width="15%">수량</th>
                      <th width="20%">금액</th>
                    </thead>
                    <tbody>
                      <c:forEach var="cvo" items="${list }" varStatus="s">
                        <tr>
                          <td id="g_name">${cvo.g_name }</td>
                          <td>${cvo.c_account }개</td>
                          <td>${cvo.c_price }원</td>
                        </tr>
					  </c:forEach>
                      <tr>
                        <td class="text-black font-weight-bold"><strong>총 금액</strong></td>
                        <td></td>
                        <td class="text-black font-weight-bold" id="total"><strong>${total}원</strong></td>
                      </tr>
                    </tbody>
                  </table>

                  <div class="form-group">
                    <button class="btn btn-primary btn-lg btn-block" id="orderBtn">결제하기</button>
                  </div>

                </div>
              </div>
            </div>

          </div>
        </div>
        <!-- </form> -->
      </div>
    </div>


  <script src="js/jquery-3.3.1.min.js"></script>
  <script src="js/jquery-ui.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/aos.js"></script>

  <script src="js/main.js"></script>
    
  </body>
</html>