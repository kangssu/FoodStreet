<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="all_food_list">
	<c:choose>
		<c:when test="${list.size() == 0}">
			<div class="food_block_content_not_fount">
				<p>등록된 맛집이 없습니다.</p>
			</div>
		</c:when>
		<c:otherwise>
			<c:forEach var="r" items="${list}">
				<a href="/food/view?num=${r.num}&page=${currentPage}">
					<div class="food_block_content"> 
						<c:forTokens items="${r.img_name}" var="image" varStatus="status" delims=",">
							<c:if test="${status.index eq 0}">
								<img src="/images/${image}">
							</c:if>
						</c:forTokens>
						<div class="food_block_text">
							<h3>${r.food_store}</h3>
							<p>${r.address2}</p>
						</div>
					</div>
				</a>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	<ul class="paging">
			<c:if test="${paging.prev}">
				<li><a href="/food/list?page=${paging.startPage-1}"><i class="fa fa-angle-left" aria-hidden="true"></i></a></li>
			</c:if>
			<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="num">
				<c:choose>
					<c:when test="${currentPage == num}">
						<li class="active"><a href="/food/list?page=${num}">${num}</a></li>
					</c:when>
					<c:otherwise>
						<li class="select"><a href="/food/list?page=${num}">${num}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${paging.next && paging.endPage>0}">
				<li><a href="/food/list?page=${paging.endPage+1}"><i class="fa fa-angle-right" aria-hidden="true"></i></a></li>
			</c:if>	
		</ul>
</div>