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
				
				<div class="zencreated">
	                <div class="card-header text-center">
	                    <h3>업체등록</h3>
	                </div>
	                <div class="card-body">
	                 
						<select class="form-control" id="companyType">
							<option>업종을 선택하세요</option>
							<option>세무사</option>
							<option>일반기업</option>
						</select>
				

	                    <input id="companyNameInput" type="text" class="form-control mt-3" placeholder="업체명">
	                   	<input id="ceoNameInput" type="text" class="form-control mt-3" placeholder="대표자명">

	                    <div class="input-group form-group mt-3">
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
	                        <input id="addressInput1" type="text" class="form-control" placeholder="우편번호">
	                        <input type="button" onclick="sample3_execDaumPostcode()" value="우편번호 찾기" class="btn btn-sm main-color text-white">
	                        
	                        <div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
							<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
							</div>
	                                     	                                  
	                    </div>
	      				<input id="addressInput2" type="text" class="form-control" placeholder="도로명">      				
	      				<input id="addressInput3" type="text" class="form-control" placeholder="나머지 주소">
	      	
	      	
	                    <input id="phoneNumberInput" type="text" class="form-control mt-3" placeholder="전화번호">	
                      
						<input id="faxNumberInput" type="text" class="form-control mt-3" placeholder="팩스번호">	
	                   
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
		var isDuplicateBusinessNumber = true;
		
		
		
		$("#BusinessNumber1Btn").on("click", function() {
			let BusinessNumber1 = $("#BusinessNumber1").val();
			let BusinessNumber2 = $("#BusinessNumber2").val();
			let BusinessNumber3 = $("#BusinessNumber3").val();
			let BusinessNumber = BusinessNumber1 + BusinessNumber2 + BusinessNumber3 ;
			
			if(BusinessNumber1 == "") {
				alert("사업자번호를 입력하세요");
				return;
			}
			
			if(BusinessNumber2 == "") {
				alert("사업자번호를 입력하세요");
				return;
			}
			
			if(BusinessNumber3 == "") {
				alert("사업자번호를 입력하세요");
				return;
			}
			
			$.ajax({
				type:"get"
				, url:"/post/order/duplicateBusinessNumber"
				, data:{"BusinessNumber":BusinessNumber}
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
			let companyType = $("#companyType").val();
			let companyName = $("#companyNameInput").val();
			let ceoName = $("#ceoNameInput").val();
			let BusinessNumber1 = $("#BusinessNumber1").val();
			let BusinessNumber2 = $("#BusinessNumber2").val();
			let BusinessNumber3 = $("#BusinessNumber3").val();
			let BusinessNumber = BusinessNumber1 + BusinessNumber2 + BusinessNumber3 ;
			let addressInput1 = $("#addressInput1").val();
			let addressInput2 = $("#addressInput2").val();
			let addressInput3 = $("#addressInput3").val();
			let addressInput = addressInput1 + addressInput2 + addressInput3;
			let phoneNumber = $("#phoneNumberInput").val();
			let faxNumber = $("#faxNumberInput").val();
			let business = $("#businessInput").val();
			let typeOfBusiness = $("#typeOfBusinessInput").val();
			let email = $("#emailInput").val();
			
			if(companyType == "업종을 선택하세요") {
				alert("업종을 선택하세요");
				return;
			}
			
			if(companyName == "") {
				alert("업체명을 입력하세요");
				return;
			}
			
			if(ceoName == "") {
				alert("대표자 명을 입력하세요");
				return;
			}
			
			if(BusinessNumber1 == "") {
				alert("사업자 번호를 입력하세요");
				return;
			}
			
			if(BusinessNumber2 == "") {
				alert("사업자 번호를 입력하세요");
				return;
			}
			
			if(BusinessNumber3 == "") {
				alert("사업자 번호를 입력하세요");
				return;
			}
			
			
			// 중복체크 여부 유효성 검사 
			//if(isDuplicateCheck == false) {
			if(!isDuplicateCheck) {
				alert("사업자번호 중복확인을 해주세요");
				return ;
			}
			
			// 아이디 중복여부 유효성 검사 
			// 중복된 상태인 경우 얼럿창 노출
			if(isDuplicateBusinessNumber) {
				alert("중복된 사업자번호 입니다");
				return ;
			}
			
			if(addressInput1 == "") {
				alert("우편번호를 입력하세요");
				retrun;
			}
			
			if(addressInput2 == "") {
				alert("우편번호를 입력하세요");
				retrun;
			}
			
			if(addressInput1 == "") {
				alert("우편번호를 입력하세요");
				retrun;
			}
			
			if(phoneNumber == "") {
				alert("전화번호를 입력하세요");
				return ;
			}
			
			if(faxNumber == "") {
				alert("팩스번호를 입력하세요");
				return ;
			}
			
			if(business == "") {
				alert("업태를 입력하세요");
				return ;
			}
			
			if(typeOfBusiness == "") {
				alert("종목을 입력하세요");
				return ;
			}
			
			if(email == "") {
				alert("이메일을 입력하세요");
				return ;
			}
			
			
			$.ajax({
				type:"post"
				, url:"/user/signup"
				, data:{"companyType":companyType, "companyName":companyName
					,"ceoName":ceoName, "BusinessNumber":BusinessNumber
					,"address":address, "phoneNumber":phoneNumber
					,"faxNumber":faxNumber, "business":business
					,"typeOfBusiness":typeOfBusiness, "email":email}
				, success:function(data) {
					if(data.result == "success") {
						location.href = "/user/signin/view";
					} else {
						alert("업체등록 실패");
					}
				}
				, error:function() {
					alert("업체등록 에러");
				}
			});
			
			
		});
	
		
	});
	
	
	</script>

</body>
</html>