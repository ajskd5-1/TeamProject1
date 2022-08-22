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
	$('.res').hide();
	//$('#r_date2').hide();
	$.ajax({
		type:'post',
		url:'../reserve/reserve_date.do',
		success:function(result){
			$('#r_date').html(result);
		}
	})
	$('#r_days').change(function(){
		let days = $('#r_days').val();
		$('#r_ds').text(days);
		
	})
	$('#r_inwon').change(function(){
		let inwon = $('#r_inwon').val();
		$('#r_i').text(inwon+'명');
		$('#re_i').val(inwon);
		$('.res').show();
	})
	$('#smonth').change(function(){
		let smonth = $('#smonth').val();
		$.ajax({
			type:'post',
			url:'../reserve/reserve_date.do',
			data:{"smonth":smonth},
			success:function(result){
				$('#r_date').html(result);
			}
		})
	})
	
	$('#smonth2').change(function(){
		let smonth2 = $('#smonth2').val();
		$.ajax({
			type:'post',
			url:'../reserve/reserve_date2.do',
			data:{"smonth":smonth2},
			success:function(result){
				$('#r_date2').html(result);
			}
		})
	})
	
})
</script>
</head>
<body>
  <div class="row">
    <table class="table text-center">
      <tr style="width: 100%">
        <th>체크인 날짜</th>
        <th>체크아웃 날짜</th>
        <th>인원선택</th>
      </tr>
      <tr>
        <td class="text-center" width="30%" rowspan="3">
        	${year }년
        	<select name="month" class="input-sm" id="smonth">
              <c:forEach var="i" begin="1" end="12">
                <option ${month==i?"selected":"" }>${i }</option>
              </c:forEach>
            </select>월 ${day }일
          <div id="r_date"></div>
        </td>
        
        <td class="text-center" width="30%" rowspan="3">
        	${year }년
        	<select name="month2" class="input-sm" id="smonth2">
              <c:forEach var="i" begin="1" end="12">
                <option ${month==i?"selected":"" }>${i }</option>
              </c:forEach>
            </select>월
          <div id="r_date2"></div>
        </td>
        <td class="text-center" width="40%">
          <select name="r_inwon" id="r_inwon" style="width: 30%">
		    <option value="">인원선택</option>
		    <option value="1">1명</option>
		    <option value="2">2명</option>
		    <option value="3">3명</option>
		    <option value="4">4명</option>
		    <option value="5">5명</option>
		    <option value="6">6명</option>
		    <option value="7">7명</option>
		    <option value="8">8명</option>
		  </select>
        </td>
      </tr>
      <tr>
        <th height="10px;">예약정보</th>
      </tr>
      <tr>
        <td>
          <table class="table text-center">
            <tr>
              <td style="width: 30%">
                체크인
              </td>
              <td style="width: 30%">
                체크아웃
              </td>
              <td>인원</td>
              <td></td>
            </tr>
            <tr>
              <td id="r_d"></td>
              <td id="r_d2"></td>
              <td id="r_i"></td>
              <td>
                <form method="post" action="../reserve/reserve_ok.do">
                  <input type="hidden" name="fno" value="${no }"><%-- value는 각 jsp에서 넘겨줌 --%>
                  <input type="hidden" name="cin" id="re_d">
                  <input type="hidden" name="cout" id="re_d2">
                  <input type="hidden" name="inwon" id="re_i">
                  <button class="btn btn-sm btn-primary">예약</button>
                </form>
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
  </div>
</body>
</html>
