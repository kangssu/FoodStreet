# FOODSTREET - 푸드스트릿 :hamburger::pizza::beers:

* **"여러 사람들이 알고 있는 맛집들을 자신만 아는게 아닌 서로 공유할 방법이 없을까?"**
* **"맛집 공유를 하더라도 사이트의 의도와 맞지 않는 게시글은 제외시키는게 낫지 않을까?"**
* 이런 물음들에 대해 100% 딱 맞는 사이트로 만든 것이 바로 **푸드스트릿** 입니다!!

<br/>

 ## 1. 개발환경

 ```
 IDE: Eclipse(21-06)
 DB: MySQL 8.0.27
 VC: git
 Build Tool: Maven

 + spring boot
 + jsp 기반
 + MyBatis
 ```
 <br/>

## 2. 기능구현

* 회원가입
  * 모든 항목 Javascript(Front) + Validation(Back) 유효성 검사
  * 아이디, 닉네임 중복체크 (중복 값 등록 불가능)
  * 패스워드 BCrypt 암호화 처리 (패스워드 불일치 시 등록 불가능)
  * 핸드폰 인증 (collsms 사용 - 입력한 핸드폰으로 인증번호 문자 전송 + 인증번호 일치 여부 확인)

* 로그인
  * 일반 로그인 (회원가입을 통한 계정)
  * 소셜 로그인 연동(구글)
<br/>

## 3. 트러블 슈팅

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

<br/>

## 4. 추후 보완사항

* - [ ] 핸드폰 인증번호 불일치 시 Javascript로 처리한 부분 Redis(In-memory)로 관리하기
* - [ ] 이미지만 Validation 검사 오류, 우선 Javascript로 처리함 (다시 확인)
* - [ ] 일반 로그인 Security 설정
* - [ ] 일반 회원 아이디, 패스워드 찾기
* - [ ] 소셜 로그인 연동 (네이버, 카카오톡)
