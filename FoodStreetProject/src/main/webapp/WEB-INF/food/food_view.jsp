<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
				<c:choose>
					<c:when test="${reviewList.size() == 0}">
						<div class="not_comment">
							<p>등록된 리뷰가 없습니다. 소중한 첫 리뷰를 작성해주세요!</p>
						</div>
					</c:when>
					<c:otherwise>
						<c:forEach var="r" items="${reviewList}">
							<div class="commtent_list_box">
								<div class="commtent_my_info">
									<img src="/img/noimg.png">
									<h3>${r.id}</h3>
									<c:if test="${member.id == r.id}">
										<div class="food_review_all_btn">
											<button type="button" class="food_review_modify" onclick="reviewModifyPopup(${r.idx});">수정</button>
											<button type="button" class="food_review_del" onclick="reviewDelPopup(${r.idx});">삭제</button>
										</div>
									</c:if>
								</div>
								<div class="commtent_my_content">
									<div class="comment_my_cotent_box">
										<span><fmt:formatDate value="${r.reporting_date}" pattern="yyyy-MM-dd"/></span>
										<p>${r.comment}</p>
										<div class="comment_img_box">
											<c:if test="${r.img_name1 != null and r.img_name1 != ''}">
												<img src="/images/${r.img_name1}" class="review_img_one">
											</c:if>
											<c:if test="${r.img_name2 != null and r.img_name2 != ''}">
												<img src="/images/${r.img_name2}" class="review_img_two">
											</c:if>
											<c:if test="${r.img_name3 != null and r.img_name1 != ''}">
												<img src="/images/${r.img_name3}" class="review_img_three">
											</c:if>
											<c:if test="${r.img_name4 != null and r.img_name1 != ''}">
												<img src="/images/${r.img_name4}" class="review_img_four">
											</c:if>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</div>
<!-- 리뷰쓰기 클릭시 로그인 안했을 경우 나오는 팝업! -->
<div id="review_popup" class="hide">
	<div class="content">
		<button type="button" class="review_close" onclick="closereviewPopup()"><i class="bi bi-x-lg"></i></button>
		<h3 class="popup_title"><i class="fa fa-bell-o" aria-hidden="true"></i>로그인 확인</h3>
		<p class="popup_text">
			소중한 리뷰는 로그인 후 작성해주세요.
		</p>
		<button type="button" onclick="location.href='/login';" id="btn_login_go">로그인하기</button>
		<div id="join_guide">
			<i class="fa fa-exclamation-circle" aria-hidden="true"></i>
			<span>아직 회원이 아니신가요?</span>
			<button type="button" onclick="location.href='/join';" id="btn_join_go">회원가입하기</button>
		</div>
	</div>
</div>
<!-- 리뷰 등록시 팝업! -->
<div id="r_write_popup" class="hide">
	<div class="content">
		<h3 class="popup_title"><i class="bi bi-chat-right-text"></i>리뷰 작성</h3>
		<p class="popup_text">솔직한 회원님의 리뷰를 남겨주세요!</p>
		<form id="form" enctype = "multipart/form-data">
			<input type="hidden" name="num" id="num" value="${dto.num}">
			<input type="hidden" name="id" id="id" value="${member.id}">
			<textarea name="comment" id="comment" placeholder="해당 맛집에 대한 리뷰를 자세하게 남겨주시면 많은 사람들에게 도움이 될 것 같습니다 :-)"></textarea>
			<span>* 이미지는 최대 4장까지만 등록이 가능합니다.</span><br/>
			<div class="all_input_box">
				<label class="input_file_button_1" for="file_1"><i class="bi bi-plus"></i></label>
				<input type="file" name="file1" id="file_1">
				
				<label class="input_file_button_2" for="file_2"><i class="bi bi-plus"></i></label>
				<input type="file" name="file2" id="file_2">
				
				<label class="input_file_button_3" for="file_3"><i class="bi bi-plus"></i></label>
				<input type="file" name="file3" id="file_3">
				
				<label class="input_file_button_4" for="file_4"><i class="bi bi-plus"></i></label>
				<input type="file" name="file4" id="file_4">
			</div>
			<div class="popup_btn">
				<button type="button" id="btn_suceess">등록</button>
				<button type="button" id="btn_close" onclick="closereviewWritePopup()">취소</button>
			</div>
		</form>
	</div>
</div>
<!-- 리뷰 수정시 팝업! -->
<div id="r_modify_popup" class="hide">
	<div class="content">
		<h3 class="popup_title"><i class="bi bi-chat-right-text"></i>리뷰 수정</h3>
		<p class="popup_text">회원님이 작성한 리뷰를 수정해주세요!</p>
		<form id="form" enctype = "multipart/form-data">
			<input type="hidden" id="idx">
			<textarea name="comment" id="modify_comment"></textarea>
			<span>* 이미지는 최대 4장까지만 등록이 가능합니다.</span><br/>
			<div class="all_input_box">
				<label class="input_file_button_1" for="file_1"><i class="bi bi-plus"></i></label>
				<input type="file" name="file1" id="file_1">
				
				<label class="input_file_button_2" for="file_2"><i class="bi bi-plus"></i></label>
				<input type="file" name="file2" id="file_2">
				
				<label class="input_file_button_3" for="file_3"><i class="bi bi-plus"></i></label>
				<input type="file" name="file3" id="file_3">
				
				<label class="input_file_button_4" for="file_4"><i class="bi bi-plus"></i></label>
				<input type="file" name="file4" id="file_4">
			</div>
			<div class="popup_btn">
				<button type="button" id="btn_modify">수정</button>
				<button type="button" id="btn_close" onclick="closereviewModifyPopup()">취소</button>
			</div>
		</form>
	</div>
</div>
<!-- 삭제 클릭하면 나오는 팝업! -->
<div id="r_del_popup" class="hide">
	<div class="content">
		<h3 class="popup_title"><i class="fa fa-bell-o" aria-hidden="true"></i>삭제 확인</h3>
		<p class="popup_text">
			해당 맛집 리뷰를 삭제하시겠습니까?<br>
			삭제하시면 다시 원복하실 수 없습니다.<br>
		</p>
		<span>※ 신중히 생각하시고 진행부탁드립니다.</span>	
		<input type="hidden" id="idx">
		<div class="popup_btn">
			<button type="button" id="btn_r_del">삭제</button>
			<button type="button" id="btn_close" onclick="closeReviewDelPopup()" >취소</button>
		</div>
	</div>
</div>