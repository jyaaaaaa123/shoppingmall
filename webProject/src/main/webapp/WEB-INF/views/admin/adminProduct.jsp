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
		
		
		<main class="col-md-9 col-lg-10">

			<div class="row mb-2">
			      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
			        <h1 class="h2">상품관리</h1>
			          <div class="btn-group me-2">
			            <button id="regProduct" type="button" class="btn btn-sm btn-outline-secondary">상품등록</button>
			          </div>
			      </div>
		      	
		      
			      <div class="table-responsive">
			        <table class="table table-striped table-sm">
			          <thead>
			            <tr>
			              <th>상품코드</th>
			              <th>카테고리</th>
			              <th>상품이름</th>
			              <th>가격</th>
			              <th>재고</th>
			              <th>판매량</th>
			            </tr>
			          </thead>
			          <tbody>
			          <c:forEach var="product" items="${list}" varStatus="status">
			          	<tr>
			              <td><c:out value="${product.product_code}"/></td>
			              <td><c:out value="${product.product_ctgr}"/></td>
			              <td><c:out value="${product.product_name}"/></td>
			              <td><c:out value="${product.product_price}"/></td>
			              <td><c:out value="${product.product_stock}"/></td>
			              <td><c:out value="${product.product_sales}"/></td>
			              <td>
			              	<div class="d-grid gap-2">
			              		<button id='modifyProduct${product.product_code}' type="button" class="btn btn-secondary">수정</button>
			              	</div>	
			              </td>
			              <td>
			              	<div class="d-grid gap-2">
			                	<button id='removeProduct${product.product_code}' type="button" class="btn btn-danger">삭제</button>
			                </div>
			                </td>
			            </tr>
			          </c:forEach>
			         </tbody>
			        </table>
			        
			        <!-- modal -->
			        <div id="myModal" class="modal fade" tabindex="-1">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title">상품 등록 완료</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body">
					        <p>처리가 완료되었습니다.</p>
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					        <button type="button" class="btn btn-primary">확인</button>
					      </div>
					    </div>
					  </div>
					</div>
					<!-- /modal -->
					
					<!-- remove modal -->
			        <div id="removeModal" class="modal fade" tabindex="-1">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title">상품 삭제</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body">
					        <p>삭제하시겠습니까?</p>
					      </div>
					      <div class="modal-footer">
					      	<form action="/admin/adminProductRemove" method="post">
					      		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					     		<input type="hidden" id="product_code" name="product_code" value="">
					      		<button type="submit" class="btn btn-primary"  data-oper="remove">삭제</button>
					       		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
					      	</form>
					      </div>
					    </div>
					  </div>
					</div>
					<!-- /modal -->
				</div>
			</div>
		</main>
	</div>
</div>


<script type="text/javascript">
$(document).ready(function() {
	
	var result = '<c:out value="${result}"/>';
	
	checkModal(result);
	
	function checkModal(result) {
		if (result === '') {
			return;
		}
		
		if(parseInt(result) > 0) {
			$(".modal-body").html("상품 코드 " + parseInt(result) + " 번이 등록되었습니다.");
		}
		
		$("#myModal").modal("show");
	};
	

	
	$("[id^=removeProduct]").on("click",function(event){
        var idcode = $(this).attr('id');
        var code = idcode.substr(13);
        $("input#product_code").val(code);
        $("#removeModal").find(".modal-body").text("상품 코드 " + code + " 삭제하시겠습니까?");
		$("#removeModal").modal("show");
    });
	
	$("[id^=modifyProduct]").on("click",function(event){
        var idcode = $(this).attr('id');
        var code = idcode.substr(13);
        
        self.location = "/admin/adminProductUpdate?product_code=" + code;
    });
	
	
	
	$("#regProduct").on("click", function(){
		self.location = "/admin/adminProductRegister";
	});
});
</script>

<%@ include file="../includes/footer.jsp"%>