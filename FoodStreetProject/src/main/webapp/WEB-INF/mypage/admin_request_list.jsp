<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="info_content_list">
	<div class="info_content_list_title">
		<h2>신청내역<span>맛집신청 페이지에서 신청된 내역입니다.</span></h2>
	</div>
	<div class="info_content_list_title more_button_text">
		<a href="/admin/mypage">
			<span>홈으로 돌아가기<i class="fa fa-angle-right" aria-hidden="true"></i></span>
		</a>
	</div>
	<div class="info_content_all_table">
		<table class="info_list_table">
			<thead>
				<tr>
					<th width="10%">No</th>
					<th width="10%">신청자</th>
					<th width="20%">가게이름</th>
					<th width="10%">지점명</th>
					<th width="20%">주소</th>
					<th width="10%">신청일</th>
					<th width="20%">비고</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${list.size()==0}">
						<tr>
							<td colspan="7">맛집 신청내역이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="r" items="${list}" varStatus="i">
							<tr>
								<td>${no}</td>
								<c:set var="no" value="${no-1}" />
								<td>${r.name}</td>
								<td>${r.food_store}</td>
								<td>${r.place_name }</td>
								<td>${r.address2}</td>
								<td><fmt:formatDate value="${r.reporting_date}" pattern="yyyy-MM-dd"/></td>
								<td>
									<button type="button" class="request_view">확인</button>
									<button type="button" class="request_del">삭제</button>
								</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		<ul class="paging">
			<c:if test="${paging.prev}">
				<li><a href="/admin/mypage/request?page=${paging.startPage-1}"><i class="fa fa-angle-left" aria-hidden="true"></i></a></li>
			</c:if>
			<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="num">
				<c:choose>
					<c:when test="${currentPage == num}">
						<li class="active"><a href="/admin/mypage/request?page=${num}">${num}</a></li>
					</c:when>
					<c:otherwise>
						<li class="select"><a href="/admin/mypage/request?page=${num}">${num}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${paging.next && paging.endPage>0}">
				<li><a href="/admin/mypage/request?page=${paging.endPage+1}"><i class="fa fa-angle-right" aria-hidden="true"></i></a></li>
			</c:if>	
		</ul>
	</div>
</div>