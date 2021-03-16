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
			      <form role="form" action="/admin/adminProductRegister" method="post">
			      	<div class="form-group">
			      		<label>상품 카테고리</label>
			      		<select class="form-select" aria-label="상품 카테고리" name="product_ctgr">
						  <option selected>선택해주세요</option>
						  <option value="키보드">키보드</option>
						  <option value="마우스">마우스</option>
						  <option value="모니터">모니터</option>
						</select>
			      	</div>
			      	<div class="form-group">
			      		<label>상품 이름</label>
			      		<input class="form-control" type="text" name="product_name">
			      	</div>
			      	<div class="form-group">
			      		<label>상품 설명</label>
			      		<div class="form-floating">
						  <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea" name="product_explain"></textarea>
					</div>
			      	</div>
			      	<div class="form-group">
			      		<label>상품 가격</label>
			      		<input class="form-control" type="text" name="product_price">
			      	</div>
			      	<div class="form-group">
			      		<label>상품 수량</label>
			      		<input class="form-control" type="text" name="product_stock">
			      	</div>
			      	
			      	<!-- image -->
			      		<div class="panel panel-default">
			      			<div class="panel-heading">
			      				상품 이미지
			      			</div>
			      			<div class="panel-body">
			      				<div class="form-group uploadDiv">
			      					<input type="file" name="uploadFile">
			      				</div>
			      				
			      				<div class="uploadResult">
			      					<ul>
			      					
			      					</ul>
			      				</div>
			      			</div>
						</div>
			      	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			      	<button type="submit" class="btn btn-primary">등록</button>
			      	<button type="reset" class="btn btn-danger">취소</button>
			      </form>
			</div>
		</main>
	</div>
</div>

<script type="text/javascript">

$(document).ready(function(e){
	
	var formObj = $("form[role='form']");
	
	$("button[type='submit']").on("click", function(e){
		
		e.preventDefault();
		
		console.log("submit checked");
		
		var str = "";
		
		$(".uploadResult ul li").each(function(i, obj){
			
			var jobj = $(obj);
			
			str += "<input type='hidden' name='imageList[" + i + "].fileName' value='" + jobj.data("filename")+"'>";
			str += "<input type='hidden' name='imageList[" + i + "].uuid' value='" + jobj.data("uuid")+"'>";
			str += "<input type='hidden' name='imageList[" + i + "].uploadPath' value='" + jobj.data("path")+"'>";
			str += "<input type='hidden' name='imageList[" + i + "].fileType' value='" + jobj.data("type")+"'>";
		});
		
		
		console.log(str);
		formObj.append(str).submit();
	});
	
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	var maxSize = 5242880; //5MB
	
	function checkExtension(fileName, fileSize) {
		if(fileSize > maxSize) {
			alert("파일 사이즈 초과");
			return false;
		}
		
		if(regex.test(fileName)) {
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}
		return true;
	}
	
	function showUploadResult(uploadResultArr) {
		
		if(!uploadResultArr || uploadResultArr.length == 0){
			return;
		}
		
		var uploadUL = $(".uploadResult ul");
		
		var str = "";
		
		$(uploadResultArr).each(function(i, obj) {
			
			var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.fileName);
			
			str += "<li " + "data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName 
				+"' data-type=" + obj.fileType + " >"
				+ obj.fileName + "<span data-file=\'" + fileCallPath + "\' data-type='image'> x </span></li>";
		});
		
		uploadUL.append(str);
		
		
	}
	
	$("input[type='file']").change(function(e) {
		var formData = new FormData();
		
		var inputFile = $("input[name='uploadFile']");
		
		var files = inputFile[0].files;
		
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		$.ajaxPrefilter(function(options, originalOptions, jqXHR) {
			if (options['type'].toLowerCase() === 'post') {
				jqXHR.setRequestHeader(header, token)
			}
		});
		
		for(var i=0; i < files.length; i++) {
			if(!checkExtension(files[i].name, files[i].size)) {
				return false;
			}
			
			formData.append("uploadFile", files[i]);
		}
		
		$.ajax({
			url: '/uploadFormAction',
			processData: false,
			contentType: false,
			data: formData,
			type: 'POST',
			dataType: 'json',
			success: function(result) {
				console.log(result);			
				showUploadResult(result);
			}
		});
	});
	
	var inputFileObj = $("input[type='file']").clone();
	
	$(".uploadResult").on("click", "span", function(e){
		
		var targetFile = $(this).data("file");
		var type = $(this).data("type");
		
		var targetLi = $(this).closest("li");
		
		$.ajax({
			url: '/deleteFile',
			data: {fileName: targetFile, type:type},
			dataType: 'text',
			type: 'POST',
			success: function(result) {
				alert(result);
				targetLi.remove();
				$(inputFileObj).replaceAll("input[type='file']");
			}
		});
	});
});


</script>

<%@ include file="../includes/footer.jsp"%>