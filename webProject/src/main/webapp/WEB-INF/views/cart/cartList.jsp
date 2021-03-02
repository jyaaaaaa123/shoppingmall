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
	            <div class="row">
	                <h3>장바구니</h3>
		        </div>
		            <br>
		        <div class="row">
		        <c:if test="${empty cartList}">
		        	<h5>상품이 없습니다</h5>
				</c:if>	
		           <c:forEach var="cart" items="${cartList}">
		           		<div class="col-12">
		           			<p>상품명 <c:out value="${cart.product_name}"/></p>
		           			<p>가격 <c:out value="${cart.product_price}"/></p>
		           			<p>수량 <c:out value="${cart.cart_stock}"/></p>
		           			<p>총 가격 <c:out value="${cart.cart_stock * cart.product_price}"/></p>
		           			<button type="button" class="btn btn-primary" id="deleteCart">삭제</button>
		           			
		           			<script type="text/javascript">
                   
		                    $("#deleteCart").click(function () {
		                    		var cart_code = ${cart.cart_code};
		                    		
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
		                    			data: data,
		                    			success : function () {
		                    				alert("장바구니 삭제 완료");
		                    				location.href = "/cart/cartList";
		                    			},
		                    			error : function() {
		                    				alert("장바구니 삭제 실패");
		                    			}
		                    			
		                    		});
		                    	});
		                   </script>
		           		</div>
		           		<br>
		           </c:forEach>
		           <button type="button" class="btn btn-primary" id="order">결제하기</button>
	        	</div>
	    	</div>
        </div>
    	</main>
	</div>
</div>

<script>
	$("#order").on("click", function(){
		var cartList = [];

		<c:forEach items="${cartList}" var="cart">
		cartList.push("${cart}");
		</c:forEach>
		
		if (cartList.length === 0) {
			alert("장바구니에 상품이 없습니다.");
		} else {
			location.href="/order/orderCheck";
		}
	});
</script>
<%@ include file="../includes/footer.jsp"%>