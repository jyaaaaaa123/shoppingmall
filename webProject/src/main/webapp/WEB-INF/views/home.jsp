<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<%@ include file="includes/header.jsp" %>
    <div class="container-fluid">
        <div class="row">
          <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
            <div class="position-sticky pt-3">
              <ul class="nav flex-column">
                <li class="nav-item"><a class="nav-link" href="/product/list?product_ctgr=키보드"> <span
							data-feather="file"></span> 키보드
					</a></li>
					<li class="nav-item"><a class="nav-link" href="/product/list?product_ctgr=마우스"> <span
							data-feather="shopping-cart"></span> 마우스
					</a></li>
					<li class="nav-item"><a class="nav-link" href="/product/list?product_ctgr=모니터"> <span
							data-feather="users"></span> 모니터
					</a></li>
              </ul>
            </div>
          </nav>
      
          <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
            <!-- banner -->
            <div id="carouselExampleControls" class="carousel slide w-75" data-bs-ride="carousel">
                <div class="carousel-inner">
                  <div class="carousel-item active">
                    <img src="/resources/image/firstSlide.png" class="d-block w-100" alt="...">
                  </div>
                  <div class="carousel-item">
                    <img src="/resources/image/secondSlide.png" class="d-block w-100" alt="...">
                  </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls"  data-bs-slide="prev">
                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                  <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls"  data-bs-slide="next">
                  <span class="visually-hidden">Next</span>
                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
               
                </button>
            </div>
            <!-- /banner end -->
            <!-- best product -->
            <h2>인기상품</h2>
            <div class="row">
            	<c:forEach var="best" items="${allBest}">
                <div class="col-lg-2">
                    <svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"/><text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>
                    <h2><c:out value="${best.product_name}"/></h2>
                    <p><c:out value="${best.product_explain}"/></p>
                    <p><a class="btn btn-secondary" href="/product/selectProduct?product_code=${best.product_code}">자세히보기 &raquo;</a></p>
                </div><!-- /.col-lg-4 -->
                </c:forEach>
            </div><!-- /.row -->
          </main>
        </div>
      </div>
      
      
<%@ include file="includes/footer.jsp" %>