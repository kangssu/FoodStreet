<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=1220">
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
<title>푸드스트릿 : 나만의 맛집 검색!</title>
<!-- 제이쿼리 불러오기 -->
<script src="/js/jquery-3.3.1.min.js"></script>
<!-- slick 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css">
<!-- css, icon 불러오기 -->
<link rel="stylesheet" href="/css/style.css" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
</head>
<body>
	<div class="layout_f">
		<div class="header">
			<tiles:insertAttribute name="header"/>
		</div>
		<div id="food_list_wrap">
			<div class="food_list_all_box container">
				<div class="tab_menu">
					<tiles:insertAttribute name="tab_menu"/>
				</div>
				<div class="main">
					<tiles:insertAttribute name="main"/>
				</div>
			</div>
		</div>
		<div class="footer">
			<tiles:insertAttribute name="footer"/>
		</div>
	</div>
	<!-- 스크립트 불러오기 -->
	<script src="/js/join_script.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src="/js/address_script.js"></script>
	<script src="/js/popup_script.js"></script>
	<script src="/js/request_script.js"></script>
</body>
</html>