<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="info_content_list">
	<div class="info_content_list_title">
		<h2>내가 신청한 맛집<span class="confirm_fix_text">* 이미 신청한 맛집은 수정이 불가능하며 확인만 가능합니다.</span></h2>
	</div>
	<div class="from_content_box view_info_content">
		<div class="form_content">
			<table class="form_tb_all">
				<colgroup>
					<col width="25%">
					<col width="75%">
				</colgroup>
				<tbody>
					<tr>
						<th><span>*</span>신청자</th>
						<td>
							<input type="text" name="name" class="name_form" placeholder="ex) 홍길동" value="${dto.name}" disabled/>
						</td>
					</tr>
					<tr>
						<th><span>*</span>가게이름</th>
						<td>
							<input type="text" name="food_store" class="food_store_form" placeholder="ex) 아웃백"  value="${dto.food_store}" disabled/>
						</td>
					</tr>
					<tr>
						<th><span>*</span>지점명</th>
						<td>
							<input type="text" name="place_name" class="place_name_form" placeholder="ex) 강남점" value="${dto.place_name}" disabled/>
						</td>
					</tr>
					<tr>
						<th rowspan="2"><span>*</span>주소</th>
						<td>
							<input type="text" name="address1" class="address1_form" placeholder="우편번호" value="${dto.address1}" disabled/>
						</td>
					</tr>
					<tr>
						<td>
							<input type="text" name="address2" class="address2_form" id="request_address_form" placeholder="상세주소" value="${dto.address2}" disabled/>
						</td>
					</tr>
					<tr>
						<th class="request_img_view"><span>*</span>등록된 음식사진</th>
						<td>
							<c:forTokens items="${dto.img_name}" var="image" delims=",">
								<img src="/photo/${image}">
							</c:forTokens>
						</td>
					</tr>
					<tr>
						<th><span>*</span>한줄평</th>
						<td>
							<input type="text" name="comment" class="comment_form" placeholder="ex) 여긴 찐 맛집이다!" value="${dto.comment}" disabled/>
						</td>
					</tr>
					<tr>
						<th><span>*</span>추천이유</th>
						<td>
							<textarea name="reason" class="reason_form" placeholder="해당 맛집을 추천하는 이유!? 구체적으로 작성해주셔야 맛집리스트에 등록될 가능성이 높아집니다 :-)" disabled>${dto.reason}</textarea>
						</td>
					</tr>						
				</tbody>
			</table>
		</div>
		<div class="form_all_btn">
			<button type="button" onclick="location.href='/mypage/request/list?page=${currentPage}';" class="btn_cancle">목록</button>
		</div>
	</div>
</div>
