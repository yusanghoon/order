<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">

<link rel="stylesheet" href="/static/css/style.css" type="text/css">

</head>
<body>
	<div id="wrap" class="container">
		<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		
		<section class="content bg-white d-flex justify-content-center align-items-center">
			<div class="card zenlogin">
                <div class="card-header">
                    <h3>LOGIN</h3>
                </div>
                <div class="card-body">
                    <form id="loginForm">
                    <div class="input-group form-group">
                        <div class="input-group-prepend" >
                            <span class="input-group-text "><i class="bi bi-person-fill"></i></i></span>
                        </div>
                        <input id="loginIdInput" type="text" class="form-control" placeholder="아이디" maxlength="30">
                    </div>
                    <div class="input-group form-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="bi bi-key-fill"></i></span>
                        </div>
                        <input id="PasswordInput" type="password" class="form-control" placeholder="비밀번호" maxlength="30">
                    </div>
                    <div class="row align-items-center remember">
                        <input id="rememberUserId" type="checkbox" class="ml-3"><span class="text-white">아이디저장</span>
                        <input id="useGroupwareMain" type="checkbox" class="ml-3"><span class="text-white">비밀번호</span>
                    </div>
                    	<button id="loginBtn" type="submit" class="btn float-right login_btn mt-2 main-color">로그인</button>
                    </form>
                </div>
                <div class="card-footer">
                    <div class="d-flex justify-content-center links" style="font-size:10px;">
                        <a href="#" style="color: white;">아이디 찾기</a>
                        <a style="width:1px; background-color:white;height:14px;margin-top:3px; margin-left:10px; margin-right:10px;"/>
                       <a href="#" style="color: white;">비밀번호 찾기</a>
                    </div>
                </div>
            </div>
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>

	<script>
		$(document).ready(function() {
			
			$("#loginForm").on("submit", function(e){
				
				e.preventDefault();
				
				let loginId = $("#loginIdInput").val();
				let password = $("#PasswordInput").val();
				
				if(loginId == "") {
					alert("아이디를 입력하세요 ");
					return ;
				}
				
				if(password == "") {
					alert("비밀번호를 입력하세요");
					return ;
				}
				
				$.ajax({
					type : "post"
					, url : "/user/signin"
					, data : {"loginId":loginId, "password":password}
					, success : function(data){
						if(data.result == "success"){
							location.href = "/post/order/list"
						}else{
							alert("아이디 혹은 비밀번호를 확인하세요");
						}
					}
					, error : function(){
						alert("로그인 에러");
					}
					
				});
				
				
			});
			
		});	
	
	
	</script>








</body>
</html>