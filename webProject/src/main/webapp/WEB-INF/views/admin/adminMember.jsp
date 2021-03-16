<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<%@ include file="../includes/header.jsp"%>
<div class="container-fluid">
	<div class="row">
		<nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
            <div class="position-sticky pt-3">
              <ul class="nav flex-column">
                	<li class="nav-item"><a class="nav-link" href="/admin/adminProduct"> <span
							data-feather="file"></span> 상품관리
					</a></li>
					<li class="nav-item"><a class="nav-link" href="/admin/adminOrder"> <span
							data-feather="shopping-cart"></span> 주문관리
					</a></li>
					<li class="nav-item"><a class="nav-link" href="/admin/adminQna"> <span
							data-feather="users"></span>  QnA관리
					</a></li>
					<li class="nav-item"><a class="nav-link" href="/admin/adminMember"> <span
							data-feather="users"></span>  회원관리
					</a></li>
              </ul>
            </div>
          </nav>
		
		
		<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">

			<div class="row mb-2">
			      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
			        <h1 class="h2">회원관리</h1>
			      </div>
			      <div class="table-responsive">
			        <table class="table table-striped table-sm">
			          <thead>
			            <tr>
			              <th>회원아이디</th>
			              <th>회원이름</th>
			              <th>회원전화번호</th>
			              <th>회원이메일</th>
			              <th>가입날짜</th>
			            </tr>
			          </thead>
			          <tbody>
			          <c:forEach var="member" items="${memberList}" varStatus="status">
			          	<tr>
			              <td><c:out value="${member.userid}"/></td>
			              <td><c:out value="${member.userName}"/></td>
			              <td><c:out value="${member.userphone}"/></td>
			              <td><c:out value="${member.useremail}"/></td>
			              <td><fmt:formatDate value="${member.regDate}"/></td>
			              <td>
			              	<div class="d-grid gap-2">
			                	<button id='drop${member.userid}' type="button" class="btn btn-danger" value="<c:out value='${member.userid}'/>">탈퇴</button>
			                </div>
			                </td>
			            </tr>
			          </c:forEach>
			         </tbody>
			        </table>
				</div>
			</div>
		</main>
	</div>
</div>

<script type="text/javascript">
$(document).ready(function(){
	$("[id^='drop']").on("click", function(e){
		var userid = $(this).val();
		var con = confirm("이 회원을 탈퇴 시키시겠습니까?");
		
		var token = $("meta[name='_csrf']").attr("content");
    	var header = $("meta[name='_csrf_header']").attr("content");
    	$.ajaxPrefilter(function(options, originalOptions, jqXHR) {
    		if (options['type'].toLowerCase() === 'post') {
    			jqXHR.setRequestHeader(header, token)
    		}
    	});
		
		if(con) {
			$.ajax({
				url: '/admin/adminMemberDrop',
				type: 'post',
				data: {
					userid: userid
				},
				success: function(result) {
					alert("탈퇴 성공");
					window.location.reload();
				},
				error: function(error) {
					alert("탈퇴 실패");
				}
			});
		} else {
			return;	
		}
	});
});
</script>
<%@ include file="../includes/footer.jsp"%>