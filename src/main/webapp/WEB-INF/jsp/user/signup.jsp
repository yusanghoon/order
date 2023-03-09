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
			<div class="card zenlogup">
                <div class="card-header">
                    <h3>LOGIN</h3>
                </div>
                <div class="card-body">
                    <div class="input-group form-group">
                        <div class="input-group-prepend" >
                            <span class="input-group-text "><i class="bi bi-person-fill"></i></span>
                        </div>
                        <input id="nameInput" type="text" class="form-control" placeholder="이름">
                    </div>
                    <div class="input-group form-group">
                        <div class="input-group-prepend" >
                            <span class="input-group-text "><i class="bi bi-person-fill"></i></span>
                        </div>
                        <input id="userIdInput" type="text" class="form-control" placeholder="아이디">
                        <input id="isDuplicateBtn" type="submit" value="중복확인" class="btn btn-sm main-color text-white">                
                    </div>
                    
                    <div class="small text-success d-none" id="availableText">사용가능한 아이디 입니다</div>
					<div class="small text-danger d-none" id="duplicateText">중복된 아이디 입니다</div>
                    
                    <div class="input-group form-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="bi bi-key-fill"></i></span>
                        </div>
                        <input id="userPasswordInput" type="password" class="form-control" placeholder="비밀번호">
                    </div>
                    <div class="input-group form-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="bi bi-key-fill"></i></span>
                        </div>
                        <input id="verifyPasswordInput" type="password" class="form-control" placeholder="비밀번호 확인">
                    </div>
					<div class="input-group form-group">
                        <div class="input-group-prepend" >
                            <span class="input-group-text "><i class="bi bi-signpost-fill"></i></span>
                        </div>
                        <input id="emailInput" type="text" class="form-control" placeholder="이메일">
                    </div>           
                    <div class="form-group">
                        <input id="signupBtn" type="submit" value="회원가입" class="btn float-right login_btn mt-2 main-color text-white">
                    </div>
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
		$(document).ready(function(){
			
			var isDuplicateCheck = false;
			var isDuplicateId = true;
			$("#isDuplicateBtn").on("click", function(){
				
				let id = $("#userIdInput").val();
				
				if(id == ""){
					arelt("아이디를 입력하세요");
					return;
				}
				
				$.ajax({
					type : "get"
					, url : "/user/duplicateId"
					, data : {"loginId":id}
					, success : function(data){
						isDuplicateCheck = true;
						
						if(data.duplicate){							
							isDuplicateId = true;
							$("#duplicateText").removeClass("d-none");
							$("#availableText").addCalss("d-none");									
						} else {
							isDuplicateId = false;
							$("#availableText").removeClass("d-none");
							$("#duplicateText").addCalss("d-none");	
						}
					}
					, error:function(){
						arelt("중복확인 에러");
					}
					
				});
				
			});
			
			
			
			$("#signupBtn").on("click", function(){

				let name = $("#nameInput").val();
				let id = $("#userIdInput").val();
				let password = $("#passwordInput").val();
				let verifyPassword =$("#verifyPasswordInput").val();
				let email = $("#emailInput").val();
				
				if(name == ""){
					arelt("이름을 입력하세요");
					return;
				}
				
				if(id == ""){
					alert("아이디를 입력하세요");
					return;
				}
				
				if(!isDuplicateCheck){
					alert("아이디 중복확인을 해주세요");
					return;
				}
				
				if(isDuplicateId){
					alert("중복된 아이디 입니다.");
					return;
				}
				
				if(password = ""){
					alert("비밀번호를 입력해 주세요");
					return;
				}
				
				if(verifyPassword = ""){
					alert("비밀번호확인을 입력해 주세요");
					return;
				}
				
				if(!password == verifyPassword){
					arelt("비밀번호가 일치하지 않습니다")
					return;
				}
				
				if(eamil == ""){
					arelt("이메일을 입력해주세요");
					return;
				}
				
				$.ajax({
					type : "post"
					, url : "/user/signup"
					, data : {"name":name, "loginId":id, "password": password, "email":email}
					, success : function(data){
						
						if(data.result == "success"){
							location.href= "/user/signin/view"
						} else {
							arelt("회원가입 실패");
						}	
					}
					, error : function(){
						arelt("회원가입 에러");
					}
				});
				
				
				
			});
	
		});	
	
	</script>
	
	



</body>
</html>