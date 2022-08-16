<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="./style.css">
<script src="https://code.jquery.com/jquery.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript">
$(function(){
	  $( function() {
		    $( "#tabs" ).tabs();
		  } );
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
  width: 900px;
  height: 550px;
  margin: 0 auto;
  padding: 0px;
}
#tabs{
	border: none;
}
.ui-state-active, .ui-widget-content .ui-state-active, .ui-widget-header .ui-state-active, a.ui-button:active, .ui-button:active, .ui-button.ui-state-active:hover {
    border: 3px solid #e1dfdf;
    background: #8fc1c7;
    font-weight: bold;
    color: #ffffff;
}
.ui-widget-header {
    border: none;
    background: #f9f9f9;
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
    <li><a href="#tabs-1" style="background-color: #8fc1c7">이메일로 찾기</a></li>
    <li><a href="#tabs-2" style="background-color: #8fc1c7">전화번호로 찾기</a></li>
  </ul>
  <div id="tabs-1">
  <div class="cont">
  	<div class="row" style="height: 80px;"></div>
	    <h2 style="font-size: 15pt;">아이디를 찾기위해 정보를 입력하세요</h2><br>
	    <label class="login">
	      <span class="login">NAME</span>
	      <input type="text" placeholder="이름을 입력하세요"  id="name">
	    </label><br>
	    <label class="login">
	      <span class="login">E-MAIL</span>
	      <input type="text" placeholder="이메일을 입력하세요" id="email">
	    </label>
	    <br>
	  <div class="forgot-pass">
	  	<span id="idMsg" style="color:red; font-weight: bold; font-size: 11pt;" ></span>
	  </div>
	    <p class="forgot-pass"><br></p>
	    <button type="button" class="submit" id="logBtn" style="margin:0px auto;width:100px;border-radius:20px;">검색하기</button><br><br>
	    <button type="button" class="fb-btn" style="margin:0px auto;width:350px; border-radius:20px;"onclick="#">비밀번호를 잊으셨나요?  <span> 비밀번호 찾기</span></button>
  </div>
  </div>
  <div id="tabs-2">
  <div class="cont">
  	<div class="row" style="height: 80px;"></div>
	    <h2 style="font-size: 15pt;">아이디를 찾기위해 정보를 입력하세요</h2><br>
	    <label class="login">
	      <span class="login">NAME</span>
	      <input type="text" placeholder="이름을 입력하세요"  id="name">
	    </label><br>
	    <label class="login">
	      <span class="login">TEL</span>
	      <input type="text" placeholder="전화번호를 입력하세요" id="tel">
	    </label>
	    <br>
	  <div class="forgot-pass">
	  	<span id="idMsg" style="color:red; font-weight: bold; font-size: 11pt;" ></span>
	  </div>
	    <p class="forgot-pass"><br></p>
	    <button type="button" class="submit" id="logBtn" style="margin:0px auto;width:100px;border-radius:20px;">검색하기</button><br><br>
	    <button type="button" class="fb-btn" style="margin:0px auto;width:350px; border-radius:20px;"onclick="#">비밀번호를 잊으셨나요?  <span> 비밀번호 찾기</span></button>
  </div>
  </div>
</div>
</div>
</body>
</html>