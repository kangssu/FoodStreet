<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="info_content_list">
	<div class="info_content_list_title">
		<h2>상세 신청내역<span>상세 내역을 확인 후 맛집리스트로 업데이트 여부를 결정해주세요.</span></h2>
	</div>
	<div class="from_content_box view_info_content">
		<form action="/request/success" method="post" enctype="multipart/form-data">
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
								<input type="text" name="name" class="name_form" placeholder="ex) 홍길동" value="${dto.name}"/>
							</td>
						</tr>
						<tr>
							<th><span>*</span>가게이름</th>
							<td>
								<input type="text" name="food_store" class="food_store_form" placeholder="ex) 아웃백" value="${dto.food_store}"/>
							</td>
						</tr>
						<tr>
							<th><span>*</span>지점명</th>
							<td>
								<input type="text" name="place_name" class="place_name_form" placeholder="ex) 강남점" value="${dto.place_name}"/>
							</td>
						</tr>
						<tr>
							<th rowspan="2"><span>*</span>주소</th>
							<td>
								<input type="text" name="address1" class="address1_form" placeholder="우편번호" value="${dto.address1}"/>
								<button type="button" id="hp_sms_btn" onclick="execPostCode();">주소찾기</button>
							</td>
						</tr>
						<tr>
							<td>
								<input type="text" name="address2" class="address2_form" id="request_address_form" placeholder="상세주소" value="${dto.address2}"/>
							</td>
						</tr>
						<tr>
							<th><span>*</span>매장번호</th>
							<td>
								<input type="text" name="hp" class="hp_form" id="hp_form" placeholder="ex) 02-111-1111"/>
							</td>
						</tr>
						<tr>
							<th><span>*</span>음식종류</th>
							<td>
								<input type="text" name="type_of_food" class="type_of_food_form" id="type_of_food_form" placeholder="ex) 스테이크 등 양식"/>
							</td>
						</tr>
						<tr>
							<th><span>*</span>가격대</th>
							<td>
								<input type="text" name="price" class="price_form" id="price_form" placeholder="ex) 만원~이만원 정도"/>
							</td>
						</tr>
						<tr>
							<th><span>*</span>영업시간</th>
							<td>
								<input type="text" name="store_time" class="store_time_form" id="store_time_form" placeholder="ex) AM 10:00 - PM 06:00"/>
							</td>
						</tr>
						<tr>
							<th><span>*</span>음식사진</th>
							<td>
								<input type="file" name="file" class="food_img_form" value="no" multiple/>
							</td>
						</tr>
						<tr>
							<th class="request_img_view"><span>*</span>음식사진 미리보기</th>
							<td>
								<c:forTokens items="${dto}" var="item" delims=",">
								</c:forTokens>
							</td>
						</tr>
						<tr>
							<th><span>*</span>한줄평</th>
							<td>
								<input type="text" name="comment" class="comment_form" placeholder="ex) 여긴 찐 맛집이다!" value="${dto.comment}"/>
							</td>
						</tr>
						<tr>
							<th><span>*</span>추천이유</th>
							<td>
								<textarea name="reason" class="reason_form" placeholder="해당 맛집을 추천하는 이유!? 구체적으로 작성해주셔야 맛집리스트에 등록될 가능성이 높아집니다 :-)">${dto.reason}</textarea>
							</td>
						</tr>	
						<tr>
							<th><span>*</span>상태변경</th>
							<td>
								<input type="text" name="state" id="state_form" value="${dto.state}"/>
								<select>
									<option value="대기중">대기중</option>
									<option value="등록완료">등록완료</option>
									<option value="평가탈락">평가탈락</option>
								</select>
							</td>
						</tr>					
					</tbody>
				</table>
			</div>
			<div class="form_all_btn">
				<button type="button" onclick="location.href='/admin/mypage/request';" class="btn_cancle">목록</button>
				<button type="submit" class="btn_confirm">등록하기</button>
			</div>
		</form>
	</div>
</div>
