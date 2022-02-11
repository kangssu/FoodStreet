<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="food_list_wrap">
	<div class="food_list_all_box container">
		<div class="top_view_sub_title">
			<span>${dto.place_name}</span>
			<h2>${dto.food_store}</h2>
		</div>
		<div class="food_detail_new_img_content">
			<c:choose>
				<c:when test="${count>=4}">
					<c:forTokens items="${dto.img_name}" var="image" delims="," begin="1" end="4">
						<img src="/images/${image}">
					</c:forTokens>
				</c:when>
			</c:choose>
		</div>
		<div class="food_detail_all_content">
			<div class="food_detail_content">
				<table>
					<tr>
						<th>주소</th>
						<td>${dto.address2}</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td>${dto.hp}</td>
					</tr>
					<tr>
						<th>음식종류</th>
						<td>${dto.type_of_food}</td>
					</tr>
					<tr>
						<th>가격대</th>
						<td>${dto.price}</td>
					</tr>
					<tr>
						<th>영업시간</th>
						<td>${dto.store_time}</td>
					</tr>
				</table>
			</div>
			<div class="food_detail_content">
				<div class="food_detail_menu_title">
					<h3>대표메뉴</h3>
				</div>
				<div class="food_detail_menu">
					<c:forTokens items="${dto.menu}" var="menu" delims=",">
					<p>${menu}</p>
					</c:forTokens>
				</div>
			</div>
			<div class="food_detail_content">
				<div class="food_detail_menu_title">
					<h3>지도자리</h3>
				</div>
			</div>
		</div>
		<div class="food_detail_back_btn">
			<button type="button" onclick="location.href='/food/list?page=${currentPage}'">목록보기</button>
		</div>
		<div class="food_detail_comment_list">
			<div class="comment_list_title">
				<div class="title_box">
					<h2>리뷰<span>해당 맛집에 대한 솔직한 리뷰를 작성해주세요.</span></h2>
				</div>
				<div class="title_box">
				<c:choose>
					<c:when test="${member.id == null}">
						<a onclick="reviewPopup();">
							<i class="bi bi-pencil-fill"></i>리뷰쓰기
						</a>
					</c:when>
					<c:otherwise>
						<a onclick="reviewWritePopup();">
							<i class="bi bi-pencil-fill"></i>리뷰쓰기
						</a>
					</c:otherwise>
				</c:choose>
				</div>
			</div>
			<div class="commtent_list_all_box">
				<div class="commtent_list_box">
					<div class="commtent_my_info">
						<img src="/img/noimg.png">
						<h3>홍길동</h3>
					</div>
					<div class="commtent_my_content">
						<div class="comment_my_cotent_box">
							<span>2022-02-09</span>
							<p>정말 여기는 찐 맛집이예요! 정말 여기는 찐 맛집이예요!
							정말 여기는 찐 맛집이예요!정말 여기는 찐 맛집이예요!정말 여기는 찐 맛집이예요!
							정말 여기는 찐 맛집이예요!정말 여기는 찐 맛집이예요!정말 여기는 찐 맛집이예요!정말 여기는 찐 맛집이예요!
							정말 여기는 찐 맛집이예요!정말 여기는 찐 맛집이예요!정말 여기는 찐 맛집이예요!
							정말 여기는 찐 맛집이예요!정말 여기는 찐 맛집이예요!정말 여기는 찐 맛집이예요!정말 여기는 찐 맛집이예요!
							정말 여기는 찐 맛집이예요!정말 여기는 찐 맛집이예요!정말 여기는 찐 맛집이예요!정말 여기는 찐 맛집이예요!
							정말 여기는 찐 맛집이예요!정말 여기는 찐 맛집이예요!정말 여기는 찐 맛집이예요!
							정말 여기는 찐 맛집이예요!정말 여기는 찐 맛집이예요!
							정말 여기는 찐 맛집이예요!정말 여기는 찐 맛집이예요!정말 여기는 찐 맛집이예요!</p>
							<div class="comment_img_box">
								<img src="/img/pizza_new.jpg">
								<img src="/img/pizza_new.jpg">
								<img src="/img/pizza_new.jpg">
								<img src="/img/noimg.png">
							</div>
						</div>
					</div>
				</div>
				<div class="commtent_list_box">
					<div class="commtent_my_info">
						<img src="/img/noimg.png">
						<h3>홍길동</h3>
					</div>
					<div class="commtent_my_content">
						<div class="comment_my_cotent_box">
							<span>2022-02-09</span>
							<p>정말 여기는 찐 맛집이예요! 정말 여기는 찐 맛집이예요!
							정말 여기는 찐 맛집이예요!정말 여기는 찐 맛집이예요!정말 여기는 찐 맛집이예요!</p>
						</div>
					</div>
				</div>
				<div class="commtent_list_box">
					<div class="commtent_my_info">
						<img src="/img/noimg.png">
						<h3>홍길동</h3>
					</div>
					<div class="commtent_my_content">
						<div class="comment_my_cotent_box">
							<span>2022-02-09</span>
							<p>정말 여기는 찐 맛집이예요! 정말 여기는 찐 맛집이예요!
							정말 여기는 찐 맛집이예요!정말 여기는 찐 맛집이예요!정말 여기는 찐 맛집이예요!
							정말 여기는 찐 맛집이예요!정말 여기는 찐 맛집이예요!정말 여기는 찐 맛집이예요!정말 여기는 찐 맛집이예요!
							정말 여기는 찐 맛집이예요!정말 여기는 찐 맛집이예요!정말 여기는 찐 맛집이예요!
							정말 여기는 찐 맛집이예요!정말 여기는 찐 맛집이예요!정말 여기는 찐 맛집이예요!정말 여기는 찐 맛집이예요!
							정말 여기는 찐 맛집이예요!정말 여기는 찐 맛집이예요!정말 여기는 찐 맛집이예요!정말 여기는 찐 맛집이예요!
							정말 여기는 찐 맛집이예요!정말 여기는 찐 맛집이예요!정말 여기는 찐 맛집이예요!
							정말 여기는 찐 맛집이예요!정말 여기는 찐 맛집이예요!
							정말 여기는 찐 맛집이예요!정말 여기는 찐 맛집이예요!정말 여기는 찐 맛집이예요!</p>
							<div class="comment_img_box">
								<img src="/img/pizza_new.jpg">
								<img src="/img/pizza_new.jpg">
								<img src="/img/pizza_new.jpg">
								<img src="/img/noimg.png">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 리뷰쓰기 클릭시 로그인 안했을 경우 나오는 팝업! -->
