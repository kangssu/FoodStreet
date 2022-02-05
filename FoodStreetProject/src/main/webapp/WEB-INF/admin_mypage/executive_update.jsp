<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="info_content_list">
	<div class="info_content_list_title">
		<h2>운영진 계정 수정<span>푸드스트릿을 함께 운영할 운영진의 계정을 수정해주세요.</span></h2>
	</div>
	<div class="from_content_box view_info_content">
		<form action="/join/update" method="post" onsubmit="return submitUpdate();" enctype="multipart/form-data">
			<input type="hidden" name="num" value="${dto.num}">
			<div class="form_content">
				<table class="form_tb_all">
					<colgroup>
						<col width="25%">
						<col width="75%">
					</colgroup>
					<tbody>
						<tr>
							<th class="row_add"><span>*</span>아이디</th>
							<td>
								<input type="text" name="id" class="id_form" id="id_form" value="${dto.id}" disabled/>
							</td>
						</tr>
						<tr>
							<th><span>*</span>비밀번호</th>
							<td>
								<button type="button" id="pw_modify_btn">비밀번호 변경</button>
								<div class="pw_modify_all_box">
									<div class="join_modify_form_pw_all">
										<div class="join_modify_form_pw" id="join_form_pw">새 비밀번호</div>
										<div class="join_modify_form_pw">
											<input type="password" name="pw" class="pw_form" id="pw_form" 
											pw="${dto.pw}" value="${MemberDto.pw}"/>
											<p id="pw_check_tag">${valid_pw}</p>
										</div>
									</div>
									<div class="join_modify_form_pw_all" id="pw_all">
										<div class="join_modify_form_pw" id="join_form_pw_check">새 비밀번호 확인</div>
										<div class="join_modify_form_pw">
											<input type="password" name="pw_check" class="pwcheck_form" 
											id="pwcheck_form" value="${MemberDto.pw_check}"/>
											<p id="pwcheck_check_tag">${valid_pw_check}</p>
										</div>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<th><span>*</span>이름</th>
							<td>
								<input type="text" name="name" class="name_form" id="name_form" value="${dto.name}" disabled/>
							</td>
						</tr>
						<tr>
							<th><span>*</span>닉네임</th>
							<td>
								<input type="text" name="nickname" class="nickname_form" id="nickname_form" value="${dto.nickname}" disabled/>
							</td>
						</tr>
						<tr>
							<th><span>*</span>이메일</th>
							<td>
								<input type="text" name="email" class="email_form" id="email_form" value="${dto.email}"/>
								<p id="email_check_tag">${valid_email}</p>
							</td>
						</tr>
						<tr>
							<th><span>*</span>핸드폰</th>
							<td>
								<input type="text" name="hp" class="hp_form" id="hp_form" placeholder="-없이 입력해주세요." value="${dto.hp}"/>
								<p id="hp_forward_tag">${valid_hp}</p>									
							</td>
						</tr>
						<tr>
							<th><span>*</span>프로필 이미지</th>
							<td>
								<button type="button" id="img_modify_btn">프로필 이미지 변경</button>
								<div class="join_modify_form_img_all">
									<div class="join_modify_form_img" id="join_form_img">새 프로필 선택</div>
									<div class="join_modify_form_img">
										<input type="file" name="file" class="img_form" id="img_check"/>
									</div>
									<p id="small_point_text">※ 기존 이미지에서 변경시에만 선택해주세요.</p>
										<p>${valid_img_name}</p>
								</div>
							</td>
						</tr>							
					</tbody>
				</table>
			</div>
			<div class="form_all_btn">
				<button type="button" onclick="location.href='/admin/executive/list';" class="btn_cancle">취소</button>
				<button type="submit" class="btn_confirm">수정하기</button>
			</div>
		</form>
	</div>
</div>
