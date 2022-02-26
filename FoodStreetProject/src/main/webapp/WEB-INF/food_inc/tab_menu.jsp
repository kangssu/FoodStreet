<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="top_sub_title">
	<h2>맛집리스트</h2>
</div>
<div class="sub_tab_menu">
	<ul class="sub_tab_menu_list">
		<c:choose>
			<c:when test="${category eq '한식'}">
				<li><a href="/food/list">전체보기</a></li>
				<li id="action"><a href="/food/list?category=한식">한식</a></li>
				<li><a href="/food/list?category=양식">양식</a></li>
				<li><a href="/food/list?category=피자">피자</a></li>
				<li><a href="/food/list?category=일식">일식</a></li>
				<li><a href="/food/list?category=중식">중식</a></li>
				<li><a href="/food/list?category=카페">카페</a></li>
				<li><a href="/food/list?category=기타">기타</a></li>
			</c:when>
			<c:when test="${category eq '양식'}">
				<li><a href="/food/list">전체보기</a></li>
				<li><a href="/food/list?category=한식">한식</a></li>
				<li id="action"><a href="/food/list?category=양식">양식</a></li>
				<li><a href="/food/list?category=피자">피자</a></li>
				<li><a href="/food/list?category=일식">일식</a></li>
				<li><a href="/food/list?category=중식">중식</a></li>
				<li><a href="/food/list?category=카페">카페</a></li>
				<li><a href="/food/list?category=기타">기타</a></li>
			</c:when>
			<c:when test="${category eq '피자'}">
				<li><a href="/food/list">전체보기</a></li>
				<li><a href="/food/list?category=한식">한식</a></li>
				<li><a href="/food/list?category=양식">양식</a></li>
				<li id="action"><a href="/food/list?category=피자">피자</a></li>
				<li><a href="/food/list?category=일식">일식</a></li>
				<li><a href="/food/list?category=중식">중식</a></li>
				<li><a href="/food/list?category=카페">카페</a></li>
				<li><a href="/food/list?category=기타">기타</a></li>
			</c:when>
			<c:when test="${category eq '일식'}">
				<li><a href="/food/list">전체보기</a></li>
				<li><a href="/food/list?category=한식">한식</a></li>
				<li><a href="/food/list?category=양식">양식</a></li>
				<li><a href="/food/list?category=피자">피자</a></li>
				<li id="action"><a href="/food/list?category=일식">일식</a></li>
				<li><a href="/food/list?category=중식">중식</a></li>
				<li><a href="/food/list?category=카페">카페</a></li>
				<li><a href="/food/list?category=기타">기타</a></li>
			</c:when>
			<c:when test="${category eq '중식'}">
				<li><a href="/food/list">전체보기</a></li>
				<li><a href="/food/list?category=한식">한식</a></li>
				<li><a href="/food/list?category=양식">양식</a></li>
				<li><a href="/food/list?category=피자">피자</a></li>
				<li><a href="/food/list?category=일식">일식</a></li>
				<li id="action"><a href="/food/list?category=중식">중식</a></li>
				<li><a href="/food/list?category=카페">카페</a></li>
				<li><a href="/food/list?category=기타">기타</a></li>
			</c:when>
			<c:when test="${category eq '카페'}">
				<li><a href="/food/list">전체보기</a></li>
				<li><a href="/food/list?category=한식">한식</a></li>
				<li><a href="/food/list?category=양식">양식</a></li>
				<li><a href="/food/list?category=피자">피자</a></li>
				<li><a href="/food/list?category=일식">일식</a></li>
				<li><a href="/food/list?category=중식">중식</a></li>
				<li id="action"><a href="/food/list?category=카페">카페</a></li>
				<li><a href="/food/list?category=기타">기타</a></li>
			</c:when>
			<c:when test="${category eq '기타'}">
				<li><a href="/food/list">전체보기</a></li>
				<li><a href="/food/list?category=한식">한식</a></li>
				<li><a href="/food/list?category=양식">양식</a></li>
				<li><a href="/food/list?category=피자">피자</a></li>
				<li><a href="/food/list?category=일식">일식</a></li>
				<li><a href="/food/list?category=중식">중식</a></li>
				<li><a href="/food/list?category=카페">카페</a></li>
				<li id="action"><a href="/food/list?category=기타">기타</a></li>
			</c:when>
			<c:otherwise>
				<li id="action"><a href="/food/list">전체보기</a></li>
				<li><a href="/food/list?category=한식">한식</a></li>
				<li><a href="/food/list?category=양식">양식</a></li>
				<li><a href="/food/list?category=피자">피자</a></li>
				<li><a href="/food/list?category=일식">일식</a></li>
				<li><a href="/food/list?category=중식">중식</a></li>
				<li><a href="/food/list?category=카페">카페</a></li>
				<li><a href="/food/list?category=기타">기타</a></li>
			</c:otherwise>
		</c:choose>
	</ul>
</div>