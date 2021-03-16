<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<%@ include file="includes/header.jsp" %>
         <main class="col-12">
            <!-- banner -->
       		<div class="row">
       			<div id="carouselControls" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                  <div class="carousel-item active">
                    <img src="/resources/image/firstSlide.png" class="d-block w-100" alt="...">
                  </div>
                  <div class="carousel-item">
                  	<img src="/resources/image/secondSlide.png" class="d-block w-100" alt="...">
                  </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselControls"  data-bs-slide="prev">
                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                  <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselControls"  data-bs-slide="next">
                  <span class="visually-hidden">Next</span>
                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
               
                </button>
            </div>
            <!-- /banner end -->
       		
       		</div>
            
            <!-- best product -->
            <div class="d-flex justify-content-center">  
	            <div class="row">
	            	<h2>인기상품</h2>
	            	<c:forEach var="best" items="${allBest}">
	                <div class="col-sm-2">
	                    <img src="<c:out value="${best.imageList[0].uploadPath}"/>/<c:out value="${best.imageList[0].fileName}"/>" alt="..." class="img-thumbnail">
	                    <h2><c:out value="${best.product_name}"/></h2>
	                    <p><a class="btn btn-secondary" href="/product/selectProduct?product_code=${best.product_code}">자세히보기 &raquo;</a></p>
	                </div><!-- /.col-lg-4 -->
	                </c:forEach>
	            </div><!-- /.row -->
            </div>
          </main>
      
      
<%@ include file="includes/footer.jsp" %>