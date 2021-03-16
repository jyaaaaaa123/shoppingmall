<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
     <!-- Bootstrap core CSS -->
    <link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="/resources/bootstrap/js/bootstrap.min.js"></script>
    <sec:csrfMetaTags/>
    
    <style type="text/css">
    	#searchText {
    		width: 70%;
    	}
    </style>
</head>
<body>
<div class="container">
    <nav class="navbar d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-body">
        <p class="h5 my-0 fw-normal"><a style="color: black; text-decoration:none; " href="/"><img class="mb-2" src="/resources/image/logo.png" alt="" width="72" height="57">너굴컴</a></p>
        <form id="searchForm" class="d-flex mx-auto" style="width: 25%;" action="/product/search" method="get">
            <input id="searchText" type="text" class="form-control" name="product_name">
			<input type="hidden" name="pageNum" value='1'>
			<input type="hidden" name="amount" value='5'>
            <button type="submit" class="btn-sm btn-outline-success">검색</button>
        </form>
           <nav class="my-2">
           	<sec:authorize access="isAnonymous()">
            	<a class="p-2 text-dark" href="/member/register">회원가입</a>
            </sec:authorize>
            <sec:authorize access="hasAnyRole('ROLE_ADMIN')">
            	<a class="p-2 text-dark" href="/admin/adminProduct" >관리자페이지</a>
            </sec:authorize>
            	<a class="p-2 text-dark" href="/member/myPage" >마이페이지</a>
            	<a class="p-2 text-dark" href="/cart/cartList" >장바구니</a>
           	<sec:authorize access="isAuthenticated()">
            	<a class="p-2 text-dark" href="/qna/center">고객센터</a>
            </sec:authorize>
          </nav>
          <sec:authorize access="isAnonymous()">
          	<button id="loginBtn" class="btn btn-outline-primary">로그인</button>
          </sec:authorize>
          <sec:authorize access="isAuthenticated()">
          <form action="/member/logout" method="post">
          	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
          	<button type="submit" id="logoutBtn" class="btn btn-outline-primary">로그아웃</button>
          </form>
          </sec:authorize>
	</nav>
	<nav class="navbar d-flex flex-column flex-sm-row align-items-start p-0 px-md-4 mb-3 bg-body border-bottom shadow-sm">
		<div class="dropdown">
			<button type="button" class="btn btn-default dropdown-toggle" aria-label="Left Align" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
			 <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-justify" viewBox="0 0 16 16">
			  <path fill-rule="evenodd" d="M2 12.5a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5zm0-3a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5zm0-3a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5zm0-3a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5z"/>
			</svg>
			</button>
		  <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
		    <li class="dropdown-item"><a class="nav-link" href="/product/list?product_ctgr=키보드"> <span
							data-feather="file"></span> 키보드
					</a></li>
					<li class="dropdown-item"><a class="nav-link" href="/product/list?product_ctgr=마우스"> <span
							data-feather="shopping-cart"></span> 마우스
					</a></li>
					<li class="dropdown-item"><a class="nav-link" href="/product/list?product_ctgr=모니터"> <span
							data-feather="users"></span> 모니터
			</a></li>
		  </ul>
		</div>
	</nav>
	<script type="text/javascript">
	$(document).ready(
		function() {
			$('#loginBtn').on('click', function() {
				self.location = "/member/login";
			});
			
			$('#logoutBtn').on('click', function() {
				self.location = "/member/logout";
			});
	});
	
</script>