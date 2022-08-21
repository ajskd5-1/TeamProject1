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
			url:'../member/join_delete_ok.do',
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

          <div class="col-lg-9 col-md-9 content d-flex flex-column justify-content-center order-last order-md-first">
            <h3 style="font-size:20pt; ">캠핑<sup>+</sup> <span style="font-size: 25pt;"><em> 회원 탈퇴</em></span> 를 원하십니까?</h3>
            <hr>
            <p>회원탈퇴 전, 유의사항을 확인해 주시기 바랍니다.</p>
            <ol>
            	<li>회원탈퇴 시 회원서비스 이용이 불가합니다.</li>
            	<li>거래정보가 있는 경우, 전자상거래 등에서의 소비자 보호에 관한 법률에 따라 계약 또는 청약철회에 관한 기록, 대금결제 및 재화 등의 공급에 관한 기록은 5년동안 보존됩니다.</li>
            	<li>문의 및 후기, 댓글 삭제를 원하시는 경우에는 먼저 해당 게시물을 삭제하신 후 탈퇴를 신청하시기 바랍니다. </li>
            	<li>이미 결제가 완료된 건은 탈퇴로 취소되지 않습니다. </li>
            </ol>
            <hr>
				 <div class="row" style="padding: 5px 0 5px 0; margin: 0px;">
                    <div class="col-md-2 form-group" style="padding: 8px 10px">
                      <label>비밀번호</label>
                    </div>
                    <div class="col-md-4 form-group">
                      <input id="id" name="id" hidden="true" value="${id }">
                      <input id="pwd" name="pwd" type="password" class="form-control" placeholder="비밀번호 입력">
                      <div class="join msg" id="pwdMsg" style="font-size: 11pt;"></div>
                    </div>
                    <div class="col-md-6 form-group">
                       <button id="deleteBtn" type="button" class="btn btn-primary" style="background-color: #ffcb5f; border-radius: 30px; border: none;">탈퇴하기</button>
           	 		   <button id="backBtn" type="button" class="btn btn-primary" style="background-color:#dfa9a9; border-radius: 30px; margin-left: 20px;border: none;" onclick="javascript:history.back()">취소</button>
                    </div>
                  </div>
          </div>
          <div class="col-lg-3 col-md-3" style="text-align: center;">
          	<img alt="" src="../member/image/warning1.png" style="margin: 100px 0 0; height: 120px; width: 120px;">
          </div>
        </div>
      </div>
    </section><!-- End Call To Action Section -->
</body>
</html>