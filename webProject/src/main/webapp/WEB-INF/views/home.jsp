<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<style>
	.h {
		text-align: center;
	}
	
	.inCategori {
		border: 1px solid;
		border-radius: 12px;
		padding: 30px;
	}
	
	.inCategori h4 a {
	 	text-decoration: none;
	 	color: black;
	 	font-style: Fantasy;
	}
	
	.inCategori .icon {
		text-align: center;
	}
	
	.section-title h2 {
		text-align: center;
	}
	
</style>

<%@ include file="includes/header.jsp" %>
         <main class="col-md-12 col-lg-12">
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
            <br/>
			<!-- section -->
		    <section id="categori" class="categori pb-5">
		        <div class="section-title">
		          <h2>카테고리</h2>
		        </div>
				<br>
		        <div class="row d-flex justify-content-center">
		          <div class="col-md-6 col-lg-2 d-flex align-items-stretch mb-5 mb-lg-0">
		            <div class="inCategori">
		              <div class="icon py-1">
		              	<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-keyboard" viewBox="0 0 16 16">
						  <path d="M14 5a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V6a1 1 0 0 1 1-1h12zM2 4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V6a2 2 0 0 0-2-2H2z"/>
						  <path d="M13 10.25a.25.25 0 0 1 .25-.25h.5a.25.25 0 0 1 .25.25v.5a.25.25 0 0 1-.25.25h-.5a.25.25 0 0 1-.25-.25v-.5zm0-2a.25.25 0 0 1 .25-.25h.5a.25.25 0 0 1 .25.25v.5a.25.25 0 0 1-.25.25h-.5a.25.25 0 0 1-.25-.25v-.5zm-5 0A.25.25 0 0 1 8.25 8h.5a.25.25 0 0 1 .25.25v.5a.25.25 0 0 1-.25.25h-.5A.25.25 0 0 1 8 8.75v-.5zm2 0a.25.25 0 0 1 .25-.25h1.5a.25.25 0 0 1 .25.25v.5a.25.25 0 0 1-.25.25h-1.5a.25.25 0 0 1-.25-.25v-.5zm1 2a.25.25 0 0 1 .25-.25h.5a.25.25 0 0 1 .25.25v.5a.25.25 0 0 1-.25.25h-.5a.25.25 0 0 1-.25-.25v-.5zm-5-2A.25.25 0 0 1 6.25 8h.5a.25.25 0 0 1 .25.25v.5a.25.25 0 0 1-.25.25h-.5A.25.25 0 0 1 6 8.75v-.5zm-2 0A.25.25 0 0 1 4.25 8h.5a.25.25 0 0 1 .25.25v.5a.25.25 0 0 1-.25.25h-.5A.25.25 0 0 1 4 8.75v-.5zm-2 0A.25.25 0 0 1 2.25 8h.5a.25.25 0 0 1 .25.25v.5a.25.25 0 0 1-.25.25h-.5A.25.25 0 0 1 2 8.75v-.5zm11-2a.25.25 0 0 1 .25-.25h.5a.25.25 0 0 1 .25.25v.5a.25.25 0 0 1-.25.25h-.5a.25.25 0 0 1-.25-.25v-.5zm-2 0a.25.25 0 0 1 .25-.25h.5a.25.25 0 0 1 .25.25v.5a.25.25 0 0 1-.25.25h-.5a.25.25 0 0 1-.25-.25v-.5zm-2 0A.25.25 0 0 1 9.25 6h.5a.25.25 0 0 1 .25.25v.5a.25.25 0 0 1-.25.25h-.5A.25.25 0 0 1 9 6.75v-.5zm-2 0A.25.25 0 0 1 7.25 6h.5a.25.25 0 0 1 .25.25v.5a.25.25 0 0 1-.25.25h-.5A.25.25 0 0 1 7 6.75v-.5zm-2 0A.25.25 0 0 1 5.25 6h.5a.25.25 0 0 1 .25.25v.5a.25.25 0 0 1-.25.25h-.5A.25.25 0 0 1 5 6.75v-.5zm-3 0A.25.25 0 0 1 2.25 6h1.5a.25.25 0 0 1 .25.25v.5a.25.25 0 0 1-.25.25h-1.5A.25.25 0 0 1 2 6.75v-.5zm0 4a.25.25 0 0 1 .25-.25h.5a.25.25 0 0 1 .25.25v.5a.25.25 0 0 1-.25.25h-.5a.25.25 0 0 1-.25-.25v-.5zm2 0a.25.25 0 0 1 .25-.25h5.5a.25.25 0 0 1 .25.25v.5a.25.25 0 0 1-.25.25h-5.5a.25.25 0 0 1-.25-.25v-.5z"/>
						</svg>
					  </div>
		              <h4 class="title"><a href="/product/list?product_ctgr=키보드">키보드</a></h4>
		           
		            </div>
		          </div>
		
		          <div class="col-md-6 col-lg-2 d-flex align-items-stretch mb-5 mb-lg-0">
		            <div class="inCategori">
		              <div class="icon py-1">
			              <svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-mouse2" viewBox="0 0 16 16">
						  <path d="M3 5.188C3 2.341 5.22 0 8 0s5 2.342 5 5.188v5.625C13 13.658 10.78 16 8 16s-5-2.342-5-5.188V5.189zm4.5-4.155C5.541 1.289 4 3.035 4 5.188V5.5h3.5V1.033zm1 0V5.5H12v-.313c0-2.152-1.541-3.898-3.5-4.154zM12 6.5H4v4.313C4 13.145 5.81 15 8 15s4-1.855 4-4.188V6.5z"/>
						</svg>
					  </div>
		              <h4 class="title"><a href="/product/list?product_ctgr=마우스">마우스</a></h4>
		            </div>
		          </div>
		
		          <div class="col-md-6 col-lg-2 d-flex align-items-stretch mb-5 mb-lg-0">
		            <div class="inCategori">
		              <div class="icon py-1"><svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-display" viewBox="0 0 16 16">
						  <path d="M0 4s0-2 2-2h12s2 0 2 2v6s0 2-2 2h-4c0 .667.083 1.167.25 1.5H11a.5.5 0 0 1 0 1H5a.5.5 0 0 1 0-1h.75c.167-.333.25-.833.25-1.5H2s-2 0-2-2V4zm1.398-.855a.758.758 0 0 0-.254.302A1.46 1.46 0 0 0 1 4.01V10c0 .325.078.502.145.602.07.105.17.188.302.254a1.464 1.464 0 0 0 .538.143L2.01 11H14c.325 0 .502-.078.602-.145a.758.758 0 0 0 .254-.302 1.464 1.464 0 0 0 .143-.538L15 9.99V4c0-.325-.078-.502-.145-.602a.757.757 0 0 0-.302-.254A1.46 1.46 0 0 0 13.99 3H2c-.325 0-.502.078-.602.145z"/>
					  </svg></div>
		              <h4 class="title"><a href="/product/list?product_ctgr=모니터">모니터</a></h4>
		            </div>
		          </div>
		
		      </div>
		    </section>
		    <!-- .section -->
            <!-- best product section -->
            <section id=bestP" class="bestP">
	            <div class="row d-flex justify-content-center">
	            	<div class="section-title">
		          		<h2 class="mb-3">인기상품</h2>
		        	</div>
	            	<c:forEach var="best" items="${allBest}">
	                <div class="col-lg-2 mx-1" style="cursor: pointer;" onclick="location.href='/product/selectProduct?product_code=${best.product_code}'">
	                	<img src="<c:out value="${best.imageList[0].uploadPath}"/>/<c:out value="${best.imageList[0].fileName}"/>" alt="..." class="img-thumbnail">
	                    <h5 class="my-3"><c:out value="${best.product_name}"/></h5>
	                </div><!-- /.col-lg-4 -->
	                </c:forEach>
	            </div><!-- /.row -->
	         </section>
          </main>
      
      
<%@ include file="includes/footer.jsp" %>