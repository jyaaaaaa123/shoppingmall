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
		
		
		<main class="col-md-9 ms-sm-auto col-lg-9">
			<div class="row mb-2 d-flex">
			      <div class="col-6">
			      
			      <form role="form" action="/admin/adminProductUpdate" method="post">
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
			      		<input class="form-control" type="text" name="product_name" value="<c:out value='${get.product_name}'/>">
			      	</div>
			      	<div class="form-group">
			      		<label>상품 설명</label>
						<textarea class="form-control" id="floatingTextarea" name="product_explain"><c:out value='${get.product_explain}'/></textarea>
					</div>
			      	<div class="form-group">
			      		<label>상품 가격</label>
			      		<input class="form-control" type="text" name="product_price" value="<c:out value='${get.product_price}'/>">
			      	</div>
			      	<div class="form-group">
			      		<label>상품 재고</label>
			      		<input class="form-control" type="text" name="product_stock" value="<c:out value='${get.product_stock}'/>">
			      	</div>
			      	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			      	<input type="hidden" name="product_code" value="${get.product_code}">
			      	<button type="submit" class="btn btn-primary">수정</button>
			      	<button type="reset" class="btn btn-danger">취소</button>
			      	</form>
			      </div>
			</div>
		</main>
	</div>
</div>

<script>

$(document).ready(function(){
  $(".form-select option").each(function(){
    if($(this).val()=="${get.product_ctgr}"){
      $(this).attr("selected","selected");
    }
  });

});

</script>

<%@ include file="../includes/footer.jsp"%>