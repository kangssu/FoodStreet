# [개인 프로젝트] FOODSTREET - 푸드스트릿 :hamburger::pizza::beers:
### 💡 프로젝트 기간 : 2022.01.05 ~ 2022.02.22 (총 49일 동안 진행)
### 🌐 [푸드스트릿 바로가기](http://3.38.239.209:9002/)
* **"여러 사람들이 알고 있는 맛집들을 자신만 아는게 아닌 서로 공유할 방법이 없을까?"**
* **"맛집 공유를 하더라도 사이트의 의도와 맞지 않는 게시글은 제외시키는게 낫지 않을까?"**
* 이런 물음들에 대해 100% 딱 맞는 사이트로 만든 것이 바로 **푸드스트릿** 입니다!
* **푸드스트릿을 통해 혼자만 알고 있는 맛집을 여러 사람들과 함께 공유해보세요!**

<br/>

## 1. 개발환경
### Frontend Stack
<p>
  <img src="https://img.shields.io/badge/html5-E34F26?style=for-the-badge&logo=html5&logoColor=white"> 
  <img src="https://img.shields.io/badge/css-1572B6?style=for-the-badge&logo=css3&logoColor=white"> 
  <img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black"> 
  <img src="https://img.shields.io/badge/jquery-0769AD?style=for-the-badge&logo=jquery&logoColor=white">
  <img src="https://img.shields.io/badge/fontawesome-339AF0?style=for-the-badge&logo=fontawesome&logoColor=white">
</p>

### Backend Stack
<p>
  <img src="https://img.shields.io/badge/java 11-007396?style=for-the-badge&logo=java&logoColor=white"> 
  <img src="https://img.shields.io/badge/springboot-6DB33F?style=for-the-badge&logo=springboot&logoColor=white">
  <img src="https://img.shields.io/badge/mysql-4479A1?style=for-the-badge&logo=mysql&logoColor=white">
</p>

### Deploy Stack
<p>
  <img src="https://img.shields.io/badge/amazonaws-232F3E?style=for-the-badge&logo=amazonaws&logoColor=white">
  <img src="https://img.shields.io/badge/linux-FCC624?style=for-the-badge&logo=linux&logoColor=black">
  <img src="https://img.shields.io/badge/apache tomcat-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=white">
</p>

### Version Control
<p>
  <img src="https://img.shields.io/badge/github-181717?style=for-the-badge&logo=github&logoColor=white">
  <img src="https://img.shields.io/badge/git-F05032?style=for-the-badge&logo=git&logoColor=white">
</p>
<br/>

