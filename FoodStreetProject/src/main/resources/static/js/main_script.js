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