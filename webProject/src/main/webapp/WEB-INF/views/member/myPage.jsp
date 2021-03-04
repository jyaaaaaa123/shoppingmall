<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%@ include file="../includes/header.jsp" %>
<div class="container-fluid">
	<div class="row">
		<nav id="sidebarMenu"
			class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
			<div class="position-sticky pt-3">
				<ul class="nav flex-column">
					<li class="nav-item"><a class="nav-link" href="/member/myPage"> <span
							></span> 내정보
					</a></li>
					<li class="nav-item"><a class="nav-link" href="/member/myOrder"> <span
							></span> 주문목록
					</a></li>
					<li class="nav-item"><a class="nav-link" href="/member/withdraw"> <span
							></span> 회원탈퇴
					</a></li>
				</ul>
			</div>
		</nav>

		<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
			<h5>내 정보</h5>
			<div class="card card-body">
			<div class="row mb-2">
				<form action="/member/myPageUpdate" method="post">
                  <div class="col-12">
                  
                    <label for="userId" class="form-label">아이디</label>
                    <input type="text" name="userid" class="form-control" id="userId" placeholder="ID" value="<sec:authentication property='principal.username' />" readonly="readonly">
                  </div>
      

                  <div class="col-12">
                    <label for="username" class="form-label">이름</label>
                    <div class="input-group has-validation">
                      <input type="text" name="userName" class="form-control" id="username" placeholder="Username" value="<sec:authentication property='principal.member.userName' />" required>
                    </div>
                  </div>
      
      
                  <div class="col-12">
                    <label for="address2" class="form-label">전화번호</label>
                    <input type="text" name="userphone" class="form-control" id="address2" placeholder="Phone Number"  value="<sec:authentication property='principal.member.userphone' />">
                  </div>
      
                
                  <div class="col-12">
                    <label for="address2" class="form-label">이메일</label>
                    <input type="text" name="useremail" class="form-control" id="address2" placeholder="email"  value="<sec:authentication property='principal.member.useremail' />">
                  </div>
                  
                  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                  <button class="btn btn-primary btn-lg" type="submit">회원정보 수정</button>
                	<button class="btn btn-primary btn-lg" type="reset">취소</button>
                 </form>  
                </div>  
               </div>
		</main>
	</div>
</div>

<%@ include file="../includes/footer.jsp"%>