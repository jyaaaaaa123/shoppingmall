<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%@ include file="../includes/header.jsp" %>
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
			
			<c:forEach var="order" items="${orderSelectList}" varStatus="status">
			<c:if test="${status.first}">
						<h6 class="my-0">주문코드 : <c:out value="${order.order_code}"/></h6>
						<small class="text-muted">가격 : <c:out value="${order.order_allprice}"/>원</small><br>
						<small class="text-muted">주문 날짜 : <fmt:formatDate value="${order.order_day}"/></small>
					</c:if>
			</c:forEach>
					<c:forEach var="order" items="${orderSelectList}">
						<div class="row mb-2">
		        			<li class="list-group-item d-flex justify-content-between lh-sm">
				            <div>
				              <h6 class="my-0">상품명 : <c:out value="${order.product_name}"/></h6>
							<small class="text-muted">수량 : <c:out value="${order.order_product_stock}"/></small>
				            </div>
		          			</li>
		          		</div>
        			</c:forEach>  
		</main>
	</div>
</div>

<%@ include file="../includes/footer.jsp"%>