$(document).ready(function(){
	// 아이디 중복확인
	$("#name_form").on('keyup', function(){
		$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ) );
			
		var name_length = $(this).val().length;
		var id = $('#name_form').val().replace(/\s/gi, "");
			
		if(name_length>0){
			$.ajax({
				type: "post", 
				data: id,
				url: "/idCheck",
				contentType: "application/json; charset=UTF-8",
				success: function(cnt) { 
					if(cnt > 0) {
						$("#id_check_tag").html("<p>중복된 아이디입니다.</p>");
					} else {
						$("#id_check_tag").html("<p>사용 가능한 아이디입니다.</p>");
					}     
				}
			});
		}else{
			$("#id_check_tag").html("");
		}
	});
		
	// 닉네임 중복확인
	$("#nickname_form").on('keyup', function(){
		var nickname_length = $(this).val().length;
		var nickname = $(this).val();

		if(nickname_length>0){
			$.ajax({
				type: "post", 
                data: nickname,
                url: "/nicknameCheck",
                contentType: "application/json; charset=UTF-8",
                success: function(cnt) {   
                    if(cnt > 0) {
                    	$("#nickname_check_tag").html("<p>중복된 닉네임입니다.</p>");
                    } else {
                    	$("#nickname_check_tag").html("<p>사용 가능한 닉네임입니다.</p>");
                    }            
                }
            });
		}else{
			$("#nickname_check_tag").html("");
		}
	});
});