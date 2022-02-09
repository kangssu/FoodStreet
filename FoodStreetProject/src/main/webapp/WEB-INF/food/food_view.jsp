<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="food_list_wrap">
	<div class="food_list_all_box container">
		<div class="top_view_sub_title">
			<span>화정점</span>
			<h2>메드포갈릭</h2>
		</div>
		<div class="food_detail_new_img_content">
			<img src="/img/pizza_new.jpg">
			<img src="/img/pizza_new.jpg">
			<img src="/img/pizza_new.jpg">
			<img src="/img/pizza_new.jpg">
		</div>
		<div class="food_detail_all_content">
			<div class="food_detail_content">
				<table>
					<tr>
						<th>주소</th>
						<td>경기도 고양시 덕양구 백양로</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td>02-111-1111</td>
					</tr>
					<tr>
						<th>음식종류</th>
						<td>스테이크, 파스타, 리조또 등등 양식</td>
					</tr>
					<tr>
						<th>가격대</th>
						<td>전부 만원 이상</td>
					</tr>
					<tr>
						<th>영업시간</th>
						<td>AM 10:00 - PM 10:00 (휴무없음)</td>
					</tr>
				</table>
			</div>
			<div class="food_detail_content">
				<div class="food_detail_menu_title">
					<h3>대표메뉴</h3>
				</div>
				<div class="food_detail_menu">
					<p>루꼴라 피자 : 10000원</p>
					<p>크림리조또 : 10000원</p>
					<p>베이컨스파게티 : 10000원</p>
					<p>루꼴라 피자 : 10000원</p>
					<p>루꼴라 피자 : 10000원</p>
				</div>
			</div>
			<div class="food_detail_content">
				<div class="food_detail_menu_title">
					<h3>지도자리</h3>
				</div>
			</div>
		</div>
		<div class="food_detail_back_btn">
			<button type="button">목록보기</button>
		</div>
		<div class="food_detail_comment_list">
			<div class="comment_list_title">
				<div class="title_box">
					<h2>리뷰<span>해당 맛집에 대한 솔직한 리뷰를 작성해주세요.</span></h2>
				</div>
				<div class="title_box">
					<a href="#">
						<i class="bi bi-pencil-fill"></i>리뷰쓰기
					</a>
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