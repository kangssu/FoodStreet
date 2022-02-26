<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<div id="request_form_wrap">
	<div class="request_form_all_box container">
		<div class="top_sub_title">
			<h2>맛집신청</h2>
		</div>
		<div class="join_from_content_box success_guide">
			<div class="success_content">
				<i class="fa fa-smile-o" aria-hidden="true"></i>
				<p>맛집 신청완료!</p>
				<p>혼자만 아는 맛집! 공유해주셔서 감사합니다.</p>
			</div>
			<div class="success_content_btn">
				<button type="button" onclick="location.href='${root}/'" class="success_home_btn">홈으로</button>
				<button type="button" onclick="location.href='${root}/request'" class="btn_confirm">신청하기</button>
			</div>
		</div>
	</div>
</div>