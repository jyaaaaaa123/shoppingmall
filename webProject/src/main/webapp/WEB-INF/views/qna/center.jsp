<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<style type="text/css">
 a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: red; text-decoration: underline;}
 
 
</style>

<%@ include file="../includes/header.jsp"%>
<div class="container-fluid">
	<div class="row">

		<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">

			<div class="row mb-2">
				<h3>Q&A</h3>
				<br>
				<div class="col-10">
					<div class="table-responsive">
						<table class="table table-striped table-sm">
							<thead>
								<tr>
									<th>글번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>날짜</th>
									<th>답변 여부</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="qna" items="${qnaList}">
								<tr>
									<td><c:out value="${qna.qna_code}"/></td>
									<td><a href="/qna/qnaGet?qna_code=<c:out value='${qna.qna_code}'/>"><c:out value="${qna.qna_title}"/></a></td>
									<td><c:out value="${qna.userid}"/></td>
									<td>
										<fmt:formatDate value="${qna.qna_date}" type="both"/>
									</td>
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
					<button id="qnaRegisterBtn" class="btn btn-primary btn-sm" type="button">등록</button>
				</div>
			</div>
		</main>
	</div>
</div>

<!-- modal -->
<div class="modal fade" id="qnaModal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">알림</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>처리가 완료되었습니다</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary">확인</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>


<script type="text/javascript">
$(document).ready(function(){
	
	var result = '<c:out value="${result}"/>';
	
	checkModal(result);
	
	function checkModal(result) {
		if(result === '') {
			return;
		}
		
		if(parseInt(result) > 0) {
			$(".modal-body").html("QnA가 등록되었습니다.");
		}
		$("#qnaModal").modal("show");
	}
	
	
	$("#qnaRegisterBtn").on("click", function(){
		
		self.location = "/qna/qnaRegister";
	});
});
</script>



<%@ include file="../includes/footer.jsp"%>