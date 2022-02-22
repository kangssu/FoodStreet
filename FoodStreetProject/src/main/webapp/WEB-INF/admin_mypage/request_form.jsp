<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="info_content_list">
	<div class="info_content_list_title">
		<h2>상세 신청내역<span>상세 내역을 확인 후 맛집리스트로 업데이트 여부를 결정해주세요.</span></h2>
	</div>
	<div class="from_content_box view_info_content">
		<form action="/request/update" method="post">
			<input type="hidden" name="num" value="${dto.num}">
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
								<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
								<script src="/js/address_script.js"></script>
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
								<input type="text" name="hp" placeholder="ex) 02-111-1111" value="${dto.hp}"/>
							</td>
						</tr>
						<tr>
							<th><span>*</span>음식종류</th>
							<td>
								<input type="text" name="type_of_food" class="type_of_food_form" id="type_of_food_form" placeholder="ex) 스테이크 등 양식" value="${dto.type_of_food}"/>
							</td>
						</tr>
						<tr>
							<th><span>*</span>가격대</th>
							<td>
								<input type="text" name="price" class="price_form" id="price_form" placeholder="ex) 만원~이만원 정도" value="${dto.price}"/>
							</td>
						</tr>
						<tr>
							<th><span>*</span>영업시간</th>
							<td>
								<input type="text" name="store_time" class="store_time_form" id="store_time_form" placeholder="ex) AM 10:00 - PM 06:00" value="${dto.store_time}"/>
							</td>
						</tr>
						<tr>
							<th class="request_img_view"><span>*</span>등록된 음식사진</th>
							<td>
								<c:forTokens items="${dto.img_name}" var="image" delims=",">
									<img src="/images/${image}">
								</c:forTokens>
							</td>
						</tr>
						<tr>
							<th><span>*</span>메뉴</th>
							<td>
								<input type="text" name="menu" class="menu_form" placeholder="ex) 대표메뉴를 입력해주세요." value="${dto.menu}"/>
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
							<th><span>*</span>카테고리</th>
							<td>
								<select name="category">
									<option>--선택--</option>
									<option value="일식" <c:if test="${dto.category == '일식'}">selected</c:if>>일식</option>
									<option value="피자" <c:if test="${dto.category == '피자'}">selected</c:if>>피자</option>
									<option value="양식" <c:if test="${dto.category == '양식'}">selected</c:if>>양식</option>
									<option value="브런치" <c:if test="${dto.category == '브런치'}">selected</c:if>>브런치</option>
									<option value="중식" <c:if test="${dto.category == '중식'}">selected</c:if>>중식</option>
									<option value="카페" <c:if test="${dto.category == '카페'}">selected=</c:if>>카페</option>
								</select>
							</td>
						</tr>
						<tr>
							<th><span>*</span>상태변경</th>
							<td>
								<select name="state">
									<option>--선택--</option>
									<option value="대기중" <c:if test="${dto.state == '대기중'}">selected</c:if>>대기중</option>
									<option value="등록완료" <c:if test="${dto.state == '등록완료'}">selected</c:if>>등록완료</option>
									<option value="평가탈락" <c:if test="${dto.state == '평가탈락'}">selected</c:if>>평가탈락</option>
								</select>
							</td>
						</tr>					
					</tbody>
				</table>
			</div>
			<div class="form_all_btn">
				<button type="button" onclick="location.href='/admin/request/list?page=${currentPage}';" class="btn_cancle">목록</button>
				<c:choose>
					<c:when test="${dto.state == '대기중'}">
						<button type="submit" class="btn_confirm">등록하기</button>
					</c:when>
					<c:otherwise>
						<button type="submit" class="btn_confirm">수정하기</button>
					</c:otherwise>
				</c:choose>
			</div>
		</form>
	</div>
</div>
