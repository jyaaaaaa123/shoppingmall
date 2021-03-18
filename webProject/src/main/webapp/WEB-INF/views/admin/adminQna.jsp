<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<%@ include file="../includes/header.jsp"%>
<style type="text/css">
	#a_title:link { color: black; text-decoration: none;}
 	#a_title:visited { color: black; text-decoration: none;}
 	#a_title:hover { color: black; text-decoration: underline;}
</style>

<div class="container-fluid">
	<div class="row">
		<nav id="sidebarMenu" class="col-md-2 bg-light sidebar">
            <div class="position-sticky pt-3">
              <ul class="nav">
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
			        <h1 class="h2">QnA관리</h1>
			     </div>
				<div class="col-10">
					<div class="table-responsive">
						<table class="table table-striped table-sm">
							<thead>
								<tr>
									<th>글번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>날짜</th>
									<th>답변여부</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="qna" items="${qnaList}">
								<tr>
									<td><c:out value="${qna.qna_code}"/></td>
									<td><a id="a_title" href="/admin/adminQnaGet?qna_code=<c:out value='${qna.qna_code}'/>" style=""><c:out value="${qna.qna_title}"/></a></td>
									<td><c:out value="${qna.userid}"/></td>
									<td><fmt:formatDate value="${qna.qna_date}"/></td>
									<c:choose>
										<c:when test="${qna.qna_reply_ok}">
											<td>YES</td>
										</c:when>
										<c:when test="${!qna.qna_reply_ok}">
											<td>NO</td>
										</c:when>
									</c:choose>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				</div>
			</div>
		</main>
	</div>
</div>

<%@ include file="../includes/footer.jsp"%>