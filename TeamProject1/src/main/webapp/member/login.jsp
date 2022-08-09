<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'><link rel="stylesheet" href="./style.css">
</head>
<body>
<!-- partial:index.partial.html -->
<p class="tip"><br></p>
<div class="cont">
  <div class="form sign-in">
    <h2>Login</h2><br>
    <label class="login">
      <span class="login">아이디를 입력하세요</span>
      <input type="email" id="id"/>
    </label><br>
    <label class="login">
      <span class="login">비밀번호를 입력하세요</span>
      <input type="password" id="pwd" />
    </label>
    <p class="forgot-pass"><br></p>
    <button type="button" class="submit" style="margin:0px auto;width:100px;border-radius:20px;">로그인</button><br>
    <button type="button" class="fb-btn" style="margin:0px auto;width:350px; border-radius:20px;">회원정보를 잊으셨나요?  <span> 아이디 비밀번호 찾기</span></button>
  </div>
 
  <div class="sub-cont">
    <div class="img">
      <div class="img__text m--up">
        <h2 style="color: white">
        회원이<br>
         아니신가요?</h2><br><br>
        <p>캠핑장,캠핑용품,캠핑레시피<br>
         캠핑에 관한 모든 정보를 제공하는<br>
         캠핑<sup>+</sup>의 편리함을 경험해보세요</p><br>
        <button type="button" class="submit" style="margin:0px auto;width:100px;border-radius:20px;">가입하기</button>
      </div>
      <div class="img__text m--in">
        <h2>One of us?</h2>
        <p>If you already has an account, just sign in. We've missed you!</p>
      </div>
        <span class="m--in">Sign In</span>
    </div>
    <!-- <div class="form sign-up">
      <h2>Time to feel like home,</h2>
      <label>
        <span>Name</span>
        <input type="text" />
      </label>
      <label>
        <span>Email</span>
        <input type="email" />
      </label>
      <label>
        <span>Password</span>
        <input type="password" />
      </label>
      <button type="button" class="submit">Sign Up</button>
      <button type="button" class="fb-btn">Join with <span>facebook</span></button>
    </div> -->
  </div>
</div>

<!-- <a href="https://dribbble.com/shots/3306190-Login-Registration-form" target="_blank" class="icon-link">
  <img src="http://icons.iconarchive.com/icons/uiconstock/socialmedia/256/Dribbble-icon.png">
</a>
<a href="https://twitter.com/NikolayTalanov" target="_blank" class="icon-link icon-link--twitter">
  <img src="https://cdn1.iconfinder.com/data/icons/logotypes/32/twitter-128.png">
</a> -->
<!-- partial -->
  <script  src="./script.js"></script>

</body>
</html>