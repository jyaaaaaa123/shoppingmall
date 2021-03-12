<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<%@ include file="../includes/header.jsp"%>
<div class="container-fluid">
	<div class="row">

		<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">

			<div class="row mb-2">
				<h3>Q&A</h3>
				<br>
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-body">
								<div class="form-group">
									<label>제목</label>
									<input type="text" class="form-control" name="qna_title" value="<c:out value='${qna.qna_title}'/>" readonly="readonly">
								</div>
								<div class="form-group">
									<label>내용</label>
									<textarea class="form-control" rows="3" name="qna_content"  readonly="readonly"><c:out value="${qna.qna_content}"/></textarea>
								</div>
								<div class="form-group">
									<label>작성자</label>
									<input type="text" class="form-control" name="userid" value="<c:out value='${qna.userid}'/>" readonly="readonly">
								</div>
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
								<c:if test="${!qna.qna_reply_ok}">
									<button id="replyBtn" class="btn btn-primary btn-sm" type="button">답변하기</button>	
								</c:if>
								<button id="removeBtn" class="btn btn-danger btn-sm" type="button">삭제</button>
								<button id="backToListBtn" class="btn btn-primary btn-sm" type="button">뒤로가기</button>
						</div>
					</div>
				</div>
			</div>
		</main>
	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="answerModal" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="ModalLongTitle">답변달기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="$('#answerModal').modal('hide');">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
			<div class="form-group">
				<label>제목</label> <input type="text" id="modalTitle" class="form-control"
						name="qna_reply_title" value="">
				</div>
			<div class="form-group">
				<label>내용</label>
				<textarea id="modalContent" class="form-control" rows="3" name="qna_reply"></textarea>
			</div>
      </div>
      <div class="modal-footer">
      	<button id="answerBtnModal" type="button" class="btn btn-primary">답변 등록</button>
      </div>
    </div>
  </div>
</div>

<script src="/resources/js/reply.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	var qna_code = <c:out value="${qna.qna_code}"/>;
	var answerModal = $("#answerModal");
	
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	$.ajaxPrefilter(function(options, originalOptions, jqXHR) {
		if (options['type'].toLowerCase() === 'post') {
			jqXHR.setRequestHeader(header, token)
		}
	});
	
	$("#backToListBtn").on("click", function(){
		
		self.location = "/admin/adminQna";
	});
	
	$("#replyBtn").on("click", function(e){
		answerModal.modal("show");
	});
	
	$("#answerBtnModal").on("click", function(e){
		var title = answerModal.find("input[name='qna_reply_title']");
		var content = answerModal.find("textarea[name='qna_reply']");
		
		var reply = {
			qna_code: qna_code,
			qna_reply_title: title.val(),
			qna_reply: content.val()
		};
		
		replyService.add(reply, function(result){
			alert("등록 성공");
			answerModal.modal("hide");
		});
	});
});
</script>

<%@ include file="../includes/footer.jsp"%>