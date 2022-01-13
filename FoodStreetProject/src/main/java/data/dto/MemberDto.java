package data.dto;

import java.sql.Timestamp;
import org.apache.ibatis.type.Alias;

@Alias("mdto")
public class MemberDto {

  private int num;
  private int member_level;
  private String id;
  private String pw;
  private String pw_check;
  private String name;
  private String nickname;
  private String email;
  private String hp;
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
