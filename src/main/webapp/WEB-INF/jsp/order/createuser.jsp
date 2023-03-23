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
				
				<div class="zencreated-user">
	                <div class="card-header text-center">
	                    <h3>아이디 생성</h3>
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
                        <button id="isDuplicateBtn" type="submit" class="btn btn-sm main-color text-white">중복확인</button>                           
                    </div>
                    
                    <div class="small text-success d-none" id="availableText">사용가능한 아이디 입니다</div>
					<div class="small text-danger d-none" id="duplicateText">중복된 아이디 입니다</div>
                    
                    <div class="input-group form-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="bi bi-key-fill"></i></span>
                        </div>
                        <input id="passwordInput" type="password" class="form-control" placeholder="비밀번호">
                    </div>
                    <div class="input-group form-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="bi bi-key-fill"></i></span>
                        </div>
                        <input id="verifyPasswordInput" type="password" class="form-control" placeholder="비밀번호 확인">
                    </div>
					
                    	<button id="signupBtn" type="submit" class="btn float-right login_btn mt-2 main-color text-white">회원가입</button>

                </div>
		
				</section>	
			</section>	
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	<script>
	$(document).ready(function() {

		
	});
	
	
	</script>
	

</body>
</html>