<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="join_wrap">
	<div class="join_all_box container">
		<div class="top_sub_title">
			<h2>회원가입</h2>
		</div>
		<div class="join_all_btn">
			<button type="button" onclick="location.href='/join/form';" class="join_ok_btn">회원가입하기</button>
		</div>
		<div class="sns">
			<div class="sns_title">
				<p>SNS 계정으로 간편하게 회원가입 하세요.</p>
			</div>
			<div class="sns_icons">
				<a href="/oauth2/authorization/google" class="sns_google"><img src="/img/Google_icon.png" alt="구글"/>구글 계정으로 계속하기</a>
			</div>
		</div>
		<div class="sns_guide">
			<i class="fa fa-exclamation-circle" aria-hidden="true"></i>
			<span>SNS 계정을 연동하여 빠르고 쉽고 안전하게 회원가입 할 수 있습니다.<br>
			이 과정에서 고객님의 데이터는 철저하게 보호됩니다.</span>
		</div>
	</div>
</div>