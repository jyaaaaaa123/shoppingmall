<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<%@ include file="../includes/header.jsp"%>
	<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
		<div class="row mb-2">
				<c:forEach items="${product}" var="product">
				<div class="col-md-10">
					<div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
						<div class="col-auto d-none d-lg-block">
							<img src="<c:out value="${product.imageList[0].uploadPath}"/><c:out value="${product.imageList[0].fileName}"/>">
						</div>
						<div class="col-md-auto p-3 d-flex flex-fill flex-column position-static">
							<strong class="d-inline-block mb-2 text-primary"><c:out value="${product.product_ctgr}" /></strong>
							<c:set var="nowCtgr" value="${product.product_ctgr}"/>
							<h3 class="mb-0"><c:out value="${product.product_name}" /></h3>
							<div class="mb-1 text-muted"><c:out value="${product.product_price}" /></div>
							<p class="card-text mb-auto"><c:out value="${product.product_explain}" /></p>
							<a id="moveSelect" href="<c:out value='${product.product_code}'/>" class="stretched-link">상세정보 확인</a>
						</div>
						<div class="col d-flex align-items-end flex-column">
							<p>
								<a class="btn btn-secondary" href="#">장바구니</a>
							</p>
							<p>
								<a class="btn btn-secondary" href="#">구매하기</a>
							</p>
							<p>
								<a class="btn btn-secondary" href="#">찜</a>
							</p>
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
	
	$("#moveSelect").on("click", function(e){
		e.preventDefault();
		
		pageForm.find("input[name='product_name']").remove();
		pageForm.append("<input type='hidden' name='product_code' value='" + $(this).attr("href") + "'>");
		pageForm.attr("action", "/product/selectProduct");
		pageForm.submit();0
	});
	
});
</script>
<%@ include file="../includes/footer.jsp"%>