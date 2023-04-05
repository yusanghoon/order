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
							<th><input type="text">${price.id }</th>
							<th><input type="text">${price.name }</th>
							<th><input type="text">${price.code }</th>
							<th><input type="text">${price.type }</th>
							<th><input type="text">${price.price }</th>
							<th><input type="text">${price.availability }</th>
							
							<th>
							<button type="submit" data-post-id="${price.id }" class="btn modify-Btn main-color text-white">수정 완료</button>
							
							</th>
							
						</tr>
					</c:forEach>
					</tbody>
				</Table>
			
			</section>
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
	
	
	<script>
		$(document).ready(function(){


			
			
			$(".modify-Btn").on("click", function() {
				
				let priceId = $(this).data("post-id");
				
				
				$.ajax({
					type:"get"
					, url:"/post/manager/price/modify"
					, data:{"priceId":priceId}
					, success:function(data) {
						if(data.result == "success") {
							location.reload();
							
						} else {
							alert("삭제 실패");
						}
						
					}
					, error :function() {
						alert("삭제 에러");
					}
				});
			});
			

	
		});	
	
	</script>
	
	
</body>