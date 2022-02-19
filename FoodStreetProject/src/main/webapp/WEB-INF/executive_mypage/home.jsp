<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="info_content_list">
	<div class="info_content_list_title">
		<h2>스토리 리스트<span>운영진님께서 등록한 스토리 리스트 입니다.</span></h2>
	</div>
	<div class="info_content_all_table">
		<table class="info_list_table">
			<thead>
				<tr>
					<th width="10%">No</th>
					<th width="20%">썸네일</th>
					<th width="40%">제목</th>
					<th width="10%">작성일</th>
					<th width="20%">비고</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${list.size() == 0}">
						<tr>
							<td colspan="8">작성된 스토리가 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="s" items="${list}">
							<tr>
								<td>${no}</td>
								<c:set var="no" value="${no-1}"/>
								<td>
									<c:choose>
									<c:when test="${s.thumbnail != null}">
										<img id="image_section" src="/images/${s.thumbnail}"/>
									</c:when>
									<c:otherwise>
										<img id="image_section" src="/img/no.jpg"/>
									</c:otherwise>
									</c:choose>
								</td>
								<td>${s.title}</td>
								<td><fmt:formatDate value="${s.reporting_date}" pattern="yyyy-MM-dd"/></td>
								<td>
									<button type="button" class="request_view" onclick="location.href='/executive/story/view?num=${s.num}&page=${currentPage}';">수정</button>
									<button type="button" class="request_del" onclick="storyDelPopup(${s.num});">삭제</button>
								</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		<ul class="paging">
			<c:if test="${paging.prev}">
				<li><a href="/mypage/request/list?page=${paging.startPage-1}"><i class="fa fa-angle-left" aria-hidden="true"></i></a></li>
			</c:if>
			<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="num">
				<c:choose>
					<c:when test="${currentPage == num}">
						<li class="active"><a href="/mypage/request/list?page=${num}">${num}</a></li>
					</c:when>
					<c:otherwise>
						<li class="select"><a href="/mypage/request/list?page=${num}">${num}</a></li>
					</c:otherwise>
				</c:choose> 
			</c:forEach>
			<c:if test="${paging.next && paging.endPage>0}">
				<li><a href="/mypage/request/list?page=${paging.endPage+1}"><i class="fa fa-angle-right" aria-hidden="true"></i></a></li>
			</c:if>	
		</ul>
	</div>
</div>
<!-- 삭제 클릭하면 나오는 팝업! -->
<div id="s_del_popup" class="hide">
	<div class="content">
		<h3 class="popup_title"><i class="fa fa-bell-o" aria-hidden="true"></i>삭제 확인</h3>
		<p class="popup_text">
			해당 스토리를 삭제하시겠습니까?<br>
			삭제하시면 다시 원복하실 수 없습니다.<br>
		</p>
		<span>※ 신중히 생각하시고 진행부탁드립니다.</span>	
		<input type="hidden" id="num">
		<div class="popup_btn">
			<button type="button" id="btn_s_del">삭제</button>
			<button type="button" id="btn_close" onclick="closeStoryPopup()" >취소</button>
		</div>
	</div>
</div>