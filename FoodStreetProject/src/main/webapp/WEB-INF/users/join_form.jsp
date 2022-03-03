<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="join_form_wrap">
	<div class="join_form_all_box container">
		<div class="top_sub_title">
			<h2>회원가입</h2>
		</div>
		<div class="from_content_box">
			<div class="form_sub_title">
				<h2>기본정보<span>* 필수입력사항</span></h2>
			</div>
			<form action="/join/success" method="post" onsubmit="return submitCheck();" enctype="multipart/form-data">
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
									<input type="text" name="id" class="id_form" id="id_form" value="${MemberDto.id}"/>
									<p id="id_check_tag">${valid_id}</p>
								</td>
							</tr>
							<tr>
								<th><span>*</span>비밀번호</th>
								<td>
									<input type="password" name="pw" class="pw_form" id="pw_form" value="${MemberDto.pw}"/>
									<p id="pw_check_tag">${valid_pw}</p>
								</td>
							</tr>
							<tr>
								<th><span>*</span>비밀번호 확인</th>
								<td>
									<input type="password" name="pw_check" class="pwcheck_form" id="pwcheck_form" value="${MemberDto.pw_check}"/>
									<p id="pwcheck_check_tag">${valid_pw_check}</p>
								</td>
							</tr>
							<tr>
								<th><span>*</span>이름</th>
								<td>
									<input type="text" name="name" class="name_form" id="name_form" value="${MemberDto.name}"/>
									<p id="name_check_tag">${valid_name}</p>
								</td>
							</tr>
							<tr>
								<th><span>*</span>닉네임</th>
								<td>
									<input type="text" name="nickname" class="nickname_form" id="nickname_form" value="${MemberDto.nickname}"/>
									<p id="nickname_check_tag">${valid_nickname}</p>
								</td>
							</tr>
							<tr>
								<th><span>*</span>이메일</th>
								<td>
									<input type="text" name="email" class="email_form" id="email_form" value="${MemberDto.email}"/>
									<p id="small_point_text">※ 아이디/패스워드 찾기에 활용 되므로 정확하게 입력해주세요.</p>
									<p id="email_check_tag">${valid_email}</p>
								</td>
							</tr>
							<tr>
								<th rowspan="2"><span>*</span>핸드폰</th>
								<td>
									<input type="text" name="hp" class="hp_form" id="hp_form" placeholder="-없이 입력해주세요." value="${MemberDto.hp}"/>
									<button type="button" id="hp_sms_btn">휴대폰 인증</button>
									<p id="hp_forward_tag">${valid_hp}</p>									
								</td>
							</tr>
							<tr>
								<td>
									<input type="text" name="hp_check" class="hp_check" id="hp_check"/>
									<button type="button" id="hp_check_btn">인증확인</button>
									<p id="hp_check_tag"></p>
								</td>
							</tr>
							<tr>
								<th rowspan="2"><span></span>프로필 이미지</th>
								<td>
									<input type="file" name="file" class="img_form" id="img_check" value="${MemberDto.img_name}"/>
									<p>${valid_img_name}</p>	
								</td>
							</tr>							
						</tbody>
					</table>
				</div>
				<div class="form_all_btn">
					<button type="button" onclick="location.href='/join';" class="btn_cancle">취소</button>
					<button type="submit" class="btn_confirm">회원가입</button>
				</div>
			</form>
		</div>
	</div>
</div>