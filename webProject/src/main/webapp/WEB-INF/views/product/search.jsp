<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<%@ include file="../includes/header.jsp"%>
	<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
		<div class="row mb-2">
				<c:forEach items="${product}" var="product">
				<div class="col-md-12">
					<div class="row g-0 border rounded overflow-hidden flex-md-row">
						<div class="col-2">
							<img class="img-thumbnail" alt="..." width="300" height="200" src="<c:out value="${product.imageList[0].uploadPath}"/>/<c:out value="${product.imageList[0].fileName}"/>">
						</div> 
						<div class="col-7 my-2 px-1 position-relative">
							<c:set var="nowCtgr" value="${product.product_ctgr}"/>
							<h5 class="mb-0"><c:out value="${product.product_name}" /></h5>
							<p class="card-text my-3"><c:out value="${product.product_explain}" /></p>
							<a id="moveSelect${product.product_code}" href="<c:out value='${product.product_code}'/>" class="stretched-link">상세정보 확인</a>
						</div>
						<div class="col-3">
							<div class="h3 font-weight-bold my-3"><fmt:formatNumber type="number" maxFractionDigits="3" value="${product.product_price}" />원</div>
							<div class="my-5">
								<a id="cart${product.product_code}" class="btn btn-outline-warning my-3">장바구니</a>
								<a id="order${product.product_code}" class="btn btn-outline-dark">구매하기</a>
							</div>
							<input type="hidden" value="${product.product_stock}"/>
						</div>
					</div>
				</div>
				</c:forEach>
				<!-- pagination -->
				<nav>
				  <ul class="pagination">
				  	<c:if test="${pageMaker.prev}">
				    <li class="paginate_button previous">
				      <a class="page-link" href="<c:out value='${pageMaker.startPage - 1}'/>">Prev</a>
				    </li>
				    </c:if>
				    <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
						<li class="page-item <c:out value="${pageMaker.cri.pageNum == num ? 'active':'' }"/>"><a class="page-link" href="<c:out value='${num}'/>"><c:out value="${num}"/></a></li>				    
				    </c:forEach>
				    <c:if test="${pageMaker.next}">
				    <li class="paginate_button next">
				      <a class="page-link" href="<c:out value='${pageMaker.endPage + 1}'/>">Next</a>
				    </li>
				    </c:if>
				  </ul>
				</nav>
				<!-- end pagenation -->
			</div>
		</main>
		
		
<form id="pageForm" action="/product/search" method="get">
	<input type="hidden" name="product_name" value='${pageMaker.nowPage}'>
	<input type="hidden" name="pageNum" value='${pageMaker.cri.pageNum}'>
	<input type="hidden" name="amount" value='${pageMaker.cri.amount}'>
</form>

<script>
$(document).ready(function(){
	
	var pageForm = $("#pageForm");
	
	$(".page-item a").on("click", function(e){
		e.preventDefault();
		
		pageForm.find("input[name='pageNum']").val($(this).attr("href"));
		pageForm.submit();
	});
	
	$("[id^='moveSelect']").on("click", function(e){
		e.preventDefault();
		
		pageForm.find("input[name='product_name']").remove();
		pageForm.append("<input type='hidden' name='product_code' value='" + $(this).attr("href") + "'>");
		pageForm.attr("action", "/product/selectProduct");
		pageForm.submit();0
	});
	
	$("#sort li a").on("click", function(e){
		var nowPage = getParameterByName("product_ctgr"); 
		var sortType = $(this).attr("id");
		var parameter = "?product_ctgr=" + nowPage + "&type=" + sortType;
		$(this).attr("href", "/product/list" + parameter); 
	});
	
	function getParameterByName(name) {
        name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
        var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
                results = regex.exec(location.search);
        return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
    }
	
	$("[id^='cart']").on("click", function(e){
		var product_code = $(this).attr("id").substring(4);
		var user = '<sec:authentication property="principal" />';
		
		
		if(user === 'anonymousUser') {
			alert("로그인이 필요합니다");
			return;
		} else {
			var con = confirm("장바구니에 넣으시겠습니까?");
			if(con) {
	    		var stock = $(this).closest("div").find('input').val();
	    		
	    		var cart_stock = 1;
	    		
	    		if (cart_stock > stock) {
	    			alert("현재 재고가 부족합니다");
	    			return;
	    		};
	    		
	    		var data = {
	    				product_code : product_code,
	    				cart_stock : cart_stock
	    		};		
	    		
	    		var token = $("meta[name='_csrf']").attr("content");
	        	var header = $("meta[name='_csrf_header']").attr("content");
	        	$.ajaxPrefilter(function(options, originalOptions, jqXHR) {
	        		if (options['type'].toLowerCase() === 'post') {
	        			jqXHR.setRequestHeader(header, token)
	        		}
	        	});
	        		
	    		$.ajax({
	    			url : "/cart/add",
	    			type : "post",
	    			data: data,
	    			success : function () {
	    				alert("카트 담기 완료");
	    			},
	    			error : function() {
	    				alert("카트 담기 실패");
	    			}
	    		});
			}else {
				return;
			}
		}		
	});
	
	
	$("[id^='order']").on("click", function(e){
		var product_code = $(this).attr("id").substring(5);
		alert(product_code);
	});
});
</script>
<%@ include file="../includes/footer.jsp"%>