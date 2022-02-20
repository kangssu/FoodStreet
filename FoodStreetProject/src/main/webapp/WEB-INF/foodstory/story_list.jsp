<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div id="foodstory_wrap">
	<div class="foodstory_all_box container">
		<div class="story_top_sub_title">
			<h2>푸드스토리</h2>
		</div>
		<div id="story_all_list">
			<c:forEach var="s" items="${list}">
				<div class="story_box">
					<a href="/foodstory/view?num=${s.num}">
						<img src="/images/${s.thumbnail}">
						<div class="story_hover_text story_hover_text_fade">
							<div class="text_date"><fmt:formatDate value="${s.reporting_date}" pattern="yyyy-MM-dd"/></div>
							<div class="text">${s.title}</div>
						</div>
					</a>
				</div>
			</c:forEach>
		</div>
	</div>
</div>