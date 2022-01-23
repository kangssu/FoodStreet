<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="login_wrap">
	<div class="login_all_box container">
		<div class="login_title">
			<h2>로그인</h2>
		</div>
		<form action="/login/success" method="post">
			<div class="login_form_box">
				<input type="text" name="id" placeholder="아이디를 입력해주세요." class="login_form_box_1"/>
				<input type="password" name="pw" placeholder="비밀번호를 입력해주세요."/>
			</div>
			<div class="login_all_btn">
				<button type="submit" class="login_nomal_btn">로그인</button>
				<button type="button" class="login_join_btn" onclick="location.href='/join'">회원가입</button>
			</div>
		</form>
		<div class="login_plus_btn">
			<ul>
				<li>
					<button type="button" class="login_id_btn">아이디찾기</button>
				</li>
				<li>
					<button type="button" class="login_pw_btn">비밀번호찾기</button>
				</li>
			</ul>
		</div>
		<div class="sns">
			<div class="sns_title">
				<p>SNS 계정으로 간편하게 로그인 하세요.</p>
			</div>
			<div class="sns_icons">
				<a href="#" class="sns_naver"><img src="/img/naver_logo.png" alt="네이버"/></a>
				<a href="#" class="sns_kakao"><img src="/img/kakao_logo.png" alt="카카오"/></a>
				<a href="#" class="sns_google"><img src="/img/google_logo.png" alt="구글"/></a>
			</div>
		</div>
	</div>
</div>