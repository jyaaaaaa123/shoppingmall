<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
     <!-- Bootstrap core CSS -->
    <link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <header class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-body border-bottom shadow-sm">
        <p class="h5 my-0 fw-normal"><a style="color: black; text-decoration:none; " href="/">Company name</a></p>
        <form class="d-flex mx-auto w-25">
            <input type="search" class="form-control"  placeholder="Search" aria-label="Search">
            <button type="submit" class="btn btn-outline-success col-2 md-auto">검색</button>
        </form>
           <nav class="my-2 my-md-0 me-md-3">
           	<sec:authorize access="isAnonymous()">
            <a class="p-2 text-dark" href="#">회원가입</a>
            </sec:authorize>
            <a class="p-2 text-dark" href="/member/myPage" >마이페이지</a>
           	<sec:authorize access="isAuthenticated()">
            <a class="p-2 text-dark" href="/qna/center?userid=<sec:authentication property="principal.username" />">고객센터</a>
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
      </header>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

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