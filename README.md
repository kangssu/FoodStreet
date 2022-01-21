# springboot-foodstreet
맛집 공유 커뮤니티 웹사이트 🍔🍕🍻

 ### 개발환경

 ```
 IDE: Eclipse(21-06)
 DB: MySQL 8.0.27
 VC: git
 Build Tool: Maven

 + spring boot
 + jsp 기반
 + MyBatis
 ```

### 기능구현

* 회원가입
  * 모든 항목 Javascript(Front) + Validation(Back) 유효성 검사
  * Id, Nickname 중복체크 (중복 값 있으면 등록 X)
  * Pw Security 암호화 처리 (Pw 불일치시 등록 X)
  * 핸드폰 인증 (collsms 사용 - 입력한 핸드폰으로 인증번호 문자 전송 + 인증번호 일치 여부 확인)
