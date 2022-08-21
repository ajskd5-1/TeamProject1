<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script type="text/javascript" src="//code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
$(function(){
	$('#nicknameBtn').click(function(){
		let nickname=$('#nickname').val();
		let nicknameBtn=$('#nicknameBtn').val();
		if(nickname.trim()==="")
		{
			$('#nickname').focus();
			return;
		}
		if(nicknameBtn==='수정하기')
		{
			$('#nickname').attr('readonly',false);
			$('#nickname').focus();
			$('#nickname').val("");
			$('#nicknameBtn').attr('value','중복확인');
			$('#nicknameBtn').attr('style','background-color: #0ea2bd; padding: 8px 10px');
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
					$('#nicknameBtn').attr('value','확인완료')
					$('#nicknameBtn').attr('style','background-color: #ffcb5f; padding: 8px 10px')
				}
				else
				{
					$('#nicknameMsg').html("<div style='color:red'>'"+nickname+"' 는(은) 이미 사용중인 닉네임 입니다.")	
					$('#nicknameBtn').attr('value','중복확인');
					$('#nicknameBtn').attr('style','background-color: #0ea2bd; padding: 8px 10px');
					$('#nickname').val("")
					$('#nickname').focus()
				}
			}
		})
	})
	$('#telBtn').click(function(){
		let tel=$('#tel').val();
		let telBtn=$('#telBtn').val();
		var test="-";
		if(tel.trim()==="")
		{
			$('#tel').focus();
			return;
		}
		if(tel.indexOf(test)===-1)
		{
			$('#telMsg').html("<div style='color:red'> - 를 포함하여 작성해주세요. XXX-XXXX-XXXX")
			return;
		}
		if(telBtn==='수정하기')
		{
			$('#tel').attr('readonly',false);
			$('#tel').focus();
			$('#tel').val("");
			$('#telBtn').attr('value','중복확인');
			$('#telBtn').attr('style','background-color: #0ea2bd; padding: 8px 10px');
			return;
		}
		if(tel)
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
					$('#telBtn').attr('value','확인완료')
					$('#telBtn').attr('style','background-color: #ffcb5f; padding: 8px 10px')
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
		let emailBtn=$('#emailBtn').val();
		if(email.trim()==="")
		{
			$('#email').focus();
			return;
		}
		if(emailBtn==='수정하기')
		{
			$('#email').attr('readonly',false);
			$('#email').focus();
			$('#email').val("");
			$('#emailBtn').attr('value','중복확인');
			$('#emailBtn').attr('style','background-color: #0ea2bd; padding: 8px 10px');
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
					$('#emailBtn').attr('value','확인완료')
					$('#emailBtn').attr('style','background-color: #ffcb5f; padding: 8px 10px')
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
	$('#pwdCheckBtn').click(function(){
		let pwd_before=$('#pwd_before').val();
		let pwd=$('#pwd').val();
		if(pwd_before.trim()==="")
		{
			$('#pwd_before').focus()
			return;
		}
		if(pwd.trim()==="")
		{
			$('#pwd').focus()
			return;
		}
		if(pwd_before!=pwd)
		{
			$('#pwdcheck').text('  * 비밀번호가 틀립니다.')
			$('#pwd_before').focus()
			$('#pwd').val("")
		}
		else
		{
			$('#pwdCheckBtn').attr('value','완료')
			$('#pwdCheckBtn').attr('style','background-color: #ffcb5f; padding: 8px 10px')
			$('#pwdcheck').text("")
		}
	})
	$('#updateBtn').click(function(){
		let nicknameBtn=$('#nicknameBtn').val();
		let telBtn=$('#telBtn').val();
		let emailBtn=$('#emailBtn').val();
		let nickname=$('#nickname').val();
		let name=$('#name').val();
		let birthdate=$('#birthdate').val();
		let tel=$('#tel').val();
		let email=$('#email').val();
		let post=$('#post').val();
		let addr1=$('#addr1').val();
		let addr2=$('#addr2').val();
		if(nicknameBtn!='중복확인'&&telBtn!='중복확인'&&emailBtn!='중복확인')
		{
			if(nickname.trim()!=""
					&&name.trim()!=""
					&&birthdate.trim()!=""
					&&tel.trim()!=""
				&&email.trim()!=""
				&&post.trim()!=""
				&&addr1.trim()!=""
				&&addr2.trim()!="")
			{
				$('#update_frm').submit();
			}
			else
			{
				$('#updateMsg').text('모든 값을 입력해주세요.');
			}
		}
		else
		{
			$('#updateMsg').text('중복확인을 완료해주세요.');
			return;
		}
		
	})
})
</script>
<style type="text/css">
*{
	font-family: 'NanumSquareRound';
}
.title{
	font-family: 'BMJUA';
}
</style>
</head>
<body>
      <div class="container" data-aos="fade-up">
        <div class="row g-5">
          <div class="col-md-10 offset-md-1 col-lg-10 offset-lg-1">
            <div class="comments">
            
              <div class="reply-form" style="padding: 80px; padding-top:40px; margin: 0px;">
              <h3 class="title">회원정보 수정</h3>
              	<br>
                <p style="font-size: 13pt;"><span style="font-weight: bold;color:#0ea2bd;font-size: 14pt;">${sessionScope.nickname }</span>님, 변경이 필요한 정보를 수정해주세요.</p>
                <br>
                <br>
                <form method="post" action="../member/join_update_ok.do" name="update_frm" id="update_frm">
                  <div class="row" style="padding: 5px 0 5px 0; margin: 0px;">
                    <div class="col-md-3 form-group" style="padding: 8px 10px">
<!-- 아이디 -->
                      <label>아이디</label>
                    </div>
                    <div class="col-md-6 form-group">
                      <input id="id" name="id" type="text" class="form-control" readonly value="${vo.id }">
                    </div>
                  </div>
<!-- 닉네임 -->
                  <div class="row" style="padding: 5px 0 5px 0; margin: 0px;">
                    <div class="col-md-3 form-group" style="padding: 8px 10px">
                      <label>닉네임</label>
                    </div>
                    <div class="col-md-6 form-group">
                      <input id="nickname" name="nickname" type="text" class="form-control" placeholder="닉네임 입력" value="${vo.nickname }" readonly="readonly">
                      <div class="join msg" id="nicknameMsg" style="font-size: 11pt;" ></div>
                    </div>
                    <div class="col-md-2 form-group">
                      <input id="nicknameBtn" type="button" value="수정하기" class="btn btn-primary" style="background-color: #6f75ad; padding: 8px 10px;"></input>
                    </div>
                  </div>
<!-- 이름 -->
                  <div class="row" style="padding: 5px 0 5px 0; margin: 0px;">
                    <div class="col-md-3 form-group" style="padding: 8px 10px">
                      <label>이름</label>
                    </div>
                    <div class="col-md-6 form-group">
                      <input id="name" name="name" type="text" class="form-control" placeholder="이름 입력" value="${vo.name }">
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
                      <input id="tel" name="tel" type="text" class="form-control" placeholder="전화번호 입력" value="${vo.tel }" readonly="readonly">
                      <div class="join msg" id="telMsg" style="font-size: 11pt;" ></div>
                    </div>
                    <div class="col-md-2 form-group">
                      <input id="telBtn" type="button" value="수정하기" class="btn btn-primary" style="background-color: #6f75ad; padding: 8px 10px;"></input>
                    </div>
                  </div>
<!-- 이메일 -->
                  <div class="row" style="padding: 5px 0 5px 0; margin: 0px;">
                    <div class="col-md-3 form-group" style="padding: 8px 10px">
                      <label>e-mail</label>
                    </div>
                    <div class="col-md-6 form-group">
                      <input id="email" name="email" type="text" class="form-control" placeholder="이메일 입력" value="${vo.email }" readonly="readonly">
                      <div class="join msg" id="emailMsg" style="font-size: 11pt;" ></div>
                    </div>
                    <div class="col-md-2 form-group">
                      <input id="emailBtn" type="button" value="수정하기" class="btn btn-primary" style="background-color: #6f75ad; padding: 8px 10px;"></input>
                    </div>
                  </div>
<!-- 우편번호 -->
                  <div class="row" style="padding: 5px 0 5px 0; margin: 0px;">
                    <div class="col-md-3 form-group" style="padding: 8px 10px">
                      <label>우편번호</label>
                    </div>
                    <div class="col-md-6 form-group">
                      <input id="post" name="post" type="text" class="form-control" placeholder="우편번호 찾기 버튼 클릭" readonly="readonly" value="${vo.post }">
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
                      <input id="addr1" name="addr1" type="text" class="form-control" placeholder="우편번호 찾기 버튼 클릭" readonly="readonly" value="${vo.addr1 }">
                      <div class="join msg" id="addr1Msg" hidden="" style="color:red; font-size: 11pt;">  * 우편번호 찾기 버튼을 클릭하세요</div>
                    </div>
                  </div>
                  <div class="row" style="padding: 5px 0 5px 0; margin: 0px;">
                    <div class="col-md-3 form-group" style="padding: 8px 10px">
<!-- 상세주소 -->
                      <label>상세 주소</label>
                    </div>
                    <div class="col-md-6 form-group">
                      <input id="addr2" name="addr2" type="text" class="form-control" placeholder="상세주소 입력" value="${vo.addr2 }">
                      <div class="join msg" id="addr2Msg" hidden="" style="color:red; font-size: 11pt;">  * 상세주소를 입력하세요</div>
                    </div>
                  </div>
				  <br>
				  <div class="join msg" id="updateMsg" style="font-size: 13pt; color: red;"></div>
				  <br>
                  <button id="updateBtn" type="button" class="btn btn-primary" style="background-color: #ffcb5f; border-radius: 30px;">수정하기</button>
                  <button id="backBtn" type="button" class="btn btn-primary" style="background-color:#dfa9a9; border-radius: 30px; margin-left: 20px;" onclick="location.href='../member/join_update.do'">정보리셋</button>
                </form>
              </div>
            </div><!-- End blog comments -->
          </div>
        </div>
      </div>
</body>
</html>