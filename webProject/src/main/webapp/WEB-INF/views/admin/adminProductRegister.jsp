<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<%@ include file="../includes/header.jsp"%>
<div class="container-fluid">
	<div class="row">
		<nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
            <div class="position-sticky pt-3">
              <ul class="nav flex-column">
                	<li class="nav-item"><a class="nav-link" href="/admin/adminProduct"> <span
							data-feather="file"></span> 상품관리
					</a></li>
					<li class="nav-item"><a class="nav-link" href="/admin/adminOrder"> <span
							data-feather="shopping-cart"></span> 주문관리
					</a></li>
					<li class="nav-item"><a class="nav-link" href="/admin/adminQna"> <span
							data-feather="users"></span>  QnA관리
					</a></li>
					<li class="nav-item"><a class="nav-link" href="/admin/adminMember"> <span
							data-feather="users"></span>  회원관리
					</a></li>
              </ul>
            </div>
          </nav>
		
		
		<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">

			<div class="row mb-2">
			      <form role="form" action="/admin/adminProductRegister" method="post">
			      	<div class="form-group">
			      		<label>상품 카테고리</label>
			      		<select class="form-select" aria-label="상품 카테고리" name="product_ctgr">
						  <option selected>선택해주세요</option>
						  <option value="키보드">키보드</option>
						  <option value="마우스">마우스</option>
						  <option value="모니터">모니터</option>
						</select>
			      	</div>
			      	<div class="form-group">
			      		<label>상품 이름</label>
			      		<input class="form-control" type="text" name="product_name">
			      	</div>
			      	<div class="form-group">
			      		<label>상품 설명</label>
			      		<div class="form-floating">
						  <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea" name="product_explain"></textarea>
						  <label for="floatingTextarea">상품 설명</label>
					</div>
			      	</div>
			      	<div class="form-group">
			      		<label>상품 가격</label>
			      		<input class="form-control" type="text" name="product_price">
			      	</div>
			      	<div class="form-group">
			      		<label>상품 수량</label>
			      		<input class="form-control" type="text" name="product_stock">
			      	</div>
			      	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			      	<button type="submit" class="btn btn-primary">등록</button>
			      	<button type="reset" class="btn btn-danger">취소</button>
			      </form>
			</div>
		</main>
	</div>
</div>


<%@ include file="../includes/footer.jsp"%>