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
				<h3>Q&A 등록</h3>
				<br>
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-body">
							<form role="role" action="/qna/qnaRegister" method="post">
								<div class="form-group">
									<label>제목</label>
									<input type="text" class="form-control" name="qna_title">
								</div>
								<div class="form-group">
									<label>내용</label>
									<textarea class="form-control" rows="3" name="qna_content"></textarea>
								</div>
								<div class="form-group">
									<label>작성자</label>
									<input type="text" class="form-control" name="userid" value="<sec:authentication property='principal.username' />" readonly="readonly">
								</div>
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
								<button class="btn btn-primary btn-sm" type="submit">등록</button>
								<button id="backToListBtn" class="btn btn-primary btn-sm" type="button">취소</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</main>
	</div>
</div>

<script type="text/javascript">
$(document).ready(function(){
	
	
	$("#backToListBtn").on("click", function(){
		
		self.location = "/qna/center";
	});
});
</script>

<%@ include file="../includes/footer.jsp"%>