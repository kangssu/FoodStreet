<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(document).ready(function(){
		$('.slider-banner-511517418').slick({
			autoplay: true,
			dots: true,
			arrows:false,
			infinite: true,
			autoplaySpeed :5000,
			speed:1500,
			slidesToShow: 1,
			centerMode:false,
			draggable : false
		});
		
		$('.slider-banner-511517419').slick({
			autoplay: true,
			dots: true,
			arrows:false,
			infinite: true,
			speed: 1500,
			slidesToShow: 4,
			slidesToScroll: 4,
		});
		
		/* 슬릭 기본 width css 삭제 */
		$(".review_content_box").css("width","");
	});
</script>
<div id="main_wrap">
	<div class="main_slider container">
		<div class="slick-items slider-banner-511517418">
			<div><img src="/img/main_new2.jpg"></div>
			<div><img src="/img/main_new2.jpg"></div>
			<div><img src="/img/main_new2.jpg"></div>
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
						<a href="#">
							<img src="/img/sushi_new.jpg" alt="스시"/>
							<div class="content_one_box_text">
								<span>일식 BEST 20!</span>
								<p>입에서 녹는 초밥부터 다양한 일식!</p>
							</div>
						</a>
					</li>
					<li>
						<a href="#">
							<img src="/img/pizza3_new.jpg" alt="피자"/>
							<div class="content_one_box_text">
								<span>피자 BEST 20!</span>
								<p>전 세계 다양한 맛집 피자를 맛보세요!</p>
							</div>
						</a>
					</li>
					<li>
						<a href="#">
							<img src="/img/pasta_new.jpg" alt="파스타"/>
							<div class="content_one_box_text">
								<span>양식 BEST 20!</span>
								<p>스타게티 먹고 눈물이 난다는 맛집들!!</p>
							</div>
						</a>
					</li>
					<li>
						<a href="#">
							<img src="/img/brunch_new.jpg" alt="브런치"/>
							<div class="content_one_box_text">
								<span>브런치 BEST 맛집</span>
								<p>오전에 간단하지만 맛있게 먹고 싶을때!</p>
							</div>
						</a>
					</li>
					<li>
						<a href="#">
							<img src="/img/chinese_new.jpg" alt="중식"/>
							<div class="content_one_box_text">
								<span>중식 BEST 20!</span>
								<p>현지에 와있는 느낌이 드는 맛집들 선정!</p>
							</div>
						</a>
					</li>
					<li>
						<a href="#">
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
					<li>
						<a href="#">
							<div class="two_box_img">
								<img src="/img/sushi_new.jpg">
							</div>
							<div class="two_box_text">
								<div class="two_box_nickname_text">
									<img src="/img/noimg.jpg">
									<span>푸드스트릿 에디터</span>
								</div>
								<div class="two_box_content_text">
									<h6>서울 근교 맛집 추천!!!</h6>
									<p>여러분 안녕하세요. 제가 소문을 듣고 서울에서 확인을 하러!
									여러분 안녕하세요. 제가 소문을 듣고 서울에서 확인을 하러!
									여러분 안녕하세요. 제가 소문을 듣고 서울에서 확인을 하러!</p>
								</div>
							</div>
						</a>
					</li>
					<li>
						<a href="#">
							<div class="two_box_img">
								<img src="/img/sushi_new.jpg">
							</div>
							<div class="two_box_text">
								<div class="two_box_nickname_text">
									<img src="/img/noimg.jpg">
									<span>푸드스트릿 에디터</span>
								</div>
								<div class="two_box_content_text">
									<h6>서울 근교 맛집 추천!!!</h6>
									<p>여러분 안녕하세요. 제가 소문을 듣고 서울에서 확인을 하러!
									여러분 안녕하세요. 제가 소문을 듣고 서울에서 확인을 하러!
									여러분 안녕하세요. 제가 소문을 듣고 서울에서 확인을 하러!</p>
								</div>
							</div>
						</a>
					</li>
					<li>
						<a href="#">
							<div class="two_box_img">
								<img src="/img/sushi_new.jpg">
							</div>
							<div class="two_box_text">
								<div class="two_box_nickname_text">
									<img src="/img/noimg.jpg">
									<span>푸드스트릿 에디터</span>
								</div>
								<div class="two_box_content_text">
									<h6>서울 근교 맛집 추천!!!</h6>
									<p>여러분 안녕하세요. 제가 소문을 듣고 서울에서 확인을 하러!
									여러분 안녕하세요. 제가 소문을 듣고 서울에서 확인을 하러!
									여러분 안녕하세요. 제가 소문을 듣고 서울에서 확인을 하러!</p>
								</div>
							</div>
						</a>
					</li>
					<li>
						<a href="#">
							<div class="two_box_img">
								<img src="/img/sushi_new.jpg">
							</div>
							<div class="two_box_text">
								<div class="two_box_nickname_text">
									<img src="/img/noimg.jpg">
									<span>푸드스트릿 에디터</span>
								</div>
								<div class="two_box_content_text">
									<h6>서울 근교 맛집 추천!!!</h6>
									<p>여러분 안녕하세요. 제가 소문을 듣고 서울에서 확인을 하러!
									여러분 안녕하세요. 제가 소문을 듣고 서울에서 확인을 하러!
									여러분 안녕하세요. 제가 소문을 듣고 서울에서 확인을 하러!</p>
								</div>
							</div>
						</a>
					</li>
				</ul>
				<div class="editor_story_more_btn">
					<button type="button" class="more_btn">스토리 더보기</button>
				</div>
			</div>
		</div>
	</div>
	<div class="main_content_three">
		<div class="main_banner container">
			<a href="#"><img src="/img/banner.jpg"></a>
		</div>
	</div>
	<div class="main_content_four">
		<div class="container">
			<div class="content_one_title">
				<h2>맛집 리뷰</h2>
				<p>여러 사람들이 작성한 리얼 리뷰를 확인해보세요!</p>
			</div>
			<div class="main_review_slider slider-banner-511517419">
				<div class="review_content_box">
					<a href="#">
						<div class="four_box_text">
							<div class="four_box_nickname_text">
								<img src="/img/noimg.jpg">
								<span>희수캉</span>
							</div>
							<div class="four_box_content_text">
								<p>제가 먹은 스시중에 최고이면서 시간이 흘러도 여기만 생각날 것 같은 맛집입니다! 다음에 다시 한 번!
								제가 먹은 스시중에 최고이면서 시간이 흘러도 여기만 생각날 것 같은 맛집입니다! 다음에 다시 한 번!
								제가 먹은 스시중에 최고이면서 시간이 흘러도 여기만 생각날 것 같은 맛집입니다! 다음에 다시 한 번!</p>
							</div>
						</div>
					</a>
				</div>
				<div class="review_content_box">
					<a href="#">
						<div class="four_box_text">
							<div class="four_box_nickname_text">
								<img src="/img/noimg.jpg">
								<span>희수캉</span>
							</div>
							<div class="four_box_content_text">
								<p>제가 먹은 스시중에 최고이면서 시간이 흘러도 여기만 생각날 것 같은 맛집입니다! 다음에 다시 한 번!
								제가 먹은 스시중에 최고이면서 시간이 흘러도 여기만 생각날 것 같은 맛집입니다! 다음에 다시 한 번!
								제가 먹은 스시중에 최고이면서 시간이 흘러도 여기만 생각날 것 같은 맛집입니다! 다음에 다시 한 번!</p>
							</div>
						</div>
					</a>
				</div>
				<div class="review_content_box">
					<a href="#">
						<div class="four_box_text">
							<div class="four_box_nickname_text">
								<img src="/img/noimg.jpg">
								<span>희수캉</span>
							</div>
							<div class="four_box_content_text">
								<p>제가 먹은 스시중에 최고이면서 시간이 흘러도 여기만 생각날 것 같은 맛집입니다! 다음에 다시 한 번!
								제가 먹은 스시중에 최고이면서 시간이 흘러도 여기만 생각날 것 같은 맛집입니다! 다음에 다시 한 번!
								제가 먹은 스시중에 최고이면서 시간이 흘러도 여기만 생각날 것 같은 맛집입니다! 다음에 다시 한 번!</p>
							</div>
						</div>
					</a>
				</div>
				<div class="review_content_box">
					<a href="#">
						<div class="four_box_text">
							<div class="four_box_nickname_text">
								<img src="/img/noimg.jpg">
								<span>희수캉</span>
							</div>
							<div class="four_box_content_text">
								<p>제가 먹은 스시중에 최고이면서 시간이 흘러도 여기만 생각날 것 같은 맛집입니다! 다음에 다시 한 번!
								제가 먹은 스시중에 최고이면서 시간이 흘러도 여기만 생각날 것 같은 맛집입니다! 다음에 다시 한 번!
								제가 먹은 스시중에 최고이면서 시간이 흘러도 여기만 생각날 것 같은 맛집입니다! 다음에 다시 한 번!</p>
							</div>
						</div>
					</a>
				</div>
				<div class="review_content_box">
					<a href="#">
						<div class="four_box_text">
							<div class="four_box_nickname_text">
								<img src="/img/noimg.jpg">
								<span>희수캉</span>
							</div>
							<div class="four_box_content_text">
								<p>제가 먹은 스시중에 최고이면서 시간이 흘러도 여기만 생각날 것 같은 맛집입니다! 다음에 다시 한 번!
								제가 먹은 스시중에 최고이면서 시간이 흘러도 여기만 생각날 것 같은 맛집입니다! 다음에 다시 한 번!
								제가 먹은 스시중에 최고이면서 시간이 흘러도 여기만 생각날 것 같은 맛집입니다! 다음에 다시 한 번!</p>
							</div>
						</div>
					</a>
				</div>
			</div>
		</div>
	</div>
</div>