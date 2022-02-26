<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="login_wrap">
	<div class="login_all_box container">
		<div class="top_sub_title">
			<h2>로그인</h2>
		</div>
		<form action="/login/success" method="post" onsubmit="return submitLogin();">
			<div class="login_form_box">
				<input type="text" name="id" class="id_content" placeholder="아이디를 입력해주세요." class="login_form_box_1"/>
				<input type="password" name="pw" class="pw_content" placeholder="비밀번호를 입력해주세요."/>
			</div>
			<div class="login_all_btn">
				<button type="submit" class="login_nomal_btn">로그인</button>
				<a href="/oauth2/authorization/google" class="sns_google"><img src="/img/Google_icon.png" alt="구글"/>구글 계정으로 로그인</a>
				<button type="button" class="login_join_btn" onclick="location.href='/join'">회원가입</button>
			</div>
		</form>
		<!-- <div class="login_plus_btn">
			<ul>
				<li>
					<button type="button" class="login_id_btn">아이디찾기</button>
				</li>
				<li>
					<button type="button" class="login_pw_btn">비밀번호찾기</button>
				</li>
			</ul>
		</div> -->
	</div>
</div>