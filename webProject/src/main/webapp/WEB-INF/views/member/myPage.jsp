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
					<li class="nav-item"><a class="nav-link" href="#"> <span
							></span> 주문목록
					</a></li>
					<li class="nav-item"><a class="nav-link" href="#"> <span
							></span> 회원탈퇴
					</a></li>
				</ul>
			</div>
		</nav>

		<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
			
			<div class="row mb-2">
				<form action="/member/myPage" method="post">
                  <div class="col-12">
                  
                    <label for="userId" class="form-label">아이디</label>
                    <input type="text" class="form-control" id="userId" placeholder="ID" value="<sec:authentication property='principal.username' />" readonly="readonly">
                  </div>
      
                  
                  <div class="col-12">
                    <label for="email" class="form-label">비밀번호</label>
                    <input type="email" class="form-control" id="email" placeholder="Password">
                  </div>

                  <div class="col-12">
                    <label for="email" class="form-label">비밀번호 확인</label>
                    <input type="email" class="form-control" id="email" placeholder="PasswordCheck">
                  </div>

                  <div class="col-12">
                    <label for="username" class="form-label">이름</label>
                    <div class="input-group has-validation">
                      <input type="text" class="form-control" id="username" placeholder="Username" value="<sec:authentication property='principal.member.userName' />" required>
                    </div>
                  </div>
      
      
                  <div class="col-12">
                    <label for="address2" class="form-label">전화번호</label>
                    <input type="text" class="form-control" id="address2" placeholder="Phone Number"  value="<sec:authentication property='principal.member.userphone' />">
                  </div>
      
                
                  <div class="col-12">
                    <label for="address2" class="form-label">이메일</label>
                    <input type="text" class="form-control" id="address2" placeholder="email"  value="<sec:authentication property='principal.member.useremail' />">
                  </div>
                  <button class="btn btn-primary btn-lg" type="submit">회원정보 수정</button>
                	<button class="btn btn-primary btn-lg" type="reset">취소</button>
                 </form>  
                </div>  
                
				
		</main>
	</div>
</div>

<%@ include file="../includes/footer.jsp"%>