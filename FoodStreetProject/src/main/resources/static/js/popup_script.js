/* 삭제하기 클릭시 팝업 */
function showDelPopup(num) {
	$("#delnum").val(num);
	
	const popup2 = document.querySelector('#popup');
	popup2.classList.remove('hide');
		
	$("#btn_ok_del").click(function(){
		var num = $("#delnum").val();
		
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


function executiveDelPopup(num) {
	$("#delnum").val(num);
	
	const popup2 = document.querySelector('#popup_e');
	popup2.classList.remove('hide');
		
	$("#btn_e_del").click(function(){
		var num = $("#delnum").val();
		
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