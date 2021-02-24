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
						<a class="btn btn-secondary" href="#">View details &raquo;</a>
					</p>
				</div>
				</c:forEach>
			</div>
			<!-- /.row -->
			<div class="row">
				<ul class="nav nav-tabs">
					<li class="nav-item">
						<a class="nav-link active" aria-current="page" href="#">이름순</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#" role="button" aria-expanded="false">등록순</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#">낮은 가격순</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#" tabindex="-1" aria-disabled="true">높은 가격순</a>
					</li>
				</ul>
			</div>
			<!-- item -->
			<div class="row mb-2">
				<c:forEach items="${product}" var="product">
				<div class="col-md-10">
					<div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
						<div class="col-auto d-none d-lg-block">
							<svg class="bd-placeholder-img" width="200" height="250"
								xmlns="http://www.w3.org/2000/svg" role="img"
								aria-label="Placeholder: Thumbnail"
								preserveAspectRatio="xMidYMid slice" focusable="false">
								<title>Placeholder</title><rect width="100%" height="100%"
									fill="#55595c" />
								<text x="50%" y="50%" fill="#eceeef" dy=".3em">이미지</text></svg>
						</div>
						<div class="col-md-auto p-3 d-flex flex-fill flex-column position-static">
							<strong class="d-inline-block mb-2 text-primary"><c:out value="${product.product_ctgr}" /></strong>
							<h3 class="mb-0"><c:out value="${product.product_name}" /></h3>
							<div class="mb-1 text-muted"><c:out value="${product.product_price}" /></div>
							<p class="card-text mb-auto"><c:out value="${product.product_explain}" /></p>
							<a href="/product/selectProduct?product_code=${product.product_code}" class="stretched-link">상세정보 확인</a>
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
			</div>
		</main>
	</div>
</div>

<%@ include file="../includes/footer.jsp"%>