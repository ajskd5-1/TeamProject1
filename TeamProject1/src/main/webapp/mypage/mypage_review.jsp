<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<main id="main">
    <section id="blog" class="blog" style="margin-top: -60px;">
      
      <div class="container" data-aos="fade-up">
        <div class="row g-5">
          <div class="col-lg-12">
            <article class="blog-details">
			    
              <div class="content">
				<h2 class="title">내 리뷰</h2>
				<h3>캠핑장</h3>
              	<table class="table table-hover">
                  <tr class="text-center table-info">
                    <th width="10%">글번호</th>
                    <th width="70%">내용</th>
                    <th width="20%">별점</th>
                  </tr>
                  <c:forEach var="cvo" items="${c_list }" varStatus="a">
                    <tr style=" cursor: pointer; margin-bottom: 50px;" onclick="location.href='../camp/detail_before.do?no=${cvo.re_tno}'">
                      <td class="text-center" >${cvo.re_no }</td>
                      <td class="text-left">${cvo.re_msg }</td>
                      <td class="text-center" >${cvo.re_score}</td>
                    </tr>
                  </c:forEach>
                </table>
                
                <hr>
                
                <h3>캠핑용품</h3>
              	<table class="table table-hover">
                  <tr class="text-center table-info">
                    <th width="10%">글번호</th>
                    <th width="70%">내용</th>
                    <th width="20%">별점</th>
                  </tr>
                  <c:forEach var="gvo" items="${g_list }" varStatus="a">
                    <tr style=" cursor: pointer; margin-bottom: 50px;" onclick="location.href='../campgoods/campgoods_detail_before.do?g_id=${gvo.re_tno}'">
                      <td class="text-center" >${gvo.re_no }</td>
                      <td class="text-left">${gvo.re_msg }</td>
                      <td class="text-center" >${gvo.re_score}</td>
                    </tr>
                  </c:forEach>
                </table>
                
                <hr>
                
                <h3>레시피</h3>
              	<table class="table table-hover">
                  <tr class="text-center table-info">
                    <th width="10%">글번호</th>
                    <th width="70%">내용</th>
                    <th width="20%">별점</th>
                  </tr>
                  <c:forEach var="rvo" items="${r_list }" varStatus="a">
                    <tr style=" cursor: pointer; margin-bottom: 50px;" onclick="location.href='../recipe/recipe_detail_before.do?cr_no=${rvo.re_tno}'">
                      <td class="text-center" >${rvo.re_no }</td>
                      <td class="text-left">${rvo.re_msg }</td>
                      <td class="text-center" >${rvo.re_score}</td>
                    </tr>
                  </c:forEach>
                </table>

              </div><!-- End post content -->


            </article><!-- End blog post -->
          </div>
        </div>
      </div>
    </section><!-- End Blog Details Section -->

  </main><!-- End #main -->
</body>
</html>