## 2. ERD 설계
![ERD](https://user-images.githubusercontent.com/83870420/160884722-e48fb31c-2e78-47a0-b2e4-412b5674283d.png)

## 3. 기능구현

* 회원가입
  * 모든 항목 Javascript(Front) + Validation(Back) 유효성 검사
  * 아이디, 닉네임 중복체크 (중복 값 등록 불가능)
  * 패스워드 BCrypt 암호화 처리 (패스워드 불일치 시 등록 불가능)
  * 핸드폰 인증 (collsms 사용 - 입력한 핸드폰으로 인증번호 문자 전송 + 인증번호 일치 여부 확인)

* 로그인
  * 일반 로그인 (회원가입을 통한 계정)
  * 소셜 로그인 연동(구글)

* 관리자, 운영진, 회원 마이페이지
  * <code>관리자</code> 회원,비회원들이 맛집 신청하면 신청내역 확인, 삭제 및 맛집리스트로 업로드 가능
  * <code>관리자</code> 운영진 계정 생성, 수정, 삭제 가능
  * <code>운영진</code> 자신의 회원정보 수정 가능
  * <code>운영진</code> 푸드스토리 리스트 확인, 등록, 수정, 삭제 가능 (Summernote editor 사용)
  * <code>회원</code> 자신의 회원정보 수정 가능
  * <code>회원</code> 자신이 신청한 신청내역 확인, 삭제 가능
  * <code>회원</code> 자신이 등록한 리뷰 리스트 확인, 수정, 삭제 가능

* 맛집리스트
  * 맛집리스트 카테고리별 출력
  * 관리자가 맛집으로 등록한 맛집들만 리스트 및 상세 페이지 출력
  * 상세 페이지에서 네이버 Geocoding API 적용하여 맛집 위치 출력 
  * 회원들이 맛집리스트로 등록된 맛집들에 직접 리뷰 등록, 수정, 삭제 가능
  
* 푸드스토리
  * 운영진이 등록한 스토리 리스트 및 상세 페이지 출력

* 맛집신청
  * 회원, 비회원 상관없이 맛집신청 가능
  * 다음 주소찾기 API 연동

* AWS Linux 서버 배포

<br/>

## 4. 트러블 슈팅

### 📌 아이디 + 닉네임 중복, 패스워드 불일치 확인 로직
스프링에서 제공하는 @Valid 어노테이션으로 간단하게 유효성 검사가 끝난 줄 알았지만,<br/>
아이디 중복, 닉네임 중복, 패스워드 불일치여도 DB로 값이 저장되어버렸다.

이렇게 만들면 안되겠다는 생각에 구글링에 많은 시간을 투자했었고 1차, 2차 해결방안으로 진행했었다.

* 1차 해결 방안 : Exception 처리를 했지만, 오류 페이지로 인한 좋지 않은 페이지가 되어버렸다.<br/>
* 2차 해결 방안 : 추상메서드를 생성 후 검증 클래스들로 중복되거나 불일치면 문구 표시와 가입 불가능하게 처리했다.

**단순하게 생각하면 그만큼 허점이 많은 사이트가 되기 때문에 여러번을 더 생각했고 그 생각들로 조금 더 탄탄한 로직이 된 것 같다.**

### 📌 스프링 시큐리티 소셜 로그인
스프링 시큐리티 설정을 추가하고 삭제하다가 갑자기 안 나오던 403에러가 발생하게 되었다.

구글링을 통해서 나와 동일한 에러가 발생한 게시글에서 .csrf().disable() 이 속성을 주면 해결된다고 한다.<br/>
다시 해당 속성을 추가하니까 작동이 잘 되었고 해당 속성들을 모르고 삭제했던게 403에러를 불러온 것 같다.

오류는 해결했지만 해당 속성에 대한 궁금증이 생겨서 .csrf()로 검색을 해봤고,<br/>
스프링 시큐리티의 어노테이션인 @EnableWebSecurity은 CSRF 공격을 방지하는 기능이 있기 때문에<br/>
.csrf().disable()로 CSRF 속성을 해지하지 않으면 데이터 변조가 가능한 POST, PUT 등의 메서드 코드가 작동되지 않는다고 한다.

```
When to use CSRF protection
Our recommendation is to use CSRF protection for any request that could be processed by a browser by normal users. 
If you are only creating a service that is used by non-browser clients, you will likely want to disable CSRF protection.
```
📚 [Spring Security Reference 바로가기](https://docs.spring.io/spring-security/site/docs/5.3.x/reference/html5/#csrf)

그럼 CSRF를 비활성화 해버리면 보안에 취약해 지는거 아닌가?에 대해서 또 다시 궁금증이 생겼고,<br/>
이에 대한 해답도 구글링을 통해 찾게 되었다.

REST API는 HTTP 형식을 따르기 때문에 무상태로 서버쪽의 세션이나 브라우저 쿠키에 의존하지 않는다고 한다.<br/>
CSRF는 REST API의 조건에는 관련이 없기 때문에 공격을 받을 가능성이 존재하지 않을 것이라는 판단으로 비활성화 한다고 한다.

**스프링 시큐리티 설정을 이해없이 복붙하여 사용했을 때의 오류였기 때문에 이후에는 설정을 전부 다 찾아보고 필요한 것들만 적용했다.**

### 📌 Ajax 파일 전송
리뷰를 등록할 때 내용뿐만 아니라 이미지들까지 전송하려고 하면 Ajax가 동작하지 않았고<br/>
생각해보니 Ajax를 사용할 때 항상 문자들만 전송했었는데 이미지 파일까지 ajax로 해본 적은 없었다.

Ajax로 이미지 전송 관련하여 구글링을 통해서 찾는 해답으로는 파일 전송 시 processData: false, contentType:false  추가해줘야 했다.<br/>
또한 form 태그를 추가하여 formData를 사용해야 formData.append를 통해 내용과 파일을 같이 보낼 수 있었다.

우선 단일 파일로 성공했고 다중 파일일 경우에는 for 문을 사용하여 성공을 할 수 있었다.<br/>
필요했던 부분은 단일 파일로 4개의 파일을 전송하는 것으로 단일과 다중을 해보니까 쉽게 성공했다.

<details>
  <summary><b>✔️ 단일 파일 전송 스크립트 코드 확인하기</b></summary>
  <div markdown="1">    
    
```
$("#btn_suceess").click(function(){
  var data = {
    num: $('#num').val(),
    id: $('#id').val(),
    comment: $('#comment').val()
  };
  
  var form =$('#form')[0];
  var formData = new FormData(form);
  
  formData.append('file', $('#file'));
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
```
  </div>
</details>

<details>
  <summary><b>✔️ 다중 파일 전송 스크립트 코드 확인하기</b></summary>
  <div markdown="1">    
  
```
$("#btn_suceess").click(function(){
  var data = {
    num: $("#num").val(),
    id: $("#id").val(),
    comment: $("#comment").val()
  };
		
  var form =$('#form')[0]; 
  var formData = new FormData(form); 

  for(var i=0; i<$('#file')[0].files.length; i++){
    formData.append('file', $('#file')[0].files[i]);
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
```
  </div>
</details>

<details>
  <summary><b>✔️ 단일 파일 4개 전송 스크립트 코드 확인하기</b></summary>
  <div markdown="1">    
  
```
$("#btn_suceess").click(function(){
  var data = {
    num: $("#num").val(),
    id: $("#id").val(),
    comment: $("#comment").val()
  };
		
  var form =$('#form')[0]; 
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
```
  </div>
</details>

**Ajax로 이미지 전송 방법을 통해 기존에 몰랐던 옵션들과 자바스크립트 객체를 알게 되어서 Ajax에 대해 조금 더 공부하게 된 계기가 되었다.**

### 📌 생성자 주입 순환 참조 오류
생성자 주입방식으로 동일한 객체를 생성했다가 일반 회원가입과 소셜 회원가입 클래스에서 오류가 발생했다.<br/>
The dependencies of the beans in the application context form a cycle 오류 메시지가 순환참조 오류라는 것을 알게 되었다.
	
임시 해결 방법인 @Lazy 어노테이션을 추가하면 모든 빈을 처음 초기화 시에 만들지 않고 빈을 가져오는 시점에 생성하여 해결할 수 있었다.<br/>
다만 스프링에서 권장하지 않는 방법이라는 것을 아래 스프링부트 문서를 통해 알게 되었고 사용하지 않기로 했다.<br/>
```
A downside of lazy initialization is that it can delay the discovery of a problem with the application. If a misconfigured bean is initialized<br/>
lazily, a failure will no longer occur during startup and the problem will only become apparent when the bean is initialized. Care must<br/>
also be taken to ensure that the JVM has sufficient memory to accommodate all of the application’s beans and not just those that are<br/>
initialized during startup. For these reasons, lazy initialization is not enabled by default and it is recommended that fine-tuning of the<br/>
JVM’s heap size is done before enabling lazy initialization.
```
📚 [Spring boot Core Features 바로가기](https://docs.spring.io/spring-boot/docs/current/reference/html/features.html#features.spring-application.lazy-initialization)

결국 @Lazy 어노테이션을 지우고 A, B로 아예 분리된 상태로 클래스를 만들어서 일반 회원가입은 A 생성자 주입, 소셜 회원가입은 B 생성자 주입으로 해결하게 되었다.

**생성자 주입의 순환 참조 오류에 대해 알고 있었지만 직접 경험하면서 왜 발생하는지를 좀 더 명확하게 알게 된 계기였다.**

### 📌 AWS Linux 서버에서 POST 요청 시 500 에러
로컬에서는 잘되던 회원가입, 맛집신청 페이지가 리눅스 서버에서는 정보 기재 후 등록하기를 하면 전부 500 에러가 발생했다.<br/>
AWS Linux 서버로 에러 확인하는 방법을 몰라서 예측하면서 해도 절대 해결이 되지 않았고 에러 메시지를 확인해야 할 것 같았다.
	
구글링을 통해 톰캣 실행 후 아래 명령어를 입력하면 실시간으로 에러 메시지가 노출될 수 있다고 해서 바로 적용했다.
```
tail -f /home/tomcat/apache-tomcat-9.0.58/logs/catalina.out
```
	
확인해본 결과 이미지를 저장할 저장소를 찾을 수 없다는 에러 메시지를 확인했고 이미지 저장 경로를 수정해서 해결했다.

**500 에러를 예측으로만 해결하기엔 막막했지만 로컬처럼 리눅스 서버에서도 에러 코드를 확인할 수 있는 방법을 알게 된 계기였다.**
	
<br/>

## 5. 테스트 후 보완사항
푸드스프릿 웹 사이트 제작 완료 후 지인들의 테스트로 아래 피드백을 수렴하여 재배포했다.
* - [x] ~~회원가입 시 이미지 필수항목 제외~~ <code>🙋 등록할 이미지가 없는데 필수항목으로 하면 불편하다.</code>
* - [x] ~~회원가입 완료 후 회원 이름 출력하여 환영합니다.페이지 추가~~ <code>🙋 제대로 회원가입이 되었는지 확인 페이지가 있었으면 좋겠다.</code>
* - [x] ~~리뷰 등록 시 이미지 미리보기 및 원하는 이미지만 수정~~ <code>🙋 등록한 이미지 확인이 안 되면 불편하고 원하는 이미지만 수정하고 싶다.</code>
* - [x] ~~맛집 신청 시 회원이 아닌 비회원도 등록할 수 있게 수정~~ <code>🙋 회원가입을 하지 않아도 신청할 수 있었으면 좋겠다.</code>
	
<br/>
	
## 6. 추후 보완사항

* - [ ] 핸드폰 인증번호 불일치 시 Javascript로 처리한 부분 Redis(In-memory)로 관리하기
* - [ ] 일반 로그인 Security 설정
* - [ ] 일반 회원 아이디, 패스워드 찾기
* - [ ] 소셜 로그인 연동 (네이버, 카카오톡)
* - [ ] 전체 맛집 검색
