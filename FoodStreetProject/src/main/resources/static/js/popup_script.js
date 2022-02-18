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

/* 리뷰 창에서 이미지 클릭시 이벤트 */
$(document).ready(function(){
	$('#file_1').change(function(){
		var img = URL.createObjectURL(event.target.files[0]);
		$('.input_file_button_1').html('<img src="'+img+'" alt="img" class="img_view1">'+
		'<button type="button" class="input_file_close_btn_1"><i class="bi bi-x-circle-fill"></i></button>');
	});
	
	$('#file_2').change(function(){
		var img = URL.createObjectURL(event.target.files[0]);
		$('.input_file_button_2').html('<img src="'+img+'" alt="img" class="img_view2">'+
		'<button type="button" class="input_file_close_btn_2"><i class="bi bi-x-circle-fill"></i></button>');
	});
	
	$('#file_3').change(function(){
		var img = URL.createObjectURL(event.target.files[0]);
		$('.input_file_button_3').html('<img src="'+img+'" alt="img" class="img_view3">'+
		'<button type="button" class="input_file_close_btn_3"><i class="bi bi-x-circle-fill"></i></button>');
	});
	
	$('#file_4').change(function(){
		var img = URL.createObjectURL(event.target.files[0]);
		$('.input_file_button_4').html('<img src="'+img+'" alt="img" class="img_view4">'+
		'<button type="button" class="input_file_close_btn_4"><i class="bi bi-x-circle-fill"></i></button>');
	});
	
	$(document).on("click",".input_file_close_btn_1",function(){
		$('.input_file_button_1 img').remove();
		$('.input_file_button_1').html('<i class="bi bi-plus"></i>');
		var img_confirm= $('.review_img_one').attr("src").length;
		var img_back = $('.review_img_one').attr("src").replace('/images/', '');
		var idx = $("#idx").val();
		if(img_confirm > 0){
			$.ajax({
				type: 'post',
				url: '/review/img/delete',
				data: {"img_back":img_back,"idx":idx},
				dataType: 'text',
				success: function(){
					console.log("삭제");
				}
			});
		}
	});
	
	$(document).on("click",".input_file_close_btn_2",function(){
		$('.input_file_button_2 img').remove();
		$('.input_file_button_2').html('<i class="bi bi-plus"></i>');
		var img_confirm= $('.review_img_two').attr("src").length;
		var img_back = $('.review_img_two').attr("src").replace('/images/', '');
		var idx = $("#idx").val();
		if(img_confirm > 0){
			$.ajax({
				type: 'post',
				url: '/review/img/delete',
				data: {"img_back":img_back,"idx":idx},
				dataType: 'text',
				success: function(){
					console.log("삭제");
				}
			});
		}
	});
	
	$(document).on("click",".input_file_close_btn_3",function(){
		$('.input_file_button_3 img').remove();
		$('.input_file_button_3').html('<i class="bi bi-plus"></i>');
		var img_confirm= $('.review_img_three').attr("src").length;
		var img_back = $('.review_img_three').attr("src").replace('/images/', '');
		var idx = $("#idx").val();
		if(img_confirm > 0){
			$.ajax({
				type: 'post',
				url: '/review/img/delete',
				data: {"img_back":img_back,"idx":idx},
				dataType: 'text',
				success: function(){
					console.log("삭제");
				}
			});
		}
	});
	
	$(document).on("click",".input_file_close_btn_4",function(){
		$('.input_file_button_4 img').remove();
		$('.input_file_button_4').html('<i class="bi bi-plus"></i>');
		var img_confirm= $('.review_img_four').attr("src").length;
		var img_back = $('.review_img_four').attr("src").replace('/images/', '');
		var idx = $("#idx").val();
		if(img_confirm > 0){
			$.ajax({
				type: 'post',
				url: '/review/img/delete',
				data: {"img_back":img_back,"idx":idx},
				dataType: 'text',
				success: function(){
					console.log("삭제");
				}
			});
		}
	});
});

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
		
		if($('#file_1')[0].files.length == 1){
			formData.append('file1', $('#file_1')[0].files[0]);
		}else if($('#file_2')[0].files.length == 1){
			formData.append('file2', $('#file_2')[0].files[0]);
		}else if($('#file_3')[0].files.length == 1){
			formData.append('file3', $('#file_3')[0].files[0]);
		}else if($('#file_4')[0].files.length == 1){
			formData.append('file4', $('#file_4')[0].files[0]);
		}

		formData.append('key', new Blob([JSON.stringify(data)] , {type: "application/json"}));
		
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

/* 리뷰 수정 클릭시 팝업! */
function reviewModifyPopup(idx) {
	const popup2 = document.querySelector('#r_modify_popup');
	popup2.classList.remove('hide');
	
	$("#idx").val(idx);
	var idx = $("#idx").val();
	
	$(document).on('click','.food_review_modify',function(){
		$.ajax({
			type: 'get',
			url: '/review/detail',
			data: {"idx":idx},
			contentType: 'application/json; charset=UTF-8',
			success: function(data){
				$("#modify_comment").val(data.comment);
				
				if(data.img_name1 != null){
					$('.input_file_button_1').html('<img src="/images/'+data.img_name1+'" alt="img" class="img_view1">'+
					'<button type="button" class="input_file_close_btn_1"><i class="bi bi-x-circle-fill"></i></button>');
				}

				if(data.img_name2 != null){
					$('.input_file_button_2').html('<img src="/images/'+data.img_name2+'" alt="img" class="img_view2">'+
					'<button type="button" class="input_file_close_btn_2"><i class="bi bi-x-circle-fill"></i></button>');
				}
				
				if(data.img_name3 != null){
					$('.input_file_button_3').html('<img src="/images/'+data.img_name3+'" alt="img" class="img_view3">'+
					'<button type="button" class="input_file_close_btn_3"><i class="bi bi-x-circle-fill"></i></button>');
				}
				
				if(data.img_name4 != null){
					$('.input_file_button_4').html('<img src="/images/'+data.img_name4+'" alt="img" class="img_view4">'+
					'<button type="button" class="input_file_close_btn_4"><i class="bi bi-x-circle-fill"></i></button>');
				}
				
				if(data.img_name1 == "" || data.img_name2 == "" || data.img_name3 == "" || data.img_name4 == ""){
					$('.input_file_button_1').html('<i class="bi bi-plus"></i>');
				}
				
			}
		});
	});
	
	$(document).on('click','#btn_modify',function(){
		var data = {
			idx: $("#idx").val(),
			comment: $("#modify_comment").val()
		};
		
		var form =$('#form')[0]; //첫번째 폼을 의미함
		var formData = new FormData(form);
		
		if($('#file_1')[0].files.length == 1){
			formData.append('file1', $('#file_1')[0].files[0]);
		}else if($('#file_2')[0].files.length == 1){
			formData.append('file2', $('#file_2')[0].files[0]);
		}else if($('#file_3')[0].files.length == 1){
			formData.append('file3', $('#file_3')[0].files[0]);
		}else if($('#file_4')[0].files.length == 1){
			formData.append('file4', $('#file_4')[0].files[0]);
		}

		formData.append('key', new Blob([JSON.stringify(data)] , {type: "application/json"}));
		
		$.ajax({
			type: 'post',
			url: '/review/update',
			processData: false,
            contentType:false,
            data: formData,
			success: function(){
				alert("소중한 회원님의 리뷰가 수정되었습니다!");
				location.reload();
			}
		});
		
	});
}
	
function closereviewModifyPopup() {
	location.reload();
	const popup2 = document.querySelector('#r_modify_popup');
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