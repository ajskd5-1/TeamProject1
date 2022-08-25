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
	$('#deleteBtn').click(function(){
		let pwd=$('#pwd').val();
		let id=$('#id').val();
		if(pwd.trim()==="")
		{
			$('#pwd').focus();
			return;
		}
		$.ajax({
			type:'post',
			url:'../member/join_update_before_ok.do',
			data:{"pwd":pwd,"id":id},
			success:function(result)
			{
				let res=result.trim();
				if(res==='false')
				{
					$('#pwdMsg').html("<div style='color:red'>'비밀번호가 틀립니다. 다시 입력하세요")
					$('#pwd').val('');
					$('#pwd').focus('');
					return;
				}
				else
				{
					location.href="../member/join_update.do";
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
*,h3{
	font-family: 'NanumSquareRound';
}
.title{
	font-family: 'BMJUA';
}
</style>
</head>
<body>
    <!-- ======= Call To Action Section ======= -->
    <section id="cta" class="cta">
      <div class="container" data-aos="zoom-out">

        <div class="row g-5">

          <div class="col-lg-12 col-md-12 content d-flex flex-column justify-content-center order-last order-md-first">
            <h4 class="title">회원정보 수정 전 비밀번호 확인</h4>
            <hr>
            <p style="font-size:14pt; color: #485664">회원님의 정보를 안전하게 보호하기 위해 비밀번호를 한번 더 확인합니다.</p><br>
           		 <div class="row" style="padding: 5px 0 5px 0; margin: 0px;">
                    <div class="col-md-2 form-group" style="padding: 8px 10px">
                      <label>회원님의 ID</label>
                    </div>
                    <div class="col-md-4 form-group">
                      <input type="text" class="form-control" id="id" name="id" value="${sessionScope.id }" readonly>
                    </div>
                    </div>
				 <div class="row" style="padding: 5px 0 5px 0; margin: 0px;">
                    <div class="col-md-2 form-group" style="padding: 8px 10px">
                      <label>비밀번호</label>
                    </div>
                    <div class="col-md-4 form-group">
                      <input id="pwd" name="pwd" type="password" class="form-control" placeholder="비밀번호 입력">
                      <div class="join msg" id="pwdMsg" style="font-size: 11pt;"></div>
                    </div>
                    <div class="col-md-6 form-group">
                       <button id="deleteBtn" type="button" class="btn btn-primary" style="background-color: #ffcb5f; border-radius: 30px; border: none;">확인</button>
           	 		   <button id="backBtn" type="button" class="btn btn-primary" style="background-color:#dfa9a9; border-radius: 30px; margin-left: 20px;border: none;" onclick="javascript:history.back()">취소</button>
                    </div>
                  </div>
          </div>
        </div>
      </div>
    </section><!-- End Call To Action Section -->
</body>
</html>