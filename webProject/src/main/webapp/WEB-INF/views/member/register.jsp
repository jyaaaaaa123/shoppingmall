<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Bootstrap core CSS -->
    <link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .container {
        max-width: 500px;
        }
    </style>
    <sec:csrfMetaTags/>
</head>
<body>
    <div class="container">
        <main>
          <div class="py-5 text-center">
            <img class="d-block mx-auto mb-4" src="/resources/image/logo.png" alt="" width="72" height="57">
          </div>
      
          <div class="row">
            
            <div class="col">
              <h4 class="mb-3">회원가입</h4>
              <form action="/member/register" method="post">
                <div class="row">
                	<label for="userId" class="form-label">아이디</label>
				  <div class="col-12 input-group">
                    <input type="text" class="form-control" id="userId" name="userid" placeholder="ID">
                    <div class="input-group-append">
                  		<button id="duplicate" class="btn btn-primary btn" type="button">아이디 중복 확인</button>
                 	</div>
                 	<div id="idCheckAnounce">
                 	</div>
                  </div>
                  
      
                  
                  <div class="col-12">
                    <label for="userPw" class="form-label">비밀번호</label>
                    <input type="password" class="form-control" id="userPw" name="userpw" placeholder="Password">
                  </div>

                  <div class="col-12">
                    <label for="userPwCheck" class="form-label">비밀번호 확인</label>
                    <input type="password" class="form-control" id="userPwCheck" placeholder="PasswordCheck">
                  </div>

                  <div class="col-12">
                    <label for="userName" class="form-label">이름</label>
                    <div class="input-group has-validation">
                      <input type="text" class="form-control" id="userName" name="userName" placeholder="Username">
                    </div>
                  </div>
      
      
                  <div class="col-12">
                    <label for="userPhone" class="form-label">전화번호</label>
                    <input type="text" class="form-control" id="userPhone" name="userphone" placeholder="Phone Number" maxlength="13">
                  </div>
      
                
                  <div class="col-12">
                    <label for="userEmail" class="form-label">이메일</label>
                    <input type="text" class="form-control" id="userEmail" name="useremail" placeholder="email">
                  </div>
                  
                </div>
                <br/>
                
      			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">	
                <hr class="my-4">
                <div class="d-flex justify-content-center">
                	<button id="registSubmit" class="btn btn-primary btn-lg" type="submit">가입하기</button>&nbsp;
                	<button class="btn btn-primary btn-lg" type="reset">취소</button>
                </div>
                
              </form>
            </div>
          </div>
       </main>
       </div>
<script type="text/javascript">
	$(document).ready(function(){
		var idcheckBool = false;
		
		var token = $("meta[name='_csrf']").attr("content");
    	var header = $("meta[name='_csrf_header']").attr("content");
    	$.ajaxPrefilter(function(options, originalOptions, jqXHR) {
    		if (options['type'].toLowerCase() === 'post') {
    			jqXHR.setRequestHeader(header, token)
    		}
    	});
		
		$("#duplicate").on("click", function(e){
			var checkid = $("#userId");
			$.ajax({
				url: '/member/checkid',
				type: 'post',
				data: {
					checkid: checkid.val()
				},
				success: function(result) {
					if(result === '불일치') {
						alert("사용가능한 아이디 입니다");
						idcheckBool = true;
					} else {
						alert("일치하는 아이디가 존재합니다 다시 입력해주세요");
						checkid.val("");
						checkid.focus();
					}
				}
			});
		});
		
		$("#registSubmit").on("submit", function(e){
			e.preventDefault();
			var id = $("#userId");
			if(id.val() === '') {
				alert("아이디를 입력해주세요");
				return;
			}
			
			if(idcheckBool == false) {
				alert("아이디 중복 체크를 해주세요");
				return;
			} else {
				var pw = $("#userPw");
				var pwCheck = $("#userPwCheck");
				var name = $("#userName");
				var phone = $("#userPhone");
				var email = $("#userEmail");
				
				if(pw.val() === '') {
					alert("비밀번호를 입력해주세요");
					pw.focus();
					return;
				}
				if(pwCheck.val() === '') {
					alert("비밀번호 확인을 입력해주세요");
					pwCheck.focus();
					return;
				}
				if(pw.val() !== pwCheck.val()) {
					alert("비밀번호가 같지 않습니다");
					pwCheck.focus();
					return;
				}
				if(name.val() === '') {
					alert("이름을 입력해주세요");
					name.focus();
					return;
				}
				if(phone.val() === '') {
					alert("전화번호를 입력해주세요");
					phone.focus();
					return;
				}
				if(email.val() === '') {
					alert("이메일을 입력해주세요");
					email.focus();
					return;
				}
			}
		});
	});
</script>       
</body>
</html>