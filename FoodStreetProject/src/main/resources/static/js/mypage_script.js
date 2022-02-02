$(document).ready(function(){
	// 맛집신청 리스트에서 뷰로 이동
	$('.request_view').click(function(){
		var num = $(this).attr('num');
		location.href='/admin/request/view?num=' + num;
	});
	
	// 맛집리스트 등록폼에서 상태 변경
	$('#request_state').change(function(){
		var state = $(this).val();
		$('#state_form').val(state);
	});
});