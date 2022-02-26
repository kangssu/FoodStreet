<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="info_content_list">
	<div class="info_content_list_title">
		<h2>내가 신청한 맛집<span>${member.name}님께서 신청한 맛집 리스트 입니다.</span></h2>
	</div>
	<div class="info_content_list_title more_button_text">
		<a href="/mypage/request/list">
			<span>더보기<i class="fa fa-angle-right" aria-hidden="true"></i></span>
		</a>
	</div>
	<div class="info_content_all_table">
		<table class="info_list_table">
			<thead>
				<tr>
					<th width="5%">No</th>
					<th width="10%">신청자</th>
					<th width="15%">가게이름</th>
					<th width="10%">지점명</th>
					<th width="20%">주소</th>
					<th width="10%">신청일</th>
					<th width="10%">상태</th>
					<th width="20%">비고</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${list.size() == 0}">
						<tr>
							<td colspan="8">맛집 신청내역이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="r" items="${list}" varStatus="status" begin="0" end="4">
							<tr>
								<td>${status.count}</td>
								<td>${r.name}</td>
								<td>${r.food_store}</td>
								<td>${r.place_name}</td>
								<td>${r.address2}</td>
								<td><fmt:formatDate value="${r.reporting_date}" pattern="yyyy-MM-dd"/></td>
								<td>${r.state}</td>
								<td>
									<button type="button" class="request_view" onclick="location.href='/user/request/view?num=${r.num}';">확인</button>
									<c:choose>
										<c:when test="${r.state == '대기중'}">
											<button type="button" class="request_del" onclick="userRequestDelPopup(${r.num});">삭제</button>
										</c:when>
										<c:otherwise>
											<button type="button" class="request_del_ok" disabled onclick="userRequestDelPopup(${r.num});">삭제</button>
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
	<div class="info_request_delete_warring">
		<span>※ 상태가 대기중인 신청 내역만 삭제 가능합니다.</span>
	</div>
</div>
<div class="info_content_list">
	<div class="info_content_list_title">
		<h2>내가 등록한 리뷰<span>${member.name}님께서 등록한 리뷰 리스트 입니다.</span></h2>
	</div>
	<div class="info_content_list_title more_button_text">
		<a href="/mypage/review/list">
			<span>더보기<i class="fa fa-angle-right" aria-hidden="true"></i></span>
		</a>
	</div>
	<div class="info_content_all_table">
		<table class="info_list_table info_list_table_last">
			<thead>
				<tr>
					<th width="10%">No</th>
					<th width="20%">가게이름</th>
					<th width="10%">지점명</th>
					<th width="30%">내용</th>
					<th width="10%">작성일</th>
					<th width="20%">비고</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${rlist.size() == 0}">
						<tr>
							<td colspan="6">맛집 신청내역이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="rv" items="${rlist}" varStatus="status" begin="0" end="4">
							<tr>
								<td>${status.count}</td>
								<td>${rv.food_store}</td>
								<td>${rv.place_name}</td>
								<td>${rv.comment}</td>
								<td><fmt:formatDate value="${rv.reporting_date}" pattern="yyyy-MM-dd"/></td>
								<td>
									<button type="button" class="request_view food_review_modify" onclick="reviewModifyPopup(${rv.idx});">수정</button>
									<button type="button" class="request_del" onclick="reviewDelPopup(${rv.idx});">삭제</button>
								</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
</div>
<!-- 맛집신청 삭제 클릭하면 나오는 팝업! -->
<div id="u_r_popup" class="hide">
	<div class="content">
		<h3 class="popup_title"><i class="fa fa-bell-o" aria-hidden="true"></i>삭제 확인</h3>
		<p class="popup_text">
			해당 맛집 신청을 삭제하시겠습니까?<br>
			삭제하시면 다시 원복하실 수 없습니다.<br>
		</p>
		<span>※ 신중히 생각하시고 진행부탁드립니다.</span>	
		<input type="hidden" id="num">
		<input type="hidden" id="nowpage">
		<div class="popup_btn">
			<button type="button" id="btn_ok_del">삭제</button>
			<button type="button" id="btn_close" onclick="closeuserRequestPopup()" >취소</button>
		</div>
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
				<label class="input_file_button_1" id="input_file_button_1" for="file_1"><i class="bi bi-plus"></i></label>
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
<div id="img_popup" class="hide">
	<c:forEach var="rv" items="${rlist}" varStatus="status" begin="0" end="4">
		<img src="/images/${rv.img_name1}" class="review_img_one">
		<img src="/images/${rv.img_name2}" class="review_img_two">
		<img src="/images/${rv.img_name3}" class="review_img_three">
		<img src="/images/${rv.img_name4}" class="review_img_four">
	</c:forEach>
</div>