<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인 정보 수정</title>
<script type="text/javascript" src="//code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
$(function(){
	$('#idBtn').click(function(){
		let id=$('#id').val();
		if(id.trim()==="")
		{
			$('#id').focus();
			return;
		}
		$.ajax({
			type:'post',
			url:'../member/idcheck_ok.do',
			data:{"id":id},
			success:function(result)
			{
				let count=parseInt(result.trim());
				if(count===0)
				{
					$('#idMsg').html("<div style='color:blue'>'"+id+"' 는(은) 사용가능한 아이디 입니다.")
				}
				else
				{
					$('#idMsg').html("<div style='color:red'>'"+id+"' 는(은) 이미 사용중인 아이디 입니다.")	
					$('#id').val("")
					$('#id').focus()
				}
			}
		})
	})
	$('#nicknameBtn').click(function(){
		let nickname=$('#nickname').val();
		if(nickname.trim()==="")
		{
			$('#nickname').focus();
			return;
		}
		$.ajax({
			type:'post',
			url:'../member/nncheck_ok.do',
			data:{"nickname":nickname},
			success:function(result)
			{
				let count=parseInt(result.trim());
				if(count===0)
				{
					$('#nicknameMsg').html("<div style='color:blue'>'"+nickname+"' 는(은) 사용가능한 닉네임 입니다.")
				}
				else
				{
					$('#nicknameMsg').html("<div style='color:red'>'"+nickname+"' 는(은) 이미 사용중인 닉네임 입니다.")	
					$('#nickname').val("")
					$('#nickname').focus()
				}
			}
		})
	})
	$('#telBtn').click(function(){
		let tel=$('#tel').val();
		if(tel.trim()==="")
		{
			$('#tel').focus();
			return;
		}
		$.ajax({
			type:'post',
			url:'../member/telcheck_ok.do',
			data:{"tel":tel},
			success:function(result)
			{
				let count=parseInt(result.trim());
				if(count===0)
				{
					$('#telMsg').html("<div style='color:blue'>'"+tel+"' 는(은) 사용가능한 전화번호 입니다.")
				}
				else
				{
					$('#telMsg').html("<div style='color:red'>'"+tel+"' 는(은) 이미 사용중인 전화번호 입니다.")	
					$('#tel').val("")
					$('#tel').focus()
				}
			}
		})
	})
	$('#emailBtn').click(function(){
		let email=$('#email').val();
		if(email.trim()==="")
		{
			$('#email').focus();
			return;
		}
		$.ajax({
			type:'post',
			url:'../member/emailcheck_ok.do',
			data:{"email":email},
			success:function(result)
			{
				let count=parseInt(result.trim());
				if(count===0)
				{
					$('#emailMsg').html("<div style='color:blue'>'"+email+"' 는(은) 사용가능한 이메일 입니다.")
				}
				else
				{
					$('#emailMsg').html("<div style='color:red'>'"+email+"' 는(은) 이미 사용중인 이메일 입니다.")	
					$('#email').val("")
					$('#email').focus()
				}
			}
		})
	})
	$('#postfind').click(function(){
		// 우편번호 검색 처리 
		new daum.Postcode({
			oncomplete:function(data)
			{
				$('#post').val(data.zonecode)
				$('#addr1').val(data.address)
			}
		}).open()
	})
	$('').click(function(){
		$('').submit();
	})
})
</script>
</head>
<body>
    <!-- ======= Blog Details Section ======= -->
          <div class="col-md-10 col-lg-10">
            <div class="comments">
              <div class="reply-form" style="padding: 100px;">
                <h4>개인 정보 수정</h4>
                <br>
                <h6>캠핑<sup>+</sup>에 오신걸 환영합니다.</h6>
                <br>
                <br>
                <form method="post" action="../member/join_ok.do" name="join_frm" id="join_frm">
                  <div class="row" style="padding: 5px 0 5px 0; margin: 0px;">
                    <div class="col-md-3 form-group" style="padding: 8px 10px">
<!-- 아이디 -->
                      <label>아이디</label>
                    </div>
                    <div class="col-md-6 form-group">
                      <input id="id" name="id" type="text" class="form-control" readonly="readonly" value="${vo.id }">
                      <div class="join msg" id="idMsg" style="font-size: 11pt;" ></div>
                    </div>
                    <div class="col-md-2 form-group">
                      <input id="idBtn" type="button" value="중복확인" class="btn btn-primary" style="background-color: #0ea2bd; padding: 8px 10px"></input>
                    </div>
                  </div>
<!-- 비밀번호 -->
                  <div class="row" style="padding: 5px 0 5px 0; margin: 0px;">
                    <div class="col-md-3 form-group" style="padding: 8px 10px">
                      <label>비밀번호</label>
                    </div>
                    <div class="col-md-3 form-group">
                      <input id="pwd_before" name="pwd_before" type="password" class="form-control" placeholder="비밀번호 입력">
                      <div class="join msg" id="pwd_beforeMsg" hidden="" style="color:red; font-size: 11pt;">  * 비밀번호를 입력하세요</div>
                    </div>
<!-- 비밀번호 확인 -->
                    <div class="col-md-2 form-group" style="padding: 8px 10px; text-align: right;">
                      <label>비밀번호 확인</label>
                    </div>
                    <div class="col-md-3 form-group">
                      <input id="pwd" name="pwd" type="password" class="form-control" placeholder="비밀번호 재입력">
                      <div class="join msg" id="pwdMsg" hidden="" style="color:red; font-size: 11pt;">  * 암호를 다시 입력하십시오</div>
                    </div>
                  </div>
