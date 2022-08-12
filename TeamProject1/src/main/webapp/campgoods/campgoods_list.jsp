<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title></title>
<!--   <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="stylesheet" href="./style.css">
</head>
<body>
<main id="main">
   <!-- ======= Blog Section ======= -->
    <div class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
         <h2>캠핑<sup>+</sup> 캠핑용품</h2>
          <ol>
            <li><a href="index.html">Home</a></li>
            <li>Blog</li>
          </ol>
        </div>

      </div>
    </div>  
      
     
		<!-- content here -->
	<div class="content">
		<!-- content here -->
		<div class="product-grid product-grid--flexbox">
			<div class="product-grid__wrapper">
				<!-- Product list start here -->
				<c:forEach var="vo" items="${list }">
				<!-- Single product -->
				<div class="product-grid__product-wrapper">
					<div class="product-grid__product">
						<div class="product-grid__img-wrapper">			
							<img src="${vo.g_image }" alt="Img" class="product-grid__img">
						</div>
						<span class="product-grid__title">${vo.g_name }</span>
						<span class="product-grid__price">${vo.g_price }</span>
						<div class="product-grid__extend-wrapper">
							<div class="product-grid__extend">
								<p class="product-grid__description">${vo.g_brand }</p>
								<span class="product-grid__btn product-grid__add-to-cart"><i class="fa fa-cart-arrow-down"></i> Add to cart</span>				
								<span class="product-grid__btn product-grid__view"><i class="fa fa-eye"></i> View more</span>
							</div>
						</div>
					</div>
				</div>
				</c:forEach>

				
			</div>		
		</div>
	</div>
		<!-- 페이지  중앙?style="justify-content: center"-->
        <div class="row">
          <div class="col-sm-12">
            <nav class="pagination-a">
              <ul class="pagination justify-content-center"><!--start, center, end -->
                <c:if test="${startPage>1 }">
                  <li class="page-item prev">
                    <a class="page-link" href="../campgoods/campgoods_list.do?page=${startPage-1 }" tabindex="-1">
                      <span class="bi bi-chevron-left"></span>
                    </a>
                  </li>
                </c:if>
                <c:forEach var="i" begin="${startPage }" end="${endPage }">
		          <c:if test="${i==curpage }">
		            <li class="page-item active"><a class="page-link" href="../campgoods/campgoods_list.do?page=${i }">${i }</a></li>
		          </c:if>
		          <c:if test="${i!=curpage }">
		            <li class="page-item"><a class="page-link" href="../campgoods/campgoods_list.do?page=${i }">${i }</a></li>
		          </c:if>
		        </c:forEach>
                <c:if test="${endPage<totalpage }">
                  <li class="page-item next">
                    <a class="page-link" href="../campgoods/campgoods_list.do?page=${endPage+1 }">
                      <span class="bi bi-chevron-right"></span>
                    </a>
                  </li>
                </c:if>
              </ul>
            </nav>
          </div>
        </div>
       
				
        

</main>
</body>
