<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp"%>

    <div class="row justify-content-center">
    <main class="col-md-10">
        <div class="row">
        	<p><a style="color: black; text-decoration:none; " href="/">🏠 </a> > <a style="color: black; text-decoration:none; " href="/product/list?product_ctgr=${selectedProduct.product_ctgr}"><c:out value="${selectedProduct.product_ctgr}"/></a></p>
        <div class="col-6">
            <img class="img-thumbnail" alt="..." src="<c:out value="${selectedProduct.imageList[0].uploadPath}"/>/<c:out value="${selectedProduct.imageList[0].fileName}"/>">
        </div>
        <div class="col-6" >
            <div class="row">
                    <h4 class="mb-3"><c:out value="${selectedProduct.product_name}"/></h4>
                    <br><hr/>
                    <div class="mb-5 text-muted"><fmt:formatNumber type="number" maxFractionDigits="3" value="${selectedProduct.product_price}" />원</div>
            </div>
            <div class="row">
            	<div class="col-sm">
            		수량 : &nbsp; <input type="text" id="stock" class="input-group mb-3" style="width: 60px;" value="1">&nbsp;
            		<p>
                    <button type="button" id="btn_cart" class="btn btn-secondary">장바구니</button>&nbsp;
                    <a type="button" id="btn_order" class="btn btn-outline-dark">구매하기</a>
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
                    				alert("장바구니 담기 완료");
                    				$("#stock").val("1");
                    			},
                    			error : function() {
                    				alert("장바구니 담기 실패");
                    			}
                    			
                    		});
                    	});
                    
                    $("#btn_order").click(function () {
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
                				$("#stock").val("1");
                				location.href = "/order/orderCheck";
                			},
                			error : function() {
                				alert("구매 실패");
                			}
                			
                		});
                	});
                    </script>
                </p>
            	</div>
            </div>
        </div>
    </div>
    <hr/>
    <div class="row">
    	<h5>상세 정보</h5>
    	<p class="card-text mb-auto"><c:out value="${selectedProduct.product_explain}"/></p>
    </div>
    <br/>
    <div class="row">
    	<h5>상품 후기</h5><br>
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
                      <td>
                      	<c:choose>
                      		<c:when test="${comment.comment_star == 5}">
                      			★★★★★
                      		</c:when>
                      		<c:when test="${comment.comment_star == 4}">
                      			★★★★☆
                      		</c:when>
                      		<c:when test="${comment.comment_star == 3}">
                      			★★★☆☆
                      		</c:when>
                      		<c:when test="${comment.comment_star == 2}">
                      			★★☆☆☆
                      		</c:when>
                      		<c:when test="${comment.comment_star == 1}">
                      			★☆☆☆☆
                      		</c:when>
                      	</c:choose>
                    </tr>
                  </tbody>
                  </c:forEach>
                </table>
        	</div>
	    </div>
	    </div>
    	</main>
	</div>
<%@ include file="../includes/footer.jsp"%>