<!-- 닉네임 -->
                  <div class="row" style="padding: 5px 0 5px 0; margin: 0px;">
                    <div class="col-md-3 form-group" style="padding: 8px 10px">
                      <label>닉네임</label>
                    </div>
                    <div class="col-md-6 form-group">
                      <input id="nickname" name="nickname" type="text" class="form-control" value="${vo.nickname }">
                      <div class="join msg" id="nicknameMsg" style="font-size: 11pt;" ></div>
                    </div>
                    <div class="col-md-2 form-group">
                      <input id="nicknameBtn" type="button" value="중복확인" class="btn btn-primary" style="background-color: #0ea2bd; padding: 8px 10px"></input>
                    </div>
                  </div>
<!-- 이름 -->
                  <div class="row" style="padding: 5px 0 5px 0; margin: 0px;">
                    <div class="col-md-3 form-group" style="padding: 8px 10px">
                      <label>이름</label>
                    </div>
                    <div class="col-md-6 form-group">
                      <input id="name" name="name" type="text" class="form-control" value="${vo.name }">
                      <div class="join msg" id="nameMsg" hidden="" style="color:red; font-size: 11pt;">  * 이름을 입력하세요</div>
                    </div>
                  </div>
<!-- 성별 -->
                  <div class="row" style="padding: 5px 0 5px 0; margin: 0px;">
                    <div class="col-md-3 form-group" style="padding: 8px 10px">
                      <label>성별</label>
                    </div>
                    <div class="col-md-6 form-group">
	                   <input type=radio value="남자" name=sex ${vo.sex=='남자'?"checked":"" }>남자&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         			   <input type=radio value="여자" name=sex ${vo.sex=='여자'?"checked":"" }>여자   
                    </div>
                  </div>
<!-- 생년월일 -->
                  <div class="row" style="padding: 5px 0 5px 0; margin: 0px;">
                    <div class="col-md-3 form-group" style="padding: 8px 10px">
                      <label>생년월일</label>
                    </div>
                    <div class="col-md-6 form-group">
                      <input id="birthdate" name="birthdate" type="date" class="form-control" value="${vo.birthdate }">
                      <div class="join msg" id="birthdateMsg" hidden="" style="color:red; font-size: 11pt;">  * 생년월일을 입력하세요</div>
                    </div>
                  </div>
<!-- 전화번호 -->
                  <div class="row" style="padding: 5px 0 5px 0; margin: 0px;">
                    <div class="col-md-3 form-group" style="padding: 8px 10px">
                      <label>전화번호</label>
                    </div>
                    <div class="col-md-6 form-group">
                      <input id="tel" name="tel" type="text" class="form-control" value="${vo.tel }">
                      <div class="join msg" id="telMsg" style="font-size: 11pt;" ></div>
                    </div>
                    <div class="col-md-2 form-group">
                      <input id="telBtn" type="button" value="중복확인" class="btn btn-primary" style="background-color: #0ea2bd; padding: 8px 10px"></input>
                    </div>
                  </div>
<!-- 이메일 -->
                  <div class="row" style="padding: 5px 0 5px 0; margin: 0px;">
                    <div class="col-md-3 form-group" style="padding: 8px 10px">
                      <label>e-mail</label>
                    </div>
                    <div class="col-md-6 form-group">
                      <input id="email" name="email" type="text" class="form-control" value="${vo.email }">
                      <div class="join msg" id="emailMsg" style="font-size: 11pt;" ></div>
                    </div>
                    <div class="col-md-2 form-group">
                      <input id="emailBtn" type="button" value="중복확인" class="btn btn-primary" style="background-color: #0ea2bd; padding: 8px 10px"></input>
                    </div>
                  </div>
<!-- 우편번호 -->
                  <div class="row" style="padding: 5px 0 5px 0; margin: 0px;">
                    <div class="col-md-3 form-group" style="padding: 8px 10px">
                      <label>우편번호</label>
                    </div>
                    <div class="col-md-6 form-group">
                      <input id="post" name="post" type="text" class="form-control" value="${vo.post }" readonly="readonly">
                      <div class="join msg" id="postMsg" hidden="" style="color:red; font-size: 11pt;">  * 우편번호 찾기 버튼을 클릭하세요</div>
                    </div>
                    <div class="col-md-2 form-group">
                      <input id="postfind" type="button" value="우편번호 찾기" class="btn btn-primary" style="background-color: #0ea2bd; padding: 8px 10px; font-size: 11pt;">
                    </div>
                  </div>
<!-- 주소 -->
                  <div class="row" style="padding: 5px 0 5px 0; margin: 0px;">
                    <div class="col-md-3 form-group" style="padding: 8px 10px">
                      <label>주소</label>
                    </div>
                    <div class="col-md-6 form-group">
                      <input id="addr1" name="addr1" type="text" class="form-control" value="${vo.addr1 }" readonly="readonly">
                      <div class="join msg" id="addr1Msg" hidden="" style="color:red; font-size: 11pt;">  * 우편번호 찾기 버튼을 클릭하세요</div>
                    </div>
                  </div>
                  <div class="row" style="padding: 5px 0 5px 0; margin: 0px;">
                    <div class="col-md-3 form-group" style="padding: 8px 10px">
<!-- 상세주소 -->
                      <label>상세 주소</label>
                    </div>
                    <div class="col-md-6 form-group">
                      <input id="addr2" name="addr2" type="text" class="form-control" value="${vo.addr2 }">
                      <div class="join msg" id="addr2Msg" hidden="" style="color:red; font-size: 11pt;">  * 상세주소를 입력하세요</div>
                    </div>
                  </div>
				  <br>
                  <button id="joinBtn" type="button" class="btn btn-primary">회원 수정</button>
                  <button id="joinBtn" type="button" class="btn btn-primary">취소</button>
                </form>
              </div>
            </div><!-- End blog comments -->
          </div>
</body>
</html>