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
				<h2 class="title">내 문의사항</h2>
              	<table class="table table-hover">
                  <tr class="text-center table-info">
                    <th>글번호</th>
                    <th>제목</th>
                    <th>작성일</th>
                    <th>조회수</th>
                    <th>답변상태</th>
                    <!-- <th> </th> -->
                  </tr>
                  <c:forEach var="vo" items="${list }" varStatus="a">
                    <tr class="text-center" style=" cursor: pointer; margin-bottom: 50px;" onclick="location.href='../qnaboard/detail.do?no=${vo.no}'">
                      <td class="text-center">${vo.no }</td>
                      <td>${vo.title }</td>
                      <td>${vo.dbday }</td>
                      <td>${vo.count}</td>
                      <c:if test="${vo.recount > 0 }">
                        <td>답변완료</td>
                      </c:if>
                      <c:if test="${vo.recount == 0 }">
                        <td>미답변</td>
                      </c:if>
                      <%-- <td><input type="text" class="btn btn-sm btn-primary orders" value="상세정보" size="15" data-no=${vo.no }></td> --%>
                    </tr>
                  </c:forEach>
                </table>
				<div id="print">
				
				</div>

              </div><!-- End post content -->


            </article><!-- End blog post -->
          </div>
        </div>
      </div>
    </section><!-- End Blog Details Section -->

  </main><!-- End #main -->
</body>
</html>