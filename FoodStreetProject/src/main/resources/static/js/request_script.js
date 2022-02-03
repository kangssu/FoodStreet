$(document).ready(function(){
	
});
function submitRequest(){
	var name = $('.name_form').val().length;
	var food_store = $('.food_store_form').val().length;
	var place_name = $('.place_name_form').val().length;
	var address2 = $('.address2_form').val().length;
	var food_img = $('.food_img_form').val().length;
	var comment = $('.comment_form').val().length;
	var reason = $('.reason_form').val().length;
		
	if(name == 0){
		alert("이름을 작성해주세요.");
		return false;
	}else if(food_store == 0){
		alert("가게이름을 작성해주세요.");
		return false;
	}else if(place_name == 0){
		alert("지점명을 작성해주세요.");
		return false;
	}else if(address2 == 0){
		alert("주소 검색으로 주소를 입력해주세요.");
		return false;
	}else if(food_img == 0){
		alert("음식 사진을 추가해주세요.");
		return false;
	}else if(comment == 0){
		alert("한줄평을 작성해주세요.");
		return false;
	}else if(reason == 0){
		alert("추천이유를 작성해주세요.")
		return false;
	}else{
		true;
	}
};