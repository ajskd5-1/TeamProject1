<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="./style.css">
<script src="https://code.jquery.com/jquery.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript">
$(function(){
	  $( function() {
		    $( "#tabs" ).tabs();
		  } );
	  $('#pwd_e_Btn').click(function(){
		  let e_id=$('#e_id').val()
		  let email=$('#email').val()
		  if(e_id.trim()==="")
	  	  {
			  $('#e_id').focus()
			  return;
	  	  }
		  if(email.trim()==="")
	  	  {
			  $('#email').focus()
			  return;
	  	  }
		  $.ajax({
			  type:'post',
			  url:'../member/pwd_find_email_ok.do',
			  data:{"id":e_id,"email":email},
			  success:function(result)
			  {
				  $('#pwd_e_Msg').text(result);
			  }
		  })
	  })
	  $('#pwd_t_Btn').click(function(){
		  let t_id=$('#t_id').val()
		  let tel=$('#tel').val()
		  $('#telMsg').val("");
		  var test="-";
		  if(t_id.trim()==="")
	  	  {
			  $('#t_id').focus()
			  return;
	  	  }
		  if(tel.trim()==="")
	  	  {
			  $('#tel').focus()
			  return;
	  	  }
		  if(tel.indexOf(test)===-1)
	      {
			  $('#telMsg').text('- 를 포함하여 작성해주세요.');
			  return;
	      }
		  $.ajax({
			  type:'post',
			  url:'../member/pwd_find_tel_ok.do',
			  data:{"id":t_id,"tel":tel},
			  success:function(result)
			  {
				  $('#pwd_t_Msg').text(result);
			  }
		  })
	  })
})

</script>
<style type="text/css">
@font-face {
    font-family: 'NanumSquareRound';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/NanumSquareRound.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'BMJUA';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMJUA.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
*{
	font-family: 'NanumSquareRound';
}
h{
	font-family: 'BMJUA';
}
.container,#tabs,#tabs-1,#tabs-2,.cont{
  width: 600px;
  height: 500px;
  margin: 0 auto;
  padding: 0px;
}
#tabs{
	border: none;
}
.ui-state-active, .ui-widget-content .ui-state-active, .ui-widget-header .ui-state-active, a.ui-button:active, .ui-button:active, .ui-button.ui-state-active:hover {
    border: 3px solid ;
    background: #8fc1c7;
    font-weight: bold;
    color: #ffffff;
}
.ui-widget-header {
    border: none;
    background: #ffffff;
    color: #333333;
    font-weight: bold;
}
</style>
</head>
<body>
<p class="tip"><br></p>
<div class="container">
<div id="tabs">
  <ul>
    <li style="float: left;"><img src="../member/image/back8.png" style="height: 40px; width: 40px; cursor: pointer; margin-right: 20px; margin-left:5px;" onclick="javascript:history.back()"></li>
    <li><a href="#tabs-1" style="background-color: #8fc1c7">이메일로 찾기</a></li>
    <li><a href="#tabs-2" style="background-color: #8fc1c7">전화번호로 찾기</a></li>
  </ul>
  <div id="tabs-1">
  <div class="cont">
  	<div class="row" style="height: 80px;"></div>
	    <h2 style="font-size: 15pt;">비밀번호를 찾기 위해 정보를 입력하세요</h2><br>
	    <label class="login">
	      <span class="login">ID</span>
	      <input type="text" placeholder="아이디를 입력하세요"  id="e_id" style="font-size: 10pt;">
	    </label><br>
	    <label class="login">
	      <span class="login">E-MAIL</span>
	      <input type="text" placeholder="이메일을 입력하세요" id="email" style="font-size: 10pt;">
	    </label>
	    <br>
	    <p class="forgot-pass"><br></p>
	    <button type="button" class="fb-btn" id="pwd_e_Btn" style="margin:0px auto;width:100px;border-radius:20px;"><span>검색하기</span></button><br>
	  	<div class="forgot-pass">
	  		<span id="pwd_e_Msg" style="color:red; font-weight: bold; font-size: 13pt;" ></span>
	 	 </div>
  </div>
  </div>
  <div id="tabs-2">
  <div class="cont">
  	<div class="row" style="height: 80px;"></div>
	    <h2 style="font-size: 15pt;">비밀번호를 찾기 위해 정보를 입력하세요</h2><br>
	    <label class="login">
	      <span class="login">ID</span>
	      <input type="text" placeholder="아이디를 입력하세요"  id="t_id" style="font-size: 10pt;">
	    </label><br>
	    <label class="login">
	      <span class="login">TEL</span>
	      <input type="text" placeholder="전화번호를 입력하세요" id="tel" style="font-size: 10pt;">
	      <span id="telMsg" style="color:black; font-weight: bold; font-size: 11pt;" ></span>
	    </label>
	    <br>
	    <p class="forgot-pass"><br></p>
	    <button type="button" class="fb-btn" id="pwd_t_Btn" style="margin:0px auto;width:100px;border-radius:20px;"><span>검색하기</span></button><br>
	  	<div class="forgot-pass">
	  		<span id="pwd_t_Msg" style="color:red; font-weight: bold; font-size: 13pt;" ></span>
	 	 </div>
  </div>
  </div>
</div>
</div>
</body>
</html>