<div id="review_popup" class="hide">
	<div class="content">
		<h3 class="popup_title"><i class="fa fa-bell-o" aria-hidden="true"></i>로그인 확인</h3>
		<p class="popup_text">
			소중한 리뷰는 로그인 후 작성해주세요.
		</p>
		<div class="popup_btn">
			<button type="button" onclick="location.href='/login';" id="btn_ok_del">로그인하기</button>
			<button type="button" id="btn_close" onclick="closereviewPopup()" >닫기</button>
		</div>
	</div>
</div>
<!-- 리뷰쓰기 클릭시 로그인 했을 경우 나오는 팝업! -->
<div id="r_write_popup" class="hide">
	<div class="content">
		<h3 class="popup_title"><i class="bi bi-chat-right-text"></i>리뷰 작성</h3>
		<p class="popup_text">솔직한 회원님의 리뷰를 남겨주세요!</p>
		<input type="hidden" name="num" id="num" value="${dto.num}">
		<input type="hidden" name="id" id="id" value="${member.id}">
		<textarea name="comment" id="comment" placeholder="해당 맛집에 대한 리뷰를 자세하게 남겨주시면 많은 사람들에게 도움이 될 것 같습니다 :-)"></textarea>
		<span>* 이미지는 최대 4장까지만 등록이 가능합니다.</span>
		<input type="file" id="file" multiple>
		<div class="popup_btn">
			<button type="submit" id="btn_suceess">등록</button>
			<button type="button" id="btn_close" onclick="closereviewWritePopup()" >취소</button>
		</div>
	</div>
</div>