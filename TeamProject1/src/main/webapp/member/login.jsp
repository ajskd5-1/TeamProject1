<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="./style.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript">
$(function(){
	$('#logBtn').on("click",function(){
		let id=$('#id').val();
		if(id.trim()=="")
		{
			$('#id').focus();
			return;
		}
		let pwd=$('#pwd').val();
		if(pwd.trim()=="")
			{
				$('#pwd').focus();
				return;
			}
	$.ajax({
		type:'post',
		url:'../member/login_ok.do',
		data:{"id":id,"pwd":pwd},
		success:function(result)
		{
			let res=result.trim();
			if(res==='NOID')
			{
				$('#loginMsg').text("아이디가 존재하지 않습니다.");
				$('#id').val("");
				$('#pwd').val("");
				$('#id').focus();
			}
			else if(res==='NOPWD')
			{
				$('#loginMsg').text("비밀번호가 틀립니다.");
				$('#pwd').val("");
				$('#pwd').focus();
			}
			else
			{
				location.href="../main/main.do";
			}
			
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
h2{
	font-family: 'BMJUA';
}
span#title{
	font-family: 'BMJUA';
}
</style>
</head>
<body>
<p class="tip"><br></p>
<div class="cont">
  <img src="../member/image/back8.png" style="height: 40px; width: 40px; cursor: pointer; margin:3px 20px 0px 5px;" onclick="javascript:history.back()">
  <div class="form sign-in">
    <h2>Login</h2><br>
    <label class="login">
      <span class="login">ID</span>
      <input type="text" placeholder="아이디를 입력하세요"  id="id" style="font-size: 10pt;">
    </label><br>
    <label class="login">
      <span class="login">Password</span>
      <input type="password" placeholder="비밀번호를 입력하세요" id="pwd" style="font-size: 10pt;">
    </label>
    <br>
  <div class="forgot-pass">
  	<span id="loginMsg" style="color:red; font-weight: bold; font-size: 11pt;" ></span>
    <button type="button" class="submit" id="logBtn" style="margin:0px auto;width:100px;border-radius:20px;">로그인</button><br>
  </div>
  <div class="forgot-pass">
    <button type="button" class="fb-btn" style="display: inline;margin:0px auto;width:120px; "onclick="location.href='../member/idfind.do'"><span>아이디 찾기</span></button>
    <button type="button" class="fb-btn" style="display: inline;margin:0px auto;width:150px; "onclick="location.href='../member/pwdfind.do'"><span>비밀번호 찾기</span></button>
  </div>
 </div>
 
  <div class="sub-cont">
    <div class="img">
      <div class="img__text m--up">
        <h2 style="color: white">
        회원이<br>
         아니신가요?</h2><br><br>
        <p>캠핑과 관련된<br>
         다양한 정보를 제공하는<br>
         <span id="title" style="font-size: 18pt;">캠핑<sup>+</sup></span>의 <br>
         놀라움을 경험해보세요</p><br><br>
        <button type="button" class="submit" id="joinBtn" onclick="location.href='../member/join.do'"
        style="margin:0px auto;width:100px;border-radius:20px;">가입하기</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>