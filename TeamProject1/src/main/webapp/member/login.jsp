<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'><link rel="stylesheet" href="./style.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
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
				alert("아이디가 존재하지 않습니다.");
				$('#id').val("")
				$('#pwd').val("")
				$('#id').focus();
			}
			else if(res==='NOPWD')
			{
				alert("비밀번호가 틀립니다.");
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
</head>
<body>
<p class="tip"><br></p>
<div class="cont">
  <div class="form sign-in">
    <h2>Login</h2><br>
    <label class="login">
      <span class="login">ID</span>
      <input type="text" placeholder="아이디를 입력하세요" id="id">
    </label><br>
    <label class="login">
      <span class="login">Password</span>
      <input type="password" placeholder="비밀번호를 입력하세요" id="pwd">
    </label>
    <p class="forgot-pass"><br></p>
    <button type="button" class="submit" id="logBtn" style="margin:0px auto;width:100px;border-radius:20px;">로그인</button><br>
    <button type="button" class="fb-btn" style="margin:0px auto;width:350px; border-radius:20px;">회원정보를 잊으셨나요?  <span> 아이디 비밀번호 찾기</span></button>
  </div>
 
  <div class="sub-cont">
    <div class="img">
      <div class="img__text m--up">
        <h2 style="color: white">
        회원이<br>
         아니신가요?</h2><br><br>
        <p>캠핑에 관한<br>
         다양한 정보를 제공하는<br>
         캠핑<sup>+</sup>의 편리함을 경험해보세요</p><br>
        <button type="button" class="submit" style="margin:0px auto;width:100px;border-radius:20px;">가입하기</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>