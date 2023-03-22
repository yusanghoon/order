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
				
				
				
				
				
				
			
			</section>	
			</section>	
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	<script>
	$(document).ready(function() {
		
		var isDuplicateCheck = false;
		var isDuplicateBusinessNumber = true;
			
	
		$("#createdBtn").on("click", function() {
			let companyType = $("#companyType").val();
			let companyName = $("#companyNameInput").val();
			let ceoName = $("#ceoNameInput").val();
			let BusinessNumber1 = $("#BusinessNumber1").val();
			let BusinessNumber2 = $("#BusinessNumber2").val();
			let BusinessNumber3 = $("#BusinessNumber3").val();
			let BusinessNumber = BusinessNumber1 + BusinessNumber2 + BusinessNumber3 ;
			let addressInput1 = $("#postcode").val();
			let addressInput2 = $("#address").val();
			let addressInput3 = $("#detailAddress").val();
			let address = addressInput1 + addressInput2 + addressInput3;
			let phoneNumber = $("#phoneNumberInput").val();
			let faxNumber = $("#faxNumberInput").val();
			let business = $("#businessInput").val();
			let typeOfBusiness = $("#typeOfBusinessInput").val();
			let email = $("#emailInput").val();
			let accessAuthority = $("#accessAuthoritySelect").val();
			
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
			
			if(accessAuthority == "접근권한") {
				alert("권한을 선택하세요");
				return;
			}
			
			$.ajax({
				type:"post"
				, url:"/post/order/created/company"
				, data:{"companyType":companyType, "companyName":companyName
					,"ceoName":ceoName, "BusinessNumber":BusinessNumber
					,"address":address, "phoneNumber":phoneNumber
					,"faxNumber":faxNumber, "business":business
					,"typeOfBusiness":typeOfBusiness, "email":email
					, "accessAuthority":accessAuthority}
				, success:function(data) {
					if(data.result == "success") {
						location.href = "/post/order/list";
					} else {
						alert("업체등록 실패");
					}
				}
				, error:function() {
					alert("업체등록 에러");
				}
			});
			
			
		});
	
		
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
						
						isDuplicateBusinessNumber = true;
						$("#duplicateText").removeClass("d-none");
						$("#availableText").addClass("d-none");
					} else { // 중복 안된 상태
						
						isDuplicateBusinessNumber = false;
						$("#availableText").removeClass("d-none");
						$("#duplicateText").addClass("d-none");
					}
					
				}
				, error:function() {
					alert("중복확인 에러");
				}
			});
			
			
		});
		
		
		
		
	});
	
	
	</script>
	
	<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }


                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
</script>

</body>
</html>