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
								<button id="modifyBtn" class="btn btn-primary btn-sm" type="button">수정</button>
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
<div class="modal fade" id="modifyModal" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="ModalLongTitle">수정하기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="$('#modifyModal').modal('hide');">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
			<div class="form-group">
				<label>제목</label> <input type="text" id="modalTitle" class="form-control"
						name="qna_title" value="<c:out value='${qna.qna_title}'/>">
				</div>
			<div class="form-group">
				<label>내용</label>
				<textarea id="modalContent" class="form-control" rows="3" name="qna_content"><c:out value="${qna.qna_content}" /></textarea>
			</div>
      </div>
      <div class="modal-footer">
      	<button id="modifyBtnModal" type="button" class="btn btn-primary">저장</button>
      </div>
    </div>
  </div>
</div>


<script type="text/javascript">
$(document).ready(function(){
	
	$("#modifyBtn").on("click", function() {
		$("#modifyModal").modal("show");
	});
	
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	$.ajaxPrefilter(function(options, originalOptions, jqXHR) {
		if (options['type'].toLowerCase() === 'post') {
			jqXHR.setRequestHeader(header, token)
		}
	});
	
	$("#modifyBtnModal").on("click", function() {
		var title = $("#modalTitle").val();
		var content = $("#modalContent").val();
		var qna_code = <c:out value="${qna.qna_code}"/>;
		
		var data = {
			qna_code : qna_code,
			qna_title : title,
			qna_content: content
		};
		
		$.ajax({
			url: '/qna/qnaModify',
			type: 'POST',
			data: data,
			success: function(result) {
				alert("수정 완료");
				$("#modifyModal").modal("hide");
				window.location.reload();
			},
			error: function(result) {
				alert("ERROR");
			}
		});
	});
	
	$("#removeBtn").on("click", function(){
		
		var removeCheck = confirm("이 질문을 삭제하시겠습니까?");
		
		if(!removeCheck) {
			return;
		}
		
		var qna_code = <c:out value="${qna.qna_code}"/>;
		
		$.ajax({
			url: '/qna/qnaRemove',
			type: 'POST',
			data: {
				qna_code : qna_code
			},
			success: function(result) {
				alert("삭제 완료");
				location.href = "/qna/center";
			},
			error: function(result) {
				alert("ERROR");
			}
		});
	})
	
	$("#backToListBtn").on("click", function(){
		
		self.location = "/qna/center";
	});
	
	
	
	
});
</script>

<%@ include file="../includes/footer.jsp"%>