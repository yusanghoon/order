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
<body>
	<div id="wrap" class="container">
		<c:import url="/WEB-INF/jsp/include/loginheader.jsp"/>
		<section class="d-flex">
		<c:import url="/WEB-INF/jsp/include/menu.jsp"/>
			<section class="col-10 pt-5 pl-5">	
				<section class="content bg-white d-flex justify-content-center align-items-center">
				
				
				
				<div class="zencreated">
	                <div class="card-header text-center">
	                    <h3>업체등록</h3>
	                </div>
	                <div class="card-body">
	                 

	                    <input id="companyNameInput" type="text" class="form-control mt-3" placeholder="업체명">
	                   	<input id="passwordInput" type="password" class="form-control mt-3" placeholder="대표자명">

	                    <div class="input-group form-group mt-3">
	                        <input id="BusinessNumber1" type="text" class="form-control" >
	                         <div class="col-1"> </div>
	                         <input id="BusinessNumber2" type="text" class="form-control" > 
	                         <div class="col-1"> </div>
	                          <input id="BusinessNumber3" type="text" class="form-control">
	                        <button id="isDuplicateBtn" type="submit" class="btn btn-sm main-color text-white">중복확인</button>                           
	                    </div>
	                    
	                    <div class="small text-success d-none" id="availableText">중복되지 않은 사업자 입니다.</div>
						<div class="small text-danger d-none" id="duplicateText">중복된 사업자 등록번호 입니다.</div>
	                    
	                  

 
	                   	 <div class="input-group form-group mt-3">
	                        <input id="userIdInput" type="text" class="form-control" placeholder="우편번호">
	                        <button id="isDuplicateBtn" type="submit" class="btn btn-sm main-color text-white">우편번호 검색</button>                           
	                    </div>
	      				<input id="userIdInput" type="text" class="form-control" placeholder="도로명">      				
	      				<input id="userIdInput" type="text" class="form-control" placeholder="나머지 주소">
	      	
	      	
	                    <div class="input-group form-group mt-3">
	                        <input id="BusinessNumber1" type="text" class="form-control" >
	                         <div class="col-1"> </div>
	                         <input id="BusinessNumber2" type="text" class="form-control" > 
	                         <div class="col-1"> </div>
	                          <input id="BusinessNumber3" type="text" class="form-control">                           
	                    </div>
                      
						<div class="input-group form-group mt-3">
	                        <input id="BusinessNumber1" type="text" class="form-control" >
	                         <div class="col-1"> </div>
	                         <input id="BusinessNumber2" type="text" class="form-control" > 
	                         <div class="col-1"> </div>
	                          <input id="BusinessNumber3" type="text" class="form-control">                       
	                    </div>
	                   
	                   	<input id="businessInput" type="text" class="form-control mt-3" placeholder="업태">
	                   
	                   	<input id="typeOfBusinessInput" type="text" class="form-control mt-3" placeholder="종목">
	                   	
	                   	<input id="emailInput" type="text" class="form-control mt-3" placeholder="이메일">
	
	                </div>
	                <div class="card-footer">
	          			<button id="createdBtn" type="submit" class="btn float-right login_btn main-color text-white">업체등록</button>
	                </div>
	            </div>
				
				
				
				
				
				
			
			</section>	
			</section>	
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	<script>
	$(document).ready(function() {
		
		var isDuplicateCheck = false;
		var isDuplicateId = true;
		
		
		
		$("#isDuplicateBtn").on("click", function() {
			let id = $("#loginIdInput").val();
			
			if(id == "") {
				alert("아이디를 입력하세요");
				return;
			}
			
			$.ajax({
				type:"get"
				, url:"/user/duplicate_id"
				, data:{"loginId":id}
				, success:function(data) {
					isDuplicateCheck = true;
					
					if(data.is_duplicate) {  // 중복된 상태
						
						isDuplicateId = true;
						$("#duplicateText").removeClass("d-none");
						$("#availableText").addClass("d-none");
					} else { // 중복 안된 상태
						
						isDuplicateId = false;
						$("#availableText").removeClass("d-none");
						$("#duplicateText").addClass("d-none");
					}
					
				}
				, error:function() {
					alert("중복확인 에러");
				}
			});
			
		});
		
		
		$("#createdBtn").on("click", function() {
			let id = $("#loginIdInput").val();
			let password = $("#passwordInput").val();
			let passwordConfirm = $("#passwordConfirmInput").val();
			let name = $("#nameInput").val();
			let email = $("#emailInput").val();
			
			if(id == "") {
				alert("아이디를 입력하세요");
				return;
			}
			
			// 중복체크 여부 유효성 검사 
			//if(isDuplicateCheck == false) {
			if(!isDuplicateCheck) {
				alert("아이디 중복확인을 해주세요");
				return ;
			}
			
			// 아이디 중복여부 유효성 검사 
			// 중복된 상태인 경우 얼럿창 노출
			if(isDuplicateId) {
				alert("중복된 아이디 입니다");
				return ;
			}
			
			if(password == "") {
				alert("비밀번호를 입력하세요");
				retrun;
			}
			
			if(password != passwordConfirm) {
				alert("비밀번호 일치여부를 확인하세요");
				return ;
			}
			
			if(name == "") {
				alert("이름을 입력하세요");
				return ;
			}
			
			if(email == "") {
				alert("이메일을 입력하세요");
				return ;
			}
			
			
			$.ajax({
				type:"post"
				, url:"/user/signup"
				, data:{"loginId":id, "password":password, "name":name, "email":email}
				, success:function(data) {
					if(data.result == "success") {
						location.href = "/user/signin/view";
					} else {
						alert("회원가입 실패");
					}
				}
				, error:function() {
					alert("회원가입 에러");
				}
			});
			
			
		});
	
		
	});
	
	
	</script>

</body>
</html>