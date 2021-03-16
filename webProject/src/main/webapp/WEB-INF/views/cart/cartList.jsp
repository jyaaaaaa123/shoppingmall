<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp"%>
<div class="container-fluid">
	<div class="row">
		<main class="col-md-10">
			<div class="row">
				<div class="col-4 center-block">
					<img src="img/imageSample.jpg" class="img-thumbnail " alt="">
				</div>
				<div class="col-4">
					<div class="row">
						<h3>장바구니</h3>
					</div>
					<br>
					<div class="row">
						<c:if test="${empty cartList}">
							<h5>상품이 없습니다</h5>
						</c:if>
						<c:forEach var="cart" items="${cartList}">
							<div class="card card-body">
							<div class="col-12">
								<p>
									상품명
									<c:out value="${cart.product_name}" />
								</p>
								<p>
									가격
									<fmt:formatNumber type="number" maxFractionDigits="3" value="${cart.product_price}" />원
								</p>
								<p>
									수량
									<c:out value="${cart.cart_stock}" />
								</p>
								<p>
									총 가격
									<fmt:formatNumber type="number" maxFractionDigits="3" value="${cart.cart_stock * cart.product_price}" />원
								</p>
								<button type="button" class="btn btn-primary" id="deleteCart${cart.cart_code}">삭제</button>
							</div>
							<br>
							</div>
						</c:forEach>
						<c:if test="${!empty cartList}">
							<button type="button" class="btn btn-primary" id="order">결제하기</button>
						</c:if>
					</div>
				</div>
			</div>
		</main>
	</div>
</div>

<script type="text/javascript">
	$("[id^=deleteCart]").click(function() {
		var id = $(this).attr("id");
		
		var cart_code = id.replace("deleteCart", "");

		var data = {
			cart_code : cart_code
		};

		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		$.ajaxPrefilter(function(options, originalOptions, jqXHR) {
			if (options['type'].toLowerCase() === 'post') {
				jqXHR.setRequestHeader(header, token)
			}
		});

		$.ajax({
			url : "/cart/delete",
			type : "post",
			data : data,
			success : function() {
				alert("장바구니 삭제 완료");
				location.href = "/cart/cartList";
			},
			error : function() {
				alert("장바구니 삭제 실패");
			}

		});
	});
</script>

<script>
	$("#order").on("click", function() {
		var cartList = [];

		<c:forEach items="${cartList}" var="cart">
		cartList.push("${cart}");
		</c:forEach>

		if (cartList.length === 0) {
			alert("장바구니에 상품이 없습니다.");
		} else {
			location.href = "/order/orderCheck";
		}
	});
</script>
<%@ include file="../includes/footer.jsp"%>