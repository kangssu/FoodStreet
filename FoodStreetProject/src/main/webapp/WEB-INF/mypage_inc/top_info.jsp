<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="top_sub_title">
	<h2>마이페이지</h2>
</div>
<div class="top_info_box">
	<div class="info_content_box">
		<img src="/img/noimg.png">
	</div>
	<div class="info_content_box info_content_box_gride">
		<p><span>${member.name}님,</span> 푸드스트릿에 오신걸 환영합니다.</p>
		<div class="info_all_button">
			<c:choose>
				<c:when test="${member.id eq 'admin'}">
					<button type="button" onclick="location.href='/admin/request/list';">신청내역</button>
					<button type="button" onclick="location.href='/admin/executive/list';">운영진 계정 관리</button>
					<button type="button" onclick="location.href='/admin/executive/form';">운영진 계정 생성</button>
				</c:when>
				<c:otherwise>
					<button type="button" onclick="location.href='/mypage/modify';">회원정보수정</button>
					<button type="button">내가 신청한 맛집</button>
					<button type="button">내가 등록한 리뷰</button>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>