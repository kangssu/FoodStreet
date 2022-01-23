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
  * 아이디, 닉네임 중복체크 (중복 값 등록 불가능)
  * 패스워드 Security 암호화 처리 (패스워드 불일치 시 등록 불가능)
  * 핸드폰 인증 (collsms 사용 - 입력한 핸드폰으로 인증번호 문자 전송 + 인증번호 일치 여부 확인)

### 추후 보완사항

- [ ] 핸드폰 인증번호 불일치 시 Javascript로 처리한 부분 Redis(In-memory)로 관리하기
- [ ] 이미지만 Validation 검사 오류, 우선 Javascript로 처리함 (다시 확인)
