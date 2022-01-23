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
  @Pattern(regexp = "^[a-zA-Z0-9]{4,20}$", message = "4자~20자의 아이디여야 합니다.")
  private String id;

  @NotBlank(message = "필수 입력 항목입니다.")
  @Pattern(regexp = "^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$",
      message = "숫자+영문자+특수문자 조합으로 8자리 이상 사용해야 합니다.")
  private String pw;

  @NotBlank(message = "필수 입력 항목입니다.")
  @Pattern(regexp = "^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$",
      message = "숫자+영문자+특수문자 조합으로 8자리 이상 사용해야 합니다.")
  private String pw_check;

  @NotBlank(message = "필수 입력 항목입니다.")
  @Pattern(regexp = "^[ㄱ-ㅎ가-힣a-z0-9-_]{2,10}$", message = "특수문자를 제외한 2~10자리여야 합니다.")
  private String name;

  @NotBlank(message = "필수 입력 항목입니다.")
  @Pattern(regexp = "^[ㄱ-ㅎ가-힣a-z0-9-_]{2,10}$", message = "특수문자를 제외한 2~10자리여야 합니다.")
  private String nickname;

  @NotBlank(message = "필수 입력 항목입니다.")
  @Pattern(regexp = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+.[A-Za-z]{2,6}$",
      message = "이메일 형식이 올바르지 않습니다.")
  private String email;

  @NotBlank(message = "필수 입력 항목입니다.")
  @Pattern(regexp = "^[A-Za-z0-9_\\-]{5,20}$", message = "번호는 -를 제외한 숫자여야 합니다.")
  private String hp;

  private String img_name;
  private String img_path;
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

  public String getImg_name() {
    return img_name;
  }

  public void setImg_name(String img_name) {
    this.img_name = img_name;
  }

  public String getImg_path() {
    return img_path;
  }

  public void setImg_path(String img_path) {
    this.img_path = img_path;
  }

  public Timestamp getGaipday() {
    return gaipday;
  }

  public void setGaipday(Timestamp gaipday) {
    this.gaipday = gaipday;
  }
}
