<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp"%>
<div class="container">
    <main>
      <div class="py-5 text-center">
        <h2>주문이 정상적으로 완료되었습니다.</h2>
      </div>
      <div class="text-center"> 
        <div class="py-5">
          <a class="btn btn-outline-primary" type="button" href="/member/myPage">마이페이지</a>
          <a class="btn btn-primary" type="button" href="/">쇼핑계속하기</a>
        </div>
      </div> 
      <div class="row justify-content-center align-self-center">
        <div class="col-sm-7 border p-2 mb-3">
          <h5>배송정보</h5>
          <hr>
          <p>이름 : <c:out value="${order.order_name}"/></p>
          <p>주소 : <c:out value="${order.order_address}"/></p>
          <p>연락처 <c:out value="${order.order_phone}"/></p>
        </div>
        <div class="col-sm-7 border p-2">
            <h5>결제정보</h5>
            <hr>
            <p>결제일 : <fmt:formatDate value="${order.order_day}"/></p>
            <p>금액 : <fmt:formatNumber type="number" maxFractionDigits="3" value="${order.order_allprice}" />원</p>
        </div>
      </div>
    </main>
</div>

<%@ include file="../includes/footer.jsp"%>