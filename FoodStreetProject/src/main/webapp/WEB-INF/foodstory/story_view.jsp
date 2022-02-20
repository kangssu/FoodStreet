<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div id="foodstory_wrap">
	<div class="foodstory_all_box container">
		<div class="foodstory_view_box">
			<div class="story_top_view_sub_title">
				<h2>${dto.title}</h2>
				<div class="story_editor_info">
					<img src="/images/${dto.img_name}">
					<span>Editor.${dto.nickname}</span>
					<span>Date.<fmt:formatDate value="${dto.reporting_date}" pattern="yyyy-MM-dd"/></span>
				</div>
			</div>
			<div class="story_top_view_content">
				<p>${dto.content}</p>
			</div>
			<div class="story_detail_back_btn">
				<button type="button" onclick="location.href='/foodstory/list';">목록</button>
			</div>
		</div>
	</div>
</div>