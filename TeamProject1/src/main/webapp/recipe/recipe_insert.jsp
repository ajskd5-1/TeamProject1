<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../recipe/star/style.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#insertBtn').click(function(){
		$('#recipe_frm').submit();
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
div.review-container{
	margin: 0px;
	height: 50px;
	text-align: right;
}

</style>
</head>
<body>
<main id="main">
 <!-- ======= Breadcrumbs ======= -->
    <div class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <a href="../recipe/recipe_insert.do"><h2 class="title">레시피 작성하기</h2></a>
          <ol>
            <li><a href="index.html">Home</a></li>
            <li>레시피 작성하기</li>
          </ol>
        </div>

      </div>
    </div><!-- End Breadcrumbs -->
    
   <div class="section-header" style="background-image: url('../recipe/image/recipeback2.jpg'); background-size: cover; height: 300px;">
  	<br><br><br>
  	<h3  style="padding-top: 50px; padding-bottom: 30px; color:#8e4646; text-shadow:2px 2px 2px #fff; "><span class="title" style="background-color: #f0efeac7">나만의 레시피를 자유롭게 작성해주세요</span></h3>
  	<h4 class="title" style="color:#8bb5a6;text-shadow:2px 2px 2px #fff;"></h4>
  	<br><br>
  </div>
  <section id="blog" class="blog" style="margin-top:0px;">
      <div class="container" data-aos="fade-up">
        <div class="row g-5">
          <div class="col-md-8 offset-md-2 col-lg-8 offset-lg-2">
            <!-- ======= About Section ======= -->
             <form method="post" action="../recipe/recipe_insert_ok.do" id="recipe_frm" name="recipe_frm">
              <div class="content">
				<h2 class="title">intro</h2>
				<br><br>
                <div class="col form-group">
              	<table class="table table-hover">
                  <tr>
                    <th width=15%>제목</th>
                    <td width=35%>
                    <input type="text" id="cr_title" name="cr_title" style="width: 100%" placeholder="제목을 작성해주세요.">
                    </td>
                    <th width=15% class="text-center">부제목</th>
                    <td width=35%>
                    <input type="text" id="cr_subtitle" name="cr_subtitle" style="width: 100%" placeholder="부제목을 작성해주세요.">
                    </td>
                  </tr>
                  <tr>
                    <th width=15% >소개</th>
                    <td width=75% colspan="3">
                    <input type="text" id="cr_subject" name="cr_subject" style="width: 100%" placeholder="레시피를 소개해주세요.">
                    </td>
                  </tr>
                  <tr>
                    <th width=15% >포스터</th>
                    <td width=75% colspan="3">
                    <input type="text" id="cr_poster" name="cr_poster" style="width: 100%" placeholder="대표사진을 첨부해주세요.">
                    </td>
                  </tr>
                  <tr>
                    <th width=15% >인원</th>
                    <td width=75% colspan="3">
                    <input type="text" id="cr_people" name="cr_people" style="width: 100%" placeholder="해당 레시피가 몇인분을 기준으로 하는지 작성해주세요.">
                    </td>
                  </tr>
                  <tr>
                    <th width=15% >필수 재료</th>
                    <td width=75% colspan="3">
                    <input type="text" id="cr_Eing" name="cr_Eing" style="width: 100%" placeholder="요리에 꼭 필요한 재료를 작성해주세요.">
                    </td>
                  </tr>
                  <tr>
                    <th width=15% >선택 재료</th>
                    <td width=75% colspan="3">
                    <input type="text" id="cr_Sing" name="cr_Sing" style="width: 100%" placeholder="요리에 선택적으로 필요한 재료를 작성해주세요.">
                    </td>
                  </tr>
                </table>
                <br>
                <br>
                <h2 class="title">recipe</h2>
                <br>
                <table class="table table-hover">
				  <tr>
                    <th width=15%>레시피 사진</th>
                    <td width=75% colspan="3">
                    <input type="text" id="cr_img" name="cr_img" style="width: 100%" placeholder="요리 과정 소개에 도움이 될 사진을 첨부해주세요.">
                    </td>
                  </tr>
				  <tr>
                    <th width=15% >레시피 설명</th>
                    <td width=75% colspan="3">
                    <textarea id="cr_des" name="cr_des" style="width: 100%; height: 200px;" placeholder="요리 과정을 상세히 설명해주세요."></textarea>
                    </td>
                  </tr>
                </table>
                <br><br>
                <!-- <button id="insertBtn" type="button" class="btn btn-primary" style="color: black;background-color: #f1f0eb; border-radius: 30px; border: none;">레시피 작성</button>  -->
               </div><!-- End post content -->
              </div><!-- End post content -->
             </form>
          </div>
        </div>
      </div>
    </section><!-- End Blog Details Section -->
  </main><!-- End #main -->
</body>
</html>