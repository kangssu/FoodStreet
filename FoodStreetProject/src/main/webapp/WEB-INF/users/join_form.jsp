<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript">
	$(document).ready(function(){
		//alert("1"); //나옴!
		
		
	});
</script>
<div id="join_from_wrap">
	<div class="join_form_all_box container">
		<div class="join_title">
			<h2>회원가입</h2>
		</div>
		<div class="join_from_content_box">
			<div class="form_sub_title">
				<h2>기본정보<span>* 필수입력사항</span></h2>
			</div>
			<form action="/join/insert" method="post">
				<input type="hidden" name="member_level" value="10"/>
				<div class="form_content">
					<table class="form_tb_all">
						<colgroup>
							<col width="25%">
							<col width="75%">
						</colgroup>
						<tbody>
							<tr>
								<th><span>*</span>아이디</th>
								<td>
									<input type="text" name="id" class="name_form"/>
									<p>사용가능한 아이디입니다.</p>
								</td>
							</tr>
							<tr>
								<th><span>*</span>비밀번호</th>
								<td>
									<input type="password" name="pw" class="pw_form"/>
									<p>최소 10글자 이상 작성해주세요.</p>
								</td>
							</tr>
							<tr>
								<th><span>*</span>비밀번호 확인</th>
								<td>
									<input type="password" name="pw_check" class="pwcheck_form"/>
									<p>비밀번호가 다릅니다.</p>
								</td>
							</tr>
							<tr>
								<th><span>*</span>이름</th>
								<td><input type="text" name="name" class="name_form"/></td>
							</tr>
							<tr>
								<th><span>*</span>닉네임</th>
								<td><input type="text" name="nickname" class="nickname_form"/></td>
							</tr>
							<tr>
								<th><span>*</span>이메일</th>
								<td>
									<input type="text" name="email" class="email_form"/>
									<select class="all_mail_choice">
										<option value="self">직접입력</option>
										<option value="naver">naver.com</option>
										<option value="hanmail">hanmail.net</option>
										<option value="daum">daum.net</option>
										<option value="nate">nate.com</option>
									</select>
								</td>
							</tr>
							<tr>
								<th rowspan="2"><span>*</span>핸드폰</th>
								<td>
									<input type="text" name="hp" class="hp_form" placeholder="-없이 입력해주세요."/>
									<button type="button">휴대폰 인증</button>
									<p>문자로 인증번호가 발송되었습니다.</p>									
								</td>
							</tr>
							<tr>
								<td>
									<input type="text" name="hp_check" class="hp_form"/>
									<button type="button">인증확인</button>
									<p>인증 확인되었습니다.</p>
								</td>
							</tr>
							<tr>
								<th rowspan="2"><span>*</span>프로필 이미지</th>
								<td>
									<input type="file" name="member_img" class="img_form"/>
								</td>
							</tr>							
						</tbody>
					</table>
				</div>
				<div class="join_form_all_btn">
					<button type="button" onclick="location.href='/';" class="btn_cancle">취소</button>
					<button type="submit" class="btn_confirm">회원가입</button>
				</div>
			</form>
		</div>
	</div>
</div>