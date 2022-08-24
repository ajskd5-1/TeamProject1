<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>

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

<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	let g_id = $('#g_id').val();
	let g_price = $('#g_price').val();
	$.ajax({
		type:'post',
		url:'../cart/cart_list.do',
		//data:{"g_id":g_id, "g_price":g_price},
		success:function(result){
			$('#print').html(result);
		}
	})

	/* $('.del').click(function(){
		let g_id = $('.del').attr("data-g_id");
		$.ajax({
			type:'post',
			url:'../cart/cart_delete.do',
			data:{"g_id":g_id},
			success:function(result){
				alert('삭제');
				$('#print').html(result);
				
			}
		})
	}) */
})
</script>
</head>
  <body>
    <!-- ======= Breadcrumbs ======= -->
      
  <!-- -------------------------------------------------------------------------------------------------------------- -->
<input type="hidden" id="g_id" value="${g_id }">
<input type="hidden" id="g_price" value="${g_price }">  

  <div id="print">
  
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