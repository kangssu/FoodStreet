/* 관리자 맛집신청 내역 삭제하기 클릭시 팝업 */
function showDelPopup(num) {
	$("#num").val(num);
	
	const popup2 = document.querySelector('#popup');
	popup2.classList.remove('hide');
		
	$("#btn_ok_del").click(function(){
		var num = $("#num").val();
		
		$.ajax({
			type: 'post',
			url: '/request/delete',
			data: num,
			contentType: 'application/json; charset=UTF-8',
			success: function(){
				location.reload();
			}
		});
	});
}

function closeDelPopup() {
	const popup2 = document.querySelector('#popup');
	popup2.classList.add('hide');
}

/* 관리자 운영진 계정 삭제하기 클릭시 팝업 */
function executiveDelPopup(num) {
	$("#num").val(num);
	
	const popup2 = document.querySelector('#popup_e');
	popup2.classList.remove('hide');
		
	$("#btn_e_del").click(function(){
		var num = $("#num").val();
		
		$.ajax({
			type: 'post',
			url: '/executive/delete',
			data: num,
			contentType: 'application/json; charset=UTF-8',
			success: function(){
				location.reload();
			}
		});
	});
}
	
function closeExecutivePopup() {
	const popup2 = document.querySelector('#popup_e');
	popup2.classList.add('hide');
}

/* 회원 맛집신청 삭제하기 버튼 클릭시 팝업 */
function userRequestDelPopup(num) {
	$("#num").val(num);
	
	const popup2 = document.querySelector('#u_r_popup');
	popup2.classList.remove('hide');
		
	$("#btn_ok_del").click(function(){
		var num = $("#num").val();
		
		$.ajax({
			type: 'post',
			url: '/user/request/delete',
			data: num,
			contentType: 'application/json; charset=UTF-8',
			success: function(){
				location.reload();
			}
		});
	});
}
	
function closeuserRequestPopup() {
	const popup2 = document.querySelector('#u_r_popup');
	popup2.classList.add('hide');
}

/*  리뷰쓰기 클릭시 로그인 안했을 경우 나오는 팝업! */
function reviewPopup() {
	const popup2 = document.querySelector('#review_popup');
	popup2.classList.remove('hide');
}
	
function closereviewPopup() {
	const popup2 = document.querySelector('#review_popup');
	popup2.classList.add('hide');
}

/* 리뷰쓰기 클릭시 로그인 했을 경우 나오는 팝업! */
function reviewWritePopup() {
	
	const popup2 = document.querySelector('#r_write_popup');
	popup2.classList.remove('hide');
	
		
	$("#btn_suceess").click(function(){
		var data = {
			num: $("#num").val(),
			id: $("#id").val(),
			comment: $("#comment").val()
		};
		
		var form =$('#form')[0]; //첫번째 폼을 의미함
		var formData = new FormData(form);
		var img_size = $('#file')[0].files.length;
		
		if(img_size > 4){
			alert("이미지는 4장까지 등록 가능합니다! 다시 선택해주세요!");
			return;
		}
		
		formData.append('key', new Blob([JSON.stringify(data)] , {type: "application/json"}));
		
		for(var i=0; i<$('#file')[0].files.length; i++){
			formData.append('file', $('#file')[0].files[i]);
		}
		
		$.ajax({
			type: 'post',
			url: '/review/insert',
			processData: false,
            contentType:false,
            data: formData,
			success: function(){
				alert("소중한 회원님의 리뷰가 등록되었습니다!");
				location.reload();
			}
		});
	});
}
	
function closereviewWritePopup() {
	const popup2 = document.querySelector('#r_write_popup');
	popup2.classList.add('hide');
}

/* 맛집 리뷰 삭제할 때 나오는 팝업 */
function reviewDelPopup(idx) {
	$("#idx").val(idx);
	
	const popup2 = document.querySelector('#r_del_popup');
	popup2.classList.remove('hide');
		
	$("#btn_r_del").click(function(){
		var idx = $("#idx").val();
		
		$.ajax({
			type: 'post',
			url: '/review/delete',
			data: idx,
			contentType: 'application/json; charset=UTF-8',
			success: function(){
				location.reload();
			}
		});
	});
}
	
function closeReviewDelPopup() {
	const popup2 = document.querySelector('#r_del_popup');
	popup2.classList.add('hide');
}