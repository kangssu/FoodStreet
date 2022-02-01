$(document).ready(function(){
	$('.request_view').click(function(){
		var num = $(this).attr('num');
		location.href='/admin/request/view?num=' + num;
	});
});