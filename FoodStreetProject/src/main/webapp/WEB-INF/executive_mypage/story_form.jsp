<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="info_content_list">
	<div class="info_content_list_title">
		<h2>스토리 등록<span>운영진님의 소중한 스토리를 작성해주세요.</span></h2>
	</div>
	<div class="from_content_box">
		<form action="/executive/story/success" method="post" enctype="multipart/form-data">
			<input type="hidden" name="id" value="${member.id}"/>
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
								<input type="text" name="title" class="title_form" placeholder="제목을 입력해주세요."/>
							</td>
						</tr>
						<tr>
							<th>내용</th>
							<td colspan="2">
								<textarea id="summernote" name="content"></textarea>
							</td>
						</tr>
						<tr>
							<th>썸네일</th>
							<td>
								<input type="file" name="file" class="thumbnail_form"/>
							</td>
							<td>
								<img id="image_section" src="/img/no.jpg"/>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="form_all_btn">
					<button type="button" onclick="location.href='/executive/mypage';" class="btn_cancle">취소</button>
					<button type="submit" class="btn_confirm">등록하기</button>
				</div>
			</div>
		</form>
	</div>
</div>