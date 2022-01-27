$(document).ready(function(){
	// 정규식 변수
	var idJ = /^[a-zA-Z0-9]{4,20}$/;
	var pwJ = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;
	var nameJ = /^[ㄱ-ㅎ가-힣a-z0-9-_]{2,10}$/;
	var nicknameJ = /^[ㄱ-ㅎ가-힣a-z0-9-_]{2,10}$/;
	var emailJ = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+.[A-Za-z]{2,6}$/;
	var hpJ = /^[0-9]*$/;
	
	// 아이디 정규식 체크 및 중복확인
	$('#id_form').on('keyup', function(){
		$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ) );
			
		var id_length = $(this).val().length;
		var id = $('#id_form').val().replace(/\s/gi,'');
			
		if(!idJ.test(id) && id_length >0){
			$('#id_check_tag').text('특수문자를 제외한 2~10자리여야 합니다.');
			$('#id_check_tag').css('color','#F63805');
		} else if(idJ.test(id) && id_length >0){
			$.ajax({
				type: 'post', 
				data: id,
				url: '/idCheck',
				contentType: 'application/json; charset=UTF-8',
				success: function(cnt) { 
					if(cnt > 0) {
						$('#id_check_tag').text('중복된 아이디입니다.');
						$('#id_check_tag').css('color','#F63805');
					} else {
						$('#id_check_tag').text('사용 가능한 아이디입니다.');
						$('#id_check_tag').css('color','#000');
					}     
				}
			});
		} else{
			$('#id_check_tag').text('');
		}
	});
	
	// 비밀번호 정규식 체크
	$('#pw_form').on('keyup',function(){
		var pw_length = $(this).val().length;
		var pw = $(this).val().replace(/\s/gi,'');
		
		if(pwJ.test(pw) && pw_length > 0){
			$('#pw_check_tag').text('안전한 비밀번호입니다.');
			$('#pw_check_tag').css('color','#000');
		} else if(!pwJ.test(pw) && pw_length > 0){
			$('#pw_check_tag').text('숫자+영문자+특수문자 조합으로 8자리 이상 사용해야 합니다.');
			$('#pw_check_tag').css('color','#F63805');
		} else{
			$('#pw_check_tag').text('');
		}
	});
	
	// 비밀번호 일치 확인
	$('#pwcheck_form').on('keyup',function(){
		if($('#pw_form').val() != $(this).val().replace(/\s/gi,'')){
			$('#pwcheck_check_tag').text('일치하지 않습니다.');
			$('#pwcheck_check_tag').css('color','#F63805');
		}else{
			$('#pwcheck_check_tag').text('일치합니다.');
			$('#pwcheck_check_tag').css('color','#000');
		}
	});
	
	// 이름 정규식 체크
	$('#name_form').on('keyup', function(){
		var name_length = $(this).val().length;
		var name = $(this).val().replace(/\s/gi,'');
		
		if(nameJ.test(name) || name_length == 0){
			$('#name_check_tag').text('');
		}else{
			$('#name_check_tag').text('특수문자를 제외한 2~10자리여야 합니다.');
			$('#name_check_tag').css('color','#F63805');
		}
	});
	
	// 닉네임 정규식 체크 및 중복확인
	$('#nickname_form').on('keyup', function(){
		var nickname_length = $(this).val().length;
		var nickname = $(this).val().replace(/\s/gi,'');

		if(!nicknameJ.test(nickname) && nickname_length > 0){
			$('#nickname_check_tag').text('특수문자를 제외한 2~10자리여야 합니다.');
			$('#nickname_check_tag').css('color','#F63805');
		} else if(nicknameJ.test(nickname) && nickname_length > 0){
			$.ajax({
				type: 'post', 
                data: nickname,
                url: '/nicknameCheck',
                contentType: 'application/json; charset=UTF-8',
                success: function(cnt) {   
                    if(cnt > 0) {
                    	$('#nickname_check_tag').text('중복된 닉네임입니다.');
                    	$('#nickname_check_tag').css('color','#F63805');
                    } else {
                    	$('#nickname_check_tag').text('사용 가능한 닉네임입니다.');
                    	$('#nickname_check_tag').css('color','#000');
                    }            
                }
          });
		} else{
			$('#nickname_check_tag').text('');
		}
	});
	
	// 이메일 정규식 체크
	$('#email_form').on('keyup', function(){
		var email_length = $(this).val().length;
		var email = $(this).val().replace(/\s/gi,'');
		
		if(emailJ.test(email) || email_length == 0){
			$('#email_check_tag').text('');
		} else{
			$('#email_check_tag').text('이메일 형식이 올바르지 않습니다.');
			$('#email_check_tag').css('color','#F63805');
		}
	});
	
	// 핸드폰 숫자만 입력
	$('#hp_form').on('keyup', function(){
		$(this).val($(this).val().replace(/[^0-9]/g,""));
	});
	
	// 인증번호
	$('#hp_sms_btn').click(function(){
		var hp = $('#hp_form').val();
		$('#hp_forward_tag').text('인증번호가 전송되었습니다.');
		$('#hp_forward_tag').css('color','#F63805');
		
		$.ajax({
			type: 'post',
			url: '/check/sms',
			data: hp,
			contentType: 'application/json; charset=UTF-8',
			success: function(data){
				$('#hp_check_btn').click(function(){
					if($.trim(data) == $('#hp_check').val()){
						$('#hp_check_tag').text('인증되었습니다.');
						$('#hp_check_tag').css('color','#000');
						$('#hp_forward_tag').text('');
					} else{
						$('#hp_check_tag').text('인증번호가 일치하지 않습니다.');
						$('#hp_check_tag').css('color','#F63805');
						$('#hp_forward_tag').text('');
					}
				});
			}
		});
	});
});

// 인증번호 불일치 및 이미지 업로드 확인
/*function submitCheck(){
	var check_text = $('#hp_check_tag').text();
	var check_text2 = '인증번호가 일치하지 않습니다.';
	
	if ($('#hp_check').val().length == 0){	     
		alert("인증번호를 입력하지 않았습니다.");
		return false;
	} else if(check_text == ''){
		alert('인증확인을 눌러서 인증번호를 확인해주셔야 합니다.');
		return false;
	} else if(check_text == check_text2){
		alert('인증번호가 일치하지 않습니다.');
		return false;
	} else if($('#img_check').val().length == 0){
		alert("이미지를 등록하지 않았습니다.");
		return false;
	} else{
		true;
	}
};*/

// 로그인 아이디 미입력시
function submitLogin(){
	if($('.id_content').val().length==0){
		alert('아이디를 입력해주세요.');
		return false;
	} else{
		true;
	}
};
