<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/header.jsp"%>
<div class="container-fluid">
    <div class="row">
        <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
          <div class="position-sticky pt-3">
            <ul class="nav flex-column">
              <li class="nav-item">
                <a class="nav-link" href="#">
                  <span data-feather="file"></span>
                  키보드
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">
                  <span data-feather="shopping-cart"></span>
                  마우스
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">
                  <span data-feather="users"></span>
                  모니터
                </a>
              </li>
            </ul>
          </div>
        </nav>
    <main class="col-md-10">
        <div class="row">
        <div class="col-4 center-block">
            <img src="img/imageSample.jpg" class="img-thumbnail " alt="">
        </div>
        <div class="col-4">
            <div class="row ">
                <strong class="d-inline-block mb-2 text-primary"><c:out value="${selectedProduct.product_ctgr}"/></strong>
                    <h3 class="mb-0"><c:out value="${selectedProduct.product_name}"/></h3>
                    <div class="mb-1 text-muted"><c:out value="${selectedProduct.product_price}"/></div>
                    <p class="card-text mb-auto"><c:out value="${selectedProduct.product_explain}"/></p>
            </div>
            <br>
            <div class="row">
                <p>
                    <a class="btn btn-secondary" href="#">장바구니</a>
                    <a class="btn btn-secondary" href="#">구매하기</a>
                    <a class="btn btn-secondary" href="#">찜하기</a>
                </p>
            </div>
        </div>
    </div>
    <div class="row">
    	<h3>상품 후기</h3><br>
        <div class="col-10">
            <div class="table-responsive">
                <table class="table table-striped table-sm">
                  <thead>
                    <tr>
                      <th>글번호</th>
                      <th>제목</th>
                      <th>작성자</th>
                      <th>날짜</th>
                      <th>조회수</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>1,001</td>
                      <td>random</td>
                      <td>data</td>
                      <td>placeholder</td>
                      <td>0</td>
                    </tr>
                  </tbody>
                </table>
        	</div>
	    </div>
	    </div>
    	</main>
	</div>
</div>
<%@ include file="../includes/footer.jsp"%>