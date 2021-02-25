<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <!-- Bootstrap core CSS -->
    <link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <style>
        .container {
        max-width: 765px;
        }
    </style>
</head>
<body>
    <div class="container">
        <main>
          <div class="py-5 text-center">
            <img class="d-block mx-auto mb-4" src="/docs/5.0/assets/brand/bootstrap-logo.svg" alt="" width="72" height="57">
          </div>
      
          <div class="row g-3">
            
            <div class="col">
              <h4 class="mb-3">회원가입</h4>
              <form action="/member/register" method="post">
                <div class="row g-3">
                  <div class="col-12">
                    <label for="userId" class="form-label">아이디</label>
                    <input type="text" class="form-control" id="userId" name="userid" placeholder="ID">
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
                    <input type="text" class="form-control" id="userPhone" name="userphone" placeholder="Phone Number">
                  </div>
      
                
                  <div class="col-12">
                    <label for="userEmail" class="form-label">이메일</label>
                    <input type="text" class="form-control" id="userEmail" name="useremail" placeholder="email">
                  </div>
                  
                </div>
                <br/>
                
      			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">	
                <hr class="my-4">
                <button class="btn btn-primary btn-lg" type="submit">가입하기</button>
                <button class="btn btn-primary btn-lg" type="reset">취소</button>
              </form>
            </div>
          </div>
       </main>
       </div>
</body>
</html>