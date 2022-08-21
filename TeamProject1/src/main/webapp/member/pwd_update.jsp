<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#updateBtn').click(function(){
		let befo_pwd=$('#befo_pwd').val();
		let aft_pwd=$('#aft_pwd').val();
		let pwd=$('#pwd').val();
		let id=$('#id').val();
		let befo_pwdBtn=$('#befo_pwdBtn').val();
		if(befo_pwd.trim()==="")
		{
			$('#befo_pwd').focus();
			return;
		}
		if(aft_pwd.trim()==="")
		{
			$('#aft_pwd').focus();
			return;
		}
		if(pwd.trim()==="")
		{
			$('#pwd').focus();
			return;
		}
		if(befo_pwdBtn==="비밀번호 확인")
		{
			$('#pwdMsg').html("<div style='color:red'>  * 현재 비밀번호 확인 과정을 완료해주세요.")
			return;
		}
		if(aft_pwd!=pwd)
		{
			$('#pwdMsg').html("<div style='color:red'>  * 새 비밀번호를 다시 확인해주세요.")
			$('#aft_pwd').focus()
			$('#pwd').val("")
			return;
		}
		if(aft_pwd===pwd)
		{
			$('#pwdMsg').html("<div>")
		}
		$.ajax({
			type:'post',
			url:'../member/pwd_update_ok.do',
			data:{"pwd":pwd,"id":id},
			success:function(result)
			{
				location.href="../main/main.do";
			}
		})
	})
	$('#befo_pwdBtn').click(function(){
		let befo_pwd=$('#befo_pwd').val();
		let id=$('#id').val();
		if(befo_pwd.trim()==="")
		{
			$('#befo_pwd').focus();
			return;
		}
		$.ajax({
			type:'post',
			url:'../member/pwd_check_ok.do',
			data:{"pwd":befo_pwd,"id":id},
			success:function(result)
			{
				let res=result.trim();
				if(res==='false')
				{
					$('#pwdMsg').html("<div style='color:red'>  * 현재 비밀번호가 틀립니다. 다시 입력하세요")
					$('#befo_pwd').val('');
					$('#befo_pwd').focus('');
					$('#befo_pwdBtn').attr('value','비밀번호 확인')
					$('#befo_pwdBtn').attr('style','background-color: #0ea2bd; padding: 8px 10px;border: none;')
					return;
				}
				if(res==='true')
				{
					$('#befo_pwdBtn').attr('value','확인완료')
					$('#befo_pwdBtn').attr('style','background-color: #ffcb5f; padding: 8px 10px;border: none;')
					$('#pwdMsg').html("<div>")
					return;
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
.title{
	font-family: 'BMJUA';
}
</style>
</head>
<body>
<section id="cta" class="cta">
      <div class="container" data-aos="zoom-out">
        <div class="row g-5">
          <div class="col-lg-12 col-md-12 content d-flex flex-column justify-content-center order-last order-md-first">
            <h4 class="title">비밀번호 수정</h4><br>
            <p style="font-size: 15px;">기존 비밀번호는 사용이 불가능하며, 새로운 비밀번호를 등록 후 사용해 주시기 바랍니다.</p>
            <table class="table table-hover">
              <tr>
                    <th colspan="3"></th>
              </tr>
              <tr>
              		<td>현재 비밀번호</td>
              		<td><input type="password" id="befo_pwd"></td>
           			<td><input id="befo_pwdBtn" type="button" class="btn btn-primary" style="background-color: #0ea2bd; border: none;" value="비밀번호 확인"><td>
              </tr>
              <tr>
              		<td>새 비밀번호</td>
              		<td colspan="2"><input type="password" id="aft_pwd"></td>
              </tr>
              <tr>
              		<td>새 비밀번호 확인</td>
              		<td colspan="2"><input type="password" id="pwd"></td>
              </tr>
            </table>
            <div class="join msg" id="pwdMsg" style="font-size: 11pt;"></div>
            <br>
            <div class="col-md-6 form-group">
           		<button id="updateBtn" type="button" class="btn btn-primary" style="background-color: #ffcb5f; border-radius: 30px; border: none;">수정하기</button>
 	 		    <button id="backBtn" type="button" class="btn btn-primary" style="background-color:#dfa9a9; border-radius: 30px; margin-left: 20px;border: none;" onclick="javascript:history.back()">취소</button>
				<input id="id" name="id" hidden="true" value="${id }">
          </div>
        </div>
      </div>
     </div>
    </section><!-- End Call To Action Section -->
</body>
</html>