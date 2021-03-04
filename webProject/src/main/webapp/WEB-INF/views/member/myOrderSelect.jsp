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
			<h5>주문 상세 목록</h5>
			<div class="card card-body">
			<c:forEach var="order" items="${orderSelectList}" varStatus="status">
			<c:if test="${status.first}">
						<h6 class="my-0">주문코드 : <c:out value="${order.order_code}"/></h6>
						<small class="text-muted">가격 : <c:out value="${order.order_allprice}"/>원</small><br>
						<small class="text-muted">주문 날짜 : <fmt:formatDate value="${order.order_day}"/></small>
					</c:if>
			</c:forEach>
					<c:forEach var="order" items="${orderSelectList}">
						<div class="row mb-2">
		        			<li class="list-group-item d-flex justify-content-between lh-sm">
				            <div>
				              <h6 class="my-0">상품명 : <c:out value="${order.product_name}"/></h6>
							<small class="text-muted">수량 : <c:out value="${order.order_product_stock}"/></small>
				            </div>
				            <c:if test="${order.order_complete}">
				            	<c:choose>
				            		<c:when test="${order.order_product_comment}">
				            			<button id="productComment${order.order_product_code}&${order.product_code}" type="button" class="btn btn-primary" disabled="disabled">후기 작성 완료</button>
				            		</c:when>
				            		<c:otherwise>
				            			<button id="productComment${order.order_product_code}&${order.product_code}" type="button" class="btn btn-primary">후기 작성</button>
				            		</c:otherwise>
				            	</c:choose>
		          			</c:if>
		          			</li>
		          		</div>
        			</c:forEach>
        	</div>  
		</main>
	</div>
</div>

<!-- modal -->
<div class="modal fade" id="commentModal" tabindex="-1" role="dialog"
	aria-labelledby="commentModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="commentModalLabel">제품 후기 등록</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="form-group">
        	<label for="comeContent">후기 내용</label>
			<textarea class="form-control" id="commentContent" name="comment_content"></textarea>		
			<label for="star">별점</label>
				<select class="form-control" id="commentStar" name="comment_star">
					<option value="5">5</option>
					<option value="4">4</option>
					<option value="3">3</option>
					<option value="2">2</option>
					<option value="1">1</option>
				</select>
        </div>
      </div>
      <div class="modal-footer">
      	<button id="commentSubmit" type="button" class="btn btn-primary" >등록</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">

	$("[id^=productComment]").on("click", function() {
		var id = $(this).attr("id");
		var code = id.replace("productComment", "").split("&");
		
		
		$(".modal").modal("show");
		
		$("#commentSubmit").on("click", function() {
			var comment_content =  $("#commentContent").val();
			var comment_star = $("#commentStar").val();
				
			var data = {
				order_product_code : code[0],
				product_code : code[1],
				comment_content : comment_content,
				comment_star : comment_star
			};
			
			var token = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");
			$.ajaxPrefilter(function(options, originalOptions, jqXHR) {
				if (options['type'].toLowerCase() === 'post') {
					jqXHR.setRequestHeader(header, token)
				}
			});
			
			$.ajax({
				url: '/member/myOrderComment',
				type: 'post',
				data: data,
				success: function() {
					alert("후기를 등록했습니다");
					$(".modal").modal("hide");
				},
				error: function() {
					alert("후기 등록에 실패했습니다");
					$(".modal").modal("hide");
				}
			});
		});
		
	});
	
</script>


<%@ include file="../includes/footer.jsp"%>