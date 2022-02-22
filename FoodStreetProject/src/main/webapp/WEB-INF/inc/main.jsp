<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div id="main_wrap">
	<div class="main_slider container">
		<div class="slick-items slider-banner-511517418">
			<div><img src="/img/main_new3.png"></div>
			<div><img src="/img/main_new3.png"></div>
			<div><img src="/img/main_new3.png"></div>
		</div>
	</div>
	<div class="main_content_one">
		<div class="container">
			<div class="content_one_title">
				<h2>BEST 맛집 구경하기</h2>
				<p>원하는 카테고리를 선택하여 다양한 맛집을 구경해보세요!</p>
			</div>
			<div class="content_one_box">
				<ul>
					<li>
						<a href="/food/list?category=일식">
							<img src="/img/sushi_new.jpg" alt="스시"/>
							<div class="content_one_box_text">
								<span>일식 BEST 20!</span>
								<p>입에서 녹는 초밥부터 다양한 일식!</p>
							</div>
						</a>
					</li>
					<li>
						<a href="/food/list?category=피자">
							<img src="/img/pizza3_new.jpg" alt="피자"/>
							<div class="content_one_box_text">
								<span>피자 BEST 20!</span>
								<p>전 세계 다양한 맛집 피자를 맛보세요!</p>
							</div>
						</a>
					</li>
					<li>
						<a href="/food/list?category=양식">
							<img src="/img/pasta_new.jpg" alt="양식"/>
							<div class="content_one_box_text">
								<span>양식 BEST 20!</span>
								<p>스타게티 먹고 눈물이 난다는 맛집들!!</p>
							</div>
						</a>
					</li>
					<li>
						<a href="/food/list?category=브런치">
							<img src="/img/brunch_new.jpg" alt="브런치"/>
							<div class="content_one_box_text">
								<span>브런치 BEST 맛집</span>
								<p>오전에 간단하지만 맛있게 먹고 싶을때!</p>
							</div>
						</a>
					</li>
					<li>
						<a href="/food/list?category=중식">
							<img src="/img/chinese_new.jpg" alt="중식"/>
							<div class="content_one_box_text">
								<span>중식 BEST 20!</span>
								<p>현지에 와있는 느낌이 드는 맛집들 선정!</p>
							</div>
						</a>
					</li>
					<li>
						<a href="/food/list?category=디저트">
							<img src="/img/pancakes_new.jpg" alt="디저트"/>
							<div class="content_one_box_text">
								<span>카페 BEST 20!</span>
								<p>밥먹고 후식은 무조건! 코리안 디저트!</p>
							</div>
						</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="main_content_two">
		<div class="container">
			<div class="content_one_title">
				<h2>맛집 스토리</h2>
				<p>푸드스트릿 에디터가 작성한 리얼 스토리를 확인해보세요!</p>
			</div>
			<div class="content_two_box">
				<ul>
					<c:forEach var="s" items="${list}" begin="0" end="3">
						<li>
							<a href="#">
								<div class="two_box_img">
									<img src="/images/${s.thumbnail}">
								</div>
								<div class="two_box_text">
									<div class="two_box_nickname_text">
										<img src="/img/noimg.png">
										<span>Editor.${s.nickname}</span>
									</div>
									<div class="two_box_content_text">
										<h6>${s.title}</h6>
										${s.content}
									</div>
								</div>
							</a>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	<div class="main_content_three">
		<div class="main_banner container">
			<a href="/request"><img src="/img/banner.jpg"></a>
		</div>
	</div>
</div>