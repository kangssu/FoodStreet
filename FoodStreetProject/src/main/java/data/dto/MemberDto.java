package data.dto;

import java.util.Date;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import org.apache.ibatis.type.Alias;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
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
  private Date gaipday;
  private Role auth_provider;
}
