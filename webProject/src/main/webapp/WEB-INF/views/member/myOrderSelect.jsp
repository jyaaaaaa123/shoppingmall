<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%@ include file="../includes/header.jsp" %>
	<h1>my Page</h1>
<div class="container-fluid">
	<div class="row">
		<nav id="sidebarMenu"
			class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
			<div class="position-sticky pt-3">
				<ul class="nav flex-column">
					<li class="nav-item"><a class="nav-link" href="/member/myPage"> <span
							></span> 내정보
					</a></li>
					<li class="nav-item"><a class="nav-link" href="/member/myOrder"> <span
							></span> 주문목록
					</a></li>
					<li class="nav-item"><a class="nav-link" href="/member/withdraw"> <span
							></span> 회원탈퇴
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
				            <c:if test="${order.order_complete}">
		            		<button id="productPost${order.order_product_code}&${order.product_code}" type="button" class="btn btn-primary">후기 작성</button>
		            		
		          			</c:if>
		          			</li>
		          		</div>
        			</c:forEach>  
		</main>
	</div>
</div>

<script type="text/javascript">

	$("[id^=productPost]").on("click", function() {
		var id = $(this).attr("id");
		var code = id.replace("productPost", "").split("&");
		
		var data = {
			order_product_code : code[0],
			product_code : code[1]
		};
		
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		$.ajaxPrefilter(function(options, originalOptions, jqXHR) {
			if (options['type'].toLowerCase() === 'post') {
				jqXHR.setRequestHeader(header, token)
			}
		});
		
		$.ajax({
			url: '/member/myOrderPost',
			type: 'post',
			data: data,
			success: function() {
				alert("성공");
			},
			error: function() {
				alert("실패");
			}
		});
	});
</script>


<%@ include file="../includes/footer.jsp"%>