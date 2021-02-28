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

			<div class="row mb-2">
			      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
			      
			      
			      </div>
			</div>
		</main>
	</div>
</div>


<%@ include file="../includes/footer.jsp"%>