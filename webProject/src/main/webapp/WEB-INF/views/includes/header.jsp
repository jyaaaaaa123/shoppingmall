<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Shopping</title>
    
    <!-- Google Fonts -->
  	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
    
    <!-- JQUERY -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
     <!-- Bootstrap core CSS -->
    <link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="/resources/bootstrap/js/bootstrap.min.js"></script>

    <sec:csrfMetaTags/>
    
    <style type="text/css">
    	#header #logo {
    		text-decoration: none;
    		font-size: 60px;
    		color: black;
    		font-family: "OpenFantasy", Fantasy;
    	}
    	
    	#header a {
    		text-decoration: none;
    	}
    	
    	#searchText {
    		width: 70%;
    		float: right;
    	}
    	
    	
    	#infoNav ul {
		  margin: 0;
		  padding: 0;
		  display: flex;
		  list-style: none;
		  align-items: right;
		}
    	
    	#infoNav  ul  li  a {
    	 color: black;
    	 font-family: "OpenSans", Chango;
    	 font-size: 19px;
    	}
    	
    	#infoNav  ul  li  button {
    	 	border: 0;
    	 	outline: 0;
    	 	background-color: transparent;
    	 	font-family: "OpenSans", Chango;
    	 	font-size: 19px;
    	}
			
    </style>
</head>
<body>
<div class="container">
    <nav id="header" class="navbar p-3 px-md-4 mb-3 bg-body">
        <p class="h5 my-0 fw-normal"><a id="logo" href="/">COMPUTER</a></p>
          <nav id="infoNav" class="nav">
          	<ul>
          	  <sec:authorize access="hasAnyRole('ROLE_ADMIN')">
	          <li><a class="nav-link" href="/admin/adminProduct">ADMIN PAGE</a></li>
	          </sec:authorize>
	          <sec:authorize access="isAnonymous()">
	          <li><a class="nav-link" href="/member/register">JOIN</a></li>
	          </sec:authorize>
	          <sec:authorize access="isAnonymous()">
	          	<li><a class="nav-link" role="button" id="loginBtn" class="btn btn-outline-primary">LOGIN</a></li>
	          </sec:authorize>
	          <sec:authorize access="isAuthenticated()">
		          <li>
		          <form action="/member/logout" method="post">
		          	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		          	<button class="nav-link" role="button" type="submit" id="logoutBtn" class="btn">LOGOUT</button>
		          </form>
		          </li>
	          </sec:authorize>
	          <li><a class="nav-link" href="/member/myPage">MY PAGE</a></li>
	          <li><a class="nav-link" href="/qna/center">Q&A</a></li>
	          <li><a class="nav-link" href="/cart/cartList">CART</a></li>
           </ul>
          </nav>
	</nav>
	<nav class="navbar p-0 px-md-4 mb-3 bg-body border-bottom shadow-sm">
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
		<!-- 검색  -->
        <form id="searchForm" class="d-flex justify-content-end" style="width: 300px;" action="/product/search" method="get">
            <input id="searchText" type="text" class="form-control" name="product_name">
			<input type="hidden" name="pageNum" value='1'>
			<input type="hidden" name="amount" value='5'>
            <button type="submit" class="btn">
            	<svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
  					<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
				</svg>
			</button>
        </form>
        <!-- .검색  -->
	</nav>
	<script type="text/javascript">
	$(document).ready(
		function() {
			$('#loginBtn').on('click', function() {
				self.location = "/member/login";
			});
			
			$('#logoutBtn').click(function() {
				self.location = "/member/logout";
			});
			
	});
	
</script>