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
			<h3>주문 정보 확인</h3>
			<div class="row mb-2">
				<c:forEach var="order" items="${orderList}">
        		<li class="list-group-item d-flex justify-content-between lh-sm">
		            <div>
		            	<small class="text-muted">주문 날짜 : <fmt:formatDate value="${order.order_day}"/></small>
		              <h6 class="my-0">주문코드 : <a type="button" href="/admin/adminOrderSelect?order_code=<c:out value='${order.order_code}'/>"><c:out value="${order.order_code}"/></a></h6>
		              <small class="text-muted">주문자 아이디 : <c:out value="${order.userid}"/></small><br>
		              <small class="text-muted">수령인 이름 : <c:out value="${order.order_name}"/></small><br>
		              <small class="text-muted">전화번호 : <c:out value="${order.order_phone}"/></small><br>
		              <small class="text-muted">가격 : <c:out value="${order.order_allprice}"/>원</small><br>
		            <small class="text-muted">주소 : <c:out value="${order.order_address}"/></small>
		            </div>
		            <c:choose>
		            	<c:when test="${!order.order_complete}">
		            		<button id="btnOrderComplete${order.order_code}" type="button" class="btn btn-primary">배송 완료</button>
		            	</c:when>
		            	<c:otherwise>
							<button id="btnOrderComplete${order.order_code}" type="button" class="btn btn-primary" disabled="disabled">배송 완료</button>
		            	</c:otherwise>
		            </c:choose>    
          		</li>
        		</c:forEach>
            </div>  
		</main>
	</div>
</div>
<script type="text/javascript">
$("[id^=btnOrderComplete]").on("click", function() {
	var id = $(this).attr("id");
	var code = id.replace("btnOrderComplete", "");
	
	
	var data = {
			order_code : code
	};
	
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	$.ajaxPrefilter(function(options, originalOptions, jqXHR) {
		if (options['type'].toLowerCase() === 'post') {
			jqXHR.setRequestHeader(header, token)
		}
	});
	
	$.ajax({
			url: '/admin/adminOrderCom',
			type: 'post',
			data: data,
			success: function(){
				alert("성공");
			},
			error: function() {
				alert("실패");
			}
		});
	});
</script>
<%@ include file="../includes/footer.jsp"%>