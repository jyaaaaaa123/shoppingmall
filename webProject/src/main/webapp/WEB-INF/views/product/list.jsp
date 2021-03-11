<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<%@ include file="../includes/header.jsp"%>
<div class="container-fluid">
	<div class="row">
		<nav id="sidebarMenu"
			class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
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
			<h2>인기상품</h2>
			<div class="row">
				<c:forEach var="best" items="${best}">
				<div class="col-lg-2">
					<svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img"
						aria-label="Placeholder: 140x140"
						preserveAspectRatio="xMidYMid slice" focusable="false">
						<title>Placeholder</title><rect width="100%" height="100%"
							fill="#777" />
						<text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>
					<h2><c:out value="${best.product_name}" /></h2>
					<p><c:out value="${best.product_explain}" /></p>
					<p>
						<a class="btn btn-secondary" href="/product/selectProduct?product_code=${best.product_code}">자세히보기 &raquo;</a>
					</p>
				</div>
				</c:forEach>
			</div>
			<!-- /.row -->
			<div class="row">
				<ul id="sort" class="nav nav-tabs">
					<li class="nav-item">
						<c:choose>
						<c:when test="${pageMaker.cri.type == 'sortRegi'}">
							<a id="sortRegi" class="nav-link active" href="#">등록순</a>
						</c:when>
						<c:otherwise> 
							<a id="sortRegi" class="nav-link" href="#">등록순</a>
						</c:otherwise>
						</c:choose>
					</li>
					<li class="nav-item">
						<c:choose>
						<c:when test="${pageMaker.cri.type == 'sortName'}">
							<a id="sortName" class="nav-link active" href="#">이름순</a>
						</c:when>
						<c:otherwise> 
							<a id="sortName" class="nav-link" href="#">이름순</a>
						</c:otherwise>
						</c:choose>
					</li>
					<li class="nav-item">
						<c:choose>
						<c:when test="${pageMaker.cri.type == 'sortPriceD'}">
							<a id="sortPriceD" class="nav-link active" href="#">낮은 가격순</a>
						</c:when>
						<c:otherwise> 
							<a id="sortPriceD" class="nav-link" href="#">낮은 가격순</a>
						</c:otherwise>
						</c:choose>
					</li>
					<li class="nav-item">
						<c:choose>
						<c:when test="${pageMaker.cri.type == 'sortPriceU'}">
							<a id="sortPriceU" class="nav-link active" href="#">높은 가격순</a>
						</c:when>
						<c:otherwise> 
							<a id="sortPriceU" class="nav-link" href="#">높은 가격순</a>
						</c:otherwise>
						</c:choose>
					</li>
				</ul>
			</div>
			<!-- item -->
			<div class="row mb-2">
				<c:forEach items="${product}" var="product">
				<div class="col-md-10">
					<div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
						<div class="col-auto d-none d-lg-block">
							<img src="<c:out value="${product.imageList[0].uploadPath}"/>/<c:out value="${product.imageList[0].fileName}"/>">
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
	</div>
</div>

<form id="pageForm" action="/product/list" method="get">
	<input type="hidden" name="product_ctgr" value='${pageMaker.nowPage}'>
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
		
		pageForm.find("input[name='product_ctgr']").remove();
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
	
});
</script>

<%@ include file="../includes/footer.jsp"%>