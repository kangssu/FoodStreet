<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<link href="//cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css" rel="stylesheet">
<script src="//cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js"></script>
<div class="info_content_list">
	<div class="info_content_list_title">
		<h2>스토리 수정<span>운영진님이 등록한 스토리를 수정할 수 있습니다.</span></h2>
	</div>
	<div class="from_content_box">
		<form action="/executive/story/update" method="post" enctype="multipart/form-data">
			<input type="hidden" name="num" value="${sdto.num}">
			<div class="story_form_content">
				<table class="story_form_tb_all">
					<colgroup>
						<col width="25%">
						<col width="75%">
					</colgroup>
					<tbody>
						<tr>
							<th>제목</th>
							<td colspan="2">
								<input type="text" name="title" class="title_form" placeholder="제목을 입력해주세요."
								value="${sdto.title}"/>
							</td>
						</tr>
						<tr>
							<th>내용</th>
							<td colspan="2">
								<textarea id="summernote" name="content">${sdto.content}</textarea>
							</td>
						</tr>
						<tr>
							<th>썸네일</th>
							<td>
								<input type="file" name="file" class="thumbnail_form"/>
							</td>
							<td>
								<c:choose>
									<c:when test="${sdto.thumbnail != null}">
										<img id="image_section" src="/images/${sdto.thumbnail}"/>
									</c:when>
									<c:otherwise>
										<img id="image_section" src="/img/no.jpg"/>
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="form_all_btn">
					<button type="button" onclick="location.href='/executive/mypage?page=${currentPage}';" class="btn_cancle">취소</button>
					<button type="submit" class="btn_confirm">수정하기</button>
				</div>
			</div>
		</form>
	</div>
</div>