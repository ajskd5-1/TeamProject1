<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
		$('#reviewBtn').click(function(){
		var id='<%=(String)session.getAttribute("id")%>';
 		let re_msg=$('#re_msg').val();
		if(id!="null")
		{
			if(re_msg.trim()==="")
			{
				$('#re_msg').focus();
				return;
			}
			else
			{
				$('#review_frm').submit();
			}
		}
		else
		{
			alert("로그인 시 작성 가능합니다.");
			return;
		} 
		
	})
	//수정 버튼 클릭 시 
	$('#updateBtn').click(function(){
		$('#update_tr').show("slow");
		let update_msg=$('#update_msg').val();
		if(update_msg==='')
		{
			$('#update_msg').focus();
		}
	})
	//취소 버튼 추가 클릭 시  
	$('#update_no_Btn').click(function(){
		$('#update_tr').hide("slow");
	})
	//추가하기 버튼 클릭 시 
	$('#update_ok_Btn').click(function(){
			$('#update_frm').submit();
	})
	//별점 
	$('#selectStar').change(function(){
		//var s = document.getElementById("selectStar");
		//var selectStar = s.option[s.selectedIndex].value;
		let star = $('#selectStar option:selected').val();
		$('#re_score').val(star);
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
           <a href="../recipe/recipe_list.do"><h2 class="title">캠핑<sup>+</sup> 레시피</h2></a>
          <ol>
            <li><a href="index.html">Home</a></li>
            <li><a href="blog.html">recipe</a></li>
            <li>${vo.cr_title }</li>
          </ol>
        </div>

      </div>
    </div><!-- End Breadcrumbs -->

    <!-- ======= Blog Details Section ======= -->
    <section id="blog" class="blog">
      <div class="container" data-aos="fade-up">

        <div class="row g-5">
		<!-- 레시피 사진 -->
          <div class="col-lg-6">
              <div class="post-img">
                <img src="${vo.cr_poster }" alt="" class="img-fluid">
              </div>
          <article class="blog-details">
              <div class="meta-top">
                <ul>
                  <li class="d-flex align-items-center"><i class="bi bi-person"></i> <a href="blog-details.html">${vo.cr_hit }</a></li>
                  <li class="d-flex align-items-center"><i class="bi bi-clock"></i> <a href="blog-details.html">
                  <fmt:formatDate value="${vo.cr_regdate }" pattern="yyyy-MM-dd"></fmt:formatDate></a></li>
                  <li class="d-flex align-items-center"><i class="bi bi-chat-dots"></i> <a href="blog-details.html">!!!!!!!!수정필!!!!!</a></li>
                </ul>
              </div><!-- End meta top -->
              </article><!-- End blog post -->
          </div><!-- 레시피 사진 -->
          <!-- 레시피 재료 -->
          <div class="col-lg-6">
            <article class="blog-details">
              <h2 class="title">${vo.cr_title }</h2>
              
              <div class="content">
              <blockquote>
                <p style="font-size: 14pt; font-weight: bold;">${vo.cr_subtitle}</p><br>
                <p style="font-size: 12pt">${vo.cr_subject}</p>
               </blockquote>
                <p>${vo.cr_recipe }</p>
              </div><!-- End post content -->
            </article><!-- End blog post -->
          </div><!-- 레시피 사진과 기타 -->
          <hr style="color: gray; margin: 150px 0px 100px;">
          <div class="col-lg-12"><!-- 레시피 설명 -->
            	<div class="recipe_detail" style="text-align: center">
            	${vo.cr_detail }
            	</div>
          </div><!-- 레시피 설명 --><br><br><br><br>

        <!-- 후기 -->
		<div class="col-md-8 offset-md-2 col-lg-8 offset-lg-2">
		<!-- 후기 목록 -->
           <div class="comments">
            <br><br><br><br>
              <div >
             	 <h2 class="title" style="display: inline;">&nbsp;&nbsp;요리 후기</h2><img src="../recipe/image/recipe5.png" style="margin:5px 10px 20px 20px;; height:60px; width: 60px;">
              </div>
              <c:forEach items="${list }" var="rvo">
              <hr>
              <div id="comment-1" class="comment" style="text-align: right; margin: 0px;">
                <c:forEach begin="1" end="${rvo.re_score }"><span style="color:#f1c40f; margin-right: 4px; font-size: 18pt;">★</span></c:forEach></div>
              <div id="comment-2" class="comment" style="margin: 0px;">
                <div class="d-flex" style="margin-bottom: 15px;">
                  <div class="comment-img"><img src="../recipe/image/chef1.png" style="margin:5px 30px 20px 20px; height: 70px; width: 70px; "></div>
                  <div>
                    <h5 style="font-size:15pt; margin-bottom: 5px; font-style: italic; font-weight: bold; color: gray;">${rvo.re_writer}</h5>
                    <h5 style="font-size:13pt; margin-bottom: 8px; color: gray;"> <fmt:formatDate value="${rvo.re_regdate }" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></h5>
                    <p style="font-size:14pt; font-weight: bold;">
                      ${rvo.re_msg}
                    </p>
                    <c:if test="${sessionScope.id==rvo.re_writer }">
                    <div class="button">
                      <input type="button" class="btn btn-primary" style=" border: none;" value="삭제" 
                    	onclick="location.href='../recipe/recipe_review_delete.do?re_no=${rvo.re_no}&cr_no=${vo.cr_no }'">
                      <input id="updateBtn" type="button" class="btn btn-primary" style="background-color: #528e5b; border: none; margin-left: " value="수정"><br>
                    	<div id ="update_tr" class="button" style="margin: 20px 0px; display:none;" >
                    	   <form method="post" id="update_frm" action="../recipe/recipe_review_update.do?re_no=${rvo.re_no}&cr_no=${vo.cr_no }" >
                    		 <input id="update_msg" name="update_msg" type="text" class="form-control" value="${rvo.re_msg}"> 
                    	   </form>
                    	<button type="submit" id="update_ok_Btn" class="btn btn-primary" style="background-color: #e7c04c;margin-top: 10px;border: none">수정하기</button>
                    	<button type="submit" id="update_no_Btn" class="btn btn-primary" style="background-color: #fff;margin-top: 10px; color: black;">취소</button>
                    	</div>
                    </div>	
                    </c:if>
                  </div>
                </div>
              </div><!-- End comment #1 -->
              </c:forEach>
              <br>
              <br>
         <!-- 후기 작성 -->
              <div class="reply-form">
                <h4 class="title">후기 작성</h4><br>
                <div class="star">
					<span style="font-size: 14pt; font-weight: bold;">별점 : </span><select id="selectStar" class="selectStar" name="selectStar" >
						<option value="1"> ★ </option>
						<option value="2"> ★ ★ </option>
						<option value="3"> ★ ★ ★ </option>
						<option value="4"> ★ ★ ★ ★ </option>
						<option value="5"> ★ ★ ★ ★ ★ </option>
					</select> 
				</div>
                <form method="post" action="../recipe/recipe_review_ok.do" name="review_frm" id="review_frm">
                  <div class="row" style="margin-top: 20px;">
                    <div class="col form-group" >
                      <input type="text"  id="re_msg" name="re_msg" class="form-control" placeholder="레시피 후기를 자유롭게 작성해주세요. 별점은 레시피 평가를 위해 사용됩니다.">
                    </div>
                      <input id="re_score" name="re_score" value="1" type="hidden">
                      <input id="re_tno" name="re_tno" value="${vo.cr_no }" type="hidden" >
                      <input id="re_tno" name="re_type" value="1" type="hidden"><!-- type 1은 레시피예요, type 숫자 정해서 value="?" 물음표에 숫자 넣어주시면 됩니다.  -->
                  </div>
               </form>
                  <button type="submit" id="reviewBtn" class="btn btn-primary" style="background-color: #0ea2bd">작성하기</button>
              </div>
          </div>
		</div>
        </div>
      </div>
    </section><!-- End Blog Details Section -->

  </main><!-- End #main -->
</body>
</html>