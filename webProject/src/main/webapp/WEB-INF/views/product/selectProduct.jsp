<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp"%>
<div class="container-fluid">
    <div class="row">
        <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
          <div class="position-sticky pt-3">
            <ul class="nav flex-column">
					<li class="nav-item"><a class="nav-link" href="/product/list?product_ctgr=키보드"> <span
							data-feather="keyboard">키보드</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="/product/list?product_ctgr=마우스"> <span
							data-feather="mouse">마우스</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="/product/list?product_ctgr=모니터"> <span
							data-feather="moniter">모니터</span> 
					</a></li>
				</ul>
          </div>
        </nav>
    <main class="col-md-10">
        <div class="row">
        <div class="col-4 center-block">
            <img src="img/imageSample.jpg" class="img-thumbnail " alt="">
        </div>
        <div class="col-4">
            <div class="row">
                <strong class="d-inline-block mb-2 text-primary"><c:out value="${selectedProduct.product_ctgr}"/></strong>
                    <h3 class="mb-0"><c:out value="${selectedProduct.product_name}"/></h3>
                    <div class="mb-1 text-muted"><c:out value="${selectedProduct.product_price}"/></div>
                    <p class="card-text mb-auto"><c:out value="${selectedProduct.product_explain}"/></p>
                   	
            </div>
            <br>
            <div class="row">
            	수량 : &nbsp; <input type="text" id="stock" class="input-group mb-3" style="width: 60px;" value="1">
                <p>
                    <button type="button" id="btn_cart" class="btn btn-secondary">장바구니</button>
                    <script type="text/javascript">
                   
                    
                    $("#btn_cart").click(function () {
                    		var product_code = ${selectedProduct.product_code};
                    		var stock = ${selectedProduct.product_stock};
                    		var cart_stock = $("#stock").val();
                    		
                    		if (cart_stock > stock) {
                    			alert("현재 재고가 부족합니다");
                    			return;
                    		};
                    		
                    		var data = {
                    				product_code : product_code,
                    				cart_stock : cart_stock
                    		};		
                    		
                    		var token = $("meta[name='_csrf']").attr("content");
                        	var header = $("meta[name='_csrf_header']").attr("content");
                        	$.ajaxPrefilter(function(options, originalOptions, jqXHR) {
                        		if (options['type'].toLowerCase() === 'post') {
                        			jqXHR.setRequestHeader(header, token)
                        		}
                        	});
                        		
                    		$.ajax({
                    			url : "/cart/add",
                    			type : "post",
                    			data: data,
                    			success : function () {
                    				alert("카트 담기 완료");
                    				$("#stock").val("1");
                    			},
                    			error : function() {
                    				alert("카트 담기 실패");
                    			}
                    			
                    		});
                    	});
                    </script>
                    <a class="btn btn-secondary" href="#">구매하기</a>
                </p>
            </div>
        </div>
    </div>
    <div class="row">
    	<h3>상품 후기</h3><br>
        <div class="col-10">
            <div class="table-responsive">
                <table class="table table-striped table-sm">
                  <thead>
                    <tr>
                 	<th>작성자</th>
                      <th>코멘트</th>  
                      <th>날짜</th>
                      <th>별점</th>
                    </tr>
                  </thead>
                  <c:forEach var="comment" items="${List}">
                  	<tbody>
                    <tr>
                      <td><c:out value="${comment.userid}"/></td>
                      <td><c:out value="${comment.comment_content}"/></td>
                      <td><fmt:formatDate value="${comment.comment_regdate}"/></td>
                      <td><c:out value="${comment.comment_star}"/></td>
                    </tr>
                  </tbody>
                  </c:forEach>
                </table>
        	</div>
	    </div>
	    </div>
    	</main>
	</div>
</div>
<%@ include file="../includes/footer.jsp"%>