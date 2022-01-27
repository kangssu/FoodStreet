<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="wrap">
	<div id="header_wrap">
		<div class="header_banner">
			<a href="#" >나만 알고 있는 소중한 맛집을 공유해주세요!<i class="fa fa-angle-right" aria-hidden="true"></i></a>
		</div>
		<div class="header container">
			<div class="main_logo">
				<a href="/">FOODSTREET</a>
			</div>
			<div class="main_menu_left">
        		<ul class="gnb">
        			<li><a href="#">맛집리스트</a></li>
        			<li><a href="#">스토리</a></li>
        			<li><a href="#">리뷰</a></li>
        			<li><a href="/request">맛집신청</a></li>
        		</ul>
        	</div>
        	<div class="main_menu_right">
        		<div class="search">
					<div class="top_search_box">
                		<div class="top_search_text">
        					<form name="" action="" method="get">
								<input type="text" id="search_form" name="keyword" 
								class="top_search_text_box" placeholder="맛집을 검색해주세요."/>
								<button type="submit" class="search_btn"><i class="fa fa-search" aria-hidden="true"></i></button>
        					</form>
						</div>
					</div>
        		</div>
				<ul class="info_menu">
					<c:choose>
						<c:when test="${member != null || user != null}">
		            		<li><a href="/logout/success"><i class="fa fa-user" aria-hidden="true"></i>로그아웃</a></li>
							<li><a href="#"><i class="fa fa-pencil-square-o" aria-hidden="true"></i>마이페이지</a></li>
		            	</c:when>
		            	<c:otherwise>
		            		<li><a href="/login"><i class="fa fa-user" aria-hidden="true"></i>로그인</a></li>
		            		<li><a href="/join"><i class="fa fa-pencil-square-o" aria-hidden="true"></i>회원가입</a></li>
		            	</c:otherwise>
		            </c:choose>
	           	</ul>
            </div>	
        </div>
	</div>
</div>
