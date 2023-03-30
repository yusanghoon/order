<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
		
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
				          <div class="panel-body"><a class="text-dark" href="/post/order/list">-등록업체조회</div>
				          <div class="panel-body"><a class="text-dark" href="/post/order/list">-계산서 목록</div>
				          <div class="panel-body"><a class="text-dark" href="/post/order/list">-미발행계산서 목록</div>
				           <div class="panel-body "><a class="text-dark" href="/post/order/created">-신규업체 등록</a></div>
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
				          <div class="panel-body "><a class="text-dark" href="/post/order/created">-대리점 관리</a></div>
				           <div class="panel-body "><a class="text-dark" href="/post/manager/price/list">-제품단가</a></div>
				           <div class="panel-body "><a class="text-dark"  href="/post/manager/price">-프로모션 설정</a></div>
				        </div>
				      </div> 
				    </div>
                 </ul>         
            </nav>
		