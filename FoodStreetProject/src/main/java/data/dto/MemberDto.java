package data.dto;

import java.sql.Timestamp;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import org.apache.ibatis.type.Alias;

@Alias("mdto")
public class MemberDto {

  private int num;
  private int member_level;
  @NotBlank(message = "필수 입력 항목입니다.")
  @Pattern(regexp = "^[a-zA-Z0-9]{4,20}$", message = "아이디는 영문자와 숫자가 포함된 4자~20자의 아이디여야 합니다.")
  private String id;

  @NotBlank(message = "필수 입력 항목입니다.")
  @Pattern(regexp = "(?=.*[0-9])(?=.*[a-z])(?=.*\\W)(?=\\S+$).{6,12}",
      message = "패스워드는 영문자와 숫자, 특수기호가 적어도 1개 이상 포함된 6자~12자의 패스워드여야 합니다.")
  private String pw;

  private String pw_check;

  @NotBlank(message = "필수 입력 항목입니다.")
  @Pattern(regexp = "^[ㄱ-ㅎ가-힣a-z0-9-_]{2,10}$", message = "이름은 특수문자를 제외한 2~10자리여야 합니다.")
  private String name;

  @NotBlank(message = "필수 입력 항목입니다.")
  @Pattern(regexp = "^[ㄱ-ㅎ가-힣a-z0-9-_]{2,10}$", message = "닉네임은 특수문자를 제외한 2~10자리여야 합니다.")
  private String nickname;

  @NotBlank(message = "필수 입력 항목입니다.")
  @Pattern(regexp = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+.[A-Za-z]{2,6}$",
      message = "이메일 형식이 올바르지 않습니다.")
  private String email;

  @NotBlank(message = "필수 입력 항목입니다.")
  @Pattern(regexp = "^[A-Za-z0-9_\\-]{5,20}$", message = "핸드폰 번호는 -를 제외한 숫자여야 합니다.")
  private String hp;

  @NotBlank(message = "필수 입력 항목입니다.")
  private String member_img;

  private Timestamp gaipday;

  public int getNum() {
    return num;
  }

  public void setNum(int num) {
    this.num = num;
  }

  public int getMember_level() {
    return member_level;
  }

  public void setMember_level(int member_level) {
    this.member_level = member_level;
  }

  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }

  public String getPw() {
    return pw;
  }

  public void setPw(String pw) {
    this.pw = pw;
  }

  public String getPw_check() {
    return pw_check;
  }

  public void setPw_check(String pw_check) {
    this.pw_check = pw_check;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getNickname() {
    return nickname;
  }

  public void setNickname(String nickname) {
    this.nickname = nickname;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getHp() {
    return hp;
  }

  public void setHp(String hp) {
    this.hp = hp;
  }

  public String getMember_img() {
    return member_img;
  }

  public void setMember_img(String member_img) {
    this.member_img = member_img;
  }

  public Timestamp getGaipday() {
    return gaipday;
  }

  public void setGaipday(Timestamp gaipday) {
    this.gaipday = gaipday;
  }
}
