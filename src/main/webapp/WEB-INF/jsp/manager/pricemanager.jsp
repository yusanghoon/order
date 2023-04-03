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
		<c:import url="/WEB-INF/jsp/include/menu.jsp"/>
		<section class="col-10 pt-5 pl-5">
				<Table class="table text center">
					<thead>
						<tr>
							<th>순서</th>
							<th>제품 코드</th>
							<th>제품명</th>
							<th>판매구분</th>
							<th>판매가격</th>
							<th>가능여부</th>
							<th>관리</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="price"  items="${price}">
						<tr id="list">
							<th>${price.id }</th>
							<th>${price.name }</th>
							<th>${price.code }</th>
							<th>${price.type }</th>
							<th>${price.price }</th>
							<th>${price.availability }</th>
							
							<th>
							<button type="submit" data-post-id="${price.id }" class="btn modify-Btn main-color text-white">수정</button>
							<button type="submit" data-post-id="${price.id }" class="btn delete-Btn bg-danger text-white">삭제</button>
							</th>
							
						</tr>
					</c:forEach>
					</tbody>
				</Table>
				<button id="additionBtn" type="submit" class="btn float-right login_btn mt-2 main-color">추가</button>
			</section>
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
	
	
	<script>
		$(document).ready(function(){

			
			
	 		/* $(".delete-Btn").on("click", function() {
				
				// 해당 more-btn 태그에있는 post-id를 모달의 a태그에 넣는다. 
				let priceId = $(this).data("post-id");
				
				
				// data-post-id=""
				$("#deleteBtn").data("post-id", priceId);
				
			});  */
			
			$(".delete-Btn").on("click", function() {
				
				let priceId = $(this).data("post-id");
				
				
				$.ajax({
					type:"get"
					, url:"/post/manager/price/delete"
					, data:{"priceId":priceId}
					, success:function(data) {
						if(data.result == "success") {
							location.reload();
							alert("삭제 완료");
						} else {
							alert("삭제 실패");
						}
						
					}
					, error :function() {
						alert("삭제 에러");
					}
				});
			});
			
			
			
			
			
			$("#additionBtn").on("click", function(){

				$.ajax({
					type : "post"
					, url : "/post/manager/price/create"
					, data : {}
					, success : function(data){
						
						if(data.result == "success"){
							location.reload();
						} else {
							alert("추가 실패");
						}	
					}
					, error : function(){
						alert("추가에러");
					}
				});
			
				
				
				
			});
	
		});	
	
	</script>
	
	
</body>