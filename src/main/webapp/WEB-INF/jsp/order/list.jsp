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
		<c:import url="/WEB-INF/jsp/include/loginheader.jsp"/>
		<section class="d-flex">
			<nav class="col-2 p-0">
				<div class="mainUser main-color pl-2 pt-3">
					<c:if test="${not empty userId }">				
						<div><b>소속 : ${userId }</b></div>
						<div><b>이름 : ${userName }</b></div>
						<div><b>이메일 : ${userEmail }</b></div>
					</c:if>
				</div>			
                 <ul class="content flex-column main-color justify-items-start mb-0 p-2">
				    <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
				      <!-- 하나의 item입니다. data-parent 설청과 href 설정만 제대로 하면 문제없이 작동합니다. -->
				      <div class="panel panel-default pt-3">
				        <div class="panel-heading" role="tab">
				          <a class="text-white" role="button" data-toggle="collapse" 
				          data-parent="#accordion" href="#collapse1" aria-expanded="false">
				            등록 / 계산서
				          </a>
				        </div>
				        <div id="collapse1" class="panel-collapse collapse mainUser font-weight-bold" role="tabpanel">
				          <div class="panel-body">-등록업체조회</div>
				          <div class="panel-body">-계산서 목록</div>
				          <div class="panel-body">-미발행계산서 목록</div>
				           <div class="panel-body">-신규업체 등록</div>
				        </div>
				      </div>
				      <!-- -->
				      <!-- 하나의 item입니다.  -->
				      <div class="panel panel-default pt-2">
				        <div class="panel-heading" role="tab">
				          <a class="text-white" role="button" data-toggle="collapse" 
				          data-parent="#accordion" href="#collapse2" aria-expanded="false">
				            내역 / 사용자
				          </a>
				        </div>
				        <div id="collapse2" class="panel-collapse collapse mainUser font-weight-bold" role="tabpanel">
				          <div class="panel-body">-발주내역</div>
				          <div class="panel-body">-아이디 검색/실시간 사용</div>
				          <div class="panel-body">-사용종료 연장대산</div>
				        </div>
				      </div>
				       <div class="panel panel-default pt-2">
				        <div class="panel-heading" role="tab">
				          <a class="text-white" role="button" data-toggle="collapse" 
				          data-parent="#accordion" href="#collapse3" aria-expanded="false">
				           	게시판
				          </a>
				        </div>
				        <div id="collapse3" class="panel-collapse collapse mainUser font-weight-bold" role="tabpanel">
				          <div class="panel-body">-작업요청</div>
				          <div class="panel-body">-공지사항</div>
				          <div class="panel-body">-주요 프로모션</div>
				        </div>
				      </div>
				      <div class="panel panel-default pt-2">
				        <div class="panel-heading" role="tab">
				          <a class="text-white" role="button" data-toggle="collapse" 
				          data-parent="#accordion" href="#collapse4" aria-expanded="false">
				            관리자
				          </a>
				        </div>
				        <div id="collapse4" class="panel-collapse collapse mainUser font-weight-bold" role="tabpanel">
				          <div class="panel-body">-대리점 관리</div>
				          <div class="panel-body">-제품단가</div>
				          <div class="panel-body">-프로모션 설정</div>
				        </div>
				      </div> 
				    </div>
                 </ul>         
            </nav>
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
					<div class="input-group form-group">
                        <div class="input-group-prepend" >
                            <span class="input-group-text "><i class="bi bi-signpost-fill"></i></span>
                        </div>
                        <input id="emailInput" type="text" class="form-control" placeholder="이메일">
                    </div>           

                    	<button id="signupBtn" type="submit" class="btn float-right login_btn mt-2 main-color text-white">회원가입</button>

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
			
			
		});	
	
	
	</script>

</body>
</html>