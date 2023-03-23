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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
					<div>
						<div class="zencreated">
			                <div class="card-header text-center">
			                    <h3>뽀로로 업체</h3>
			                </div>
			                <div class="card-body">
			                 
			                 <table>
			                 	<thead>
			                 		<tr>
			                 			<th>업체정보  </th>
			                 			<td>id 넘버값(업체코드)</td>			                 			
			                 		</tr>
			                 	</thead>
			                 	<tboody>
			                 		<tr>
			                 			<th>업종  </th>
			                 			<td>일반업체</td>			                 			
			                 		</tr>
			                 		<tr>
			                 			<th>대표자명  </th>
			                 			<td>뽀로로</td>			                 			
			                 		</tr>
			                 		<tr>
			                 			<th>사업자 번호  </th>
			                 			<td>12312312312</td>			                 			
			                 		</tr>
			                 		<tr>
			                 			<th>우편번호 </th>
			                 			<td>우편우편</td>			                 			
			                 		</tr>
			                 		<tr>
			                 			<th>도로명 주소 </th>
			                 			<td>도로명</td>			                 			
			                 		</tr>
			                 		<tr>
			                 			<th>상세주소 </th>
			                 			<td>상세주소</td>			                 			
			                 		</tr>
			                 		<tr>
			                 			<th>전화번호</th>
			                 			<td>저나저나</td>			                 			
			                 		</tr>
			                 		<tr>
			                 			<th>팩스번호 </th>
			                 			<td>팩스팩스</td>			                 			
			                 		</tr>
			                 		<tr>
			                 			<th>업태</th>
			                 			<td>무슨일?</td>			                 			
			                 		</tr>
			                 		<tr>
			                 			<th>종목</th>
			                 			<td>주종목</td>			                 			
			                 		</tr>
			                 		<tr>
			                 			<th>이메일</th>
			                 			<td>이메일</td>			                 			
			                 		</tr>
			                 		<tr>
			                 			<th>접근권한</th>
			                 			<td>일반 or 대리점</td>			                 			
			                 		</tr>
			                 	</tboody>
			                 
			                 
			                 </table>
			                 
			                 
			                 
			                 
			                 
			                 
			                 
			                 
			                 
			                 
			                 
			                 
			                 
			                 
			                 
								<select class="form-control" id="companyType">
									<option>업종을 선택하세요</option>
									<option>세무사</option>
									<option>일반기업</option>
								</select>
						
		
			                    <input id="companyNameInput" type="text" class="form-control mt-2" placeholder="업체명">
			                   	<input id="ceoNameInput" type="text" class="form-control mt-2" placeholder="대표자명">
		
			                    <div class="input-group form-group mt-2">
			                        <input id="BusinessNumber1" type="text" class="form-control" >
			                         <div class="col-1"> </div>
			                         <input id="BusinessNumber2" type="text" class="form-control" > 
			                         <div class="col-1"> </div>
			                          <input id="BusinessNumber3" type="text" class="form-control">
			                        <button id="BusinessNumber1Btn" type="submit" class="btn btn-sm main-color text-white">중복확인</button>                           
			                    </div>
			                    
			                    <div class="small text-success d-none" id="availableText">중복되지 않은 사업자 입니다.</div>
								<div class="small text-danger d-none" id="duplicateText">중복된 사업자 등록번호 입니다.</div>
			                    
			                  
		
		 
			                   	 <div class="d-flex">                   	                    
			                    	<input type="text" id="postcode" placeholder="우편번호" class="form-control">
									<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기" class="btn btn-sm main-color text-white">	                    
			                    </div>		
			      					<input type="text" id="address" class="form-control" placeholder="주소">
									<input type="text" id="detailAddress" class="form-control" placeholder="상세주소">
		
		      					
		      					
		      					
			                    <input id="phoneNumberInput" type="text" class="form-control mt-2" placeholder="전화번호">	
		                      
								<input id="faxNumberInput" type="text" class="form-control mt-2" placeholder="팩스번호">	
			                   
			                   	<input id="businessInput" type="text" class="form-control mt-2" placeholder="업태">
			                   
			                   	<input id="typeOfBusinessInput" type="text" class="form-control mt-2" placeholder="종목">
			                   	
			                   	<input id="emailInput" type="text" class="form-control mt-2" placeholder="이메일">
			
			                </div>
			                <div class="card-footer input-group form-group">
			                	<select class="form-control text-center" id="accessAuthoritySelect">
									<option>접근권한</option>
									<option>일반업체</option>
									<option>대리점</option>
									<option>본사</option>
								</select>
			          			<button id="createdBtn" type="submit" class="btn float-right login_btn main-color text-white">업체등록</button>
			                </div>
			            </div>
					</div>

					



					<div class="ml-3">
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
						</div>
						
						
						
						
						
						
						<div class="zencreated-userlist">
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
						</div>
						
						
						
						
						
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