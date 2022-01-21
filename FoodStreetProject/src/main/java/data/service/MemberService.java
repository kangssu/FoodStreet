package data.service;

import java.util.HashMap;
import java.util.Map;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;
import data.dto.MemberDto;
import data.mapper.MemberMapper;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class MemberService {

  private final MemberMapper mapper;
  private final PasswordEncoder passwordEncoder;

  @Autowired
  public MemberService(MemberMapper mapper, PasswordEncoder passwordEncoder) {
    this.mapper = mapper;
    this.passwordEncoder = passwordEncoder;
  }

  public void insertMember(MemberDto dto) {
    dto.setPw(passwordEncoder.encode(dto.getPw()));
    mapper.insertMember(dto);
  }

  public Map<String, String> validateHandling(Errors errors) {
    Map<String, String> validatorResult = new HashMap<>();
    for (FieldError error : errors.getFieldErrors()) {
      String validKeyName = String.format("valid_%s", error.getField());
      validatorResult.put(validKeyName, error.getDefaultMessage());
    }
    return validatorResult;
  }

  public int idCheck(String id) {
    return mapper.idCheck(id);
  }

  public int nicknameCheck(String nickname) {
    return mapper.nicknameCheck(nickname);
  }

  public int emailCheck(String email) {
    return mapper.emailCheck(email);
  }

  public void certifiedPhoneNumber(String hp, String numStr) {

    String api_key = "NCSFETPM9HD9ZWFA";
    String api_secret = "WMMTGPK3CZV4NOI8KDPWGCF5EBSWLLBX";
    Message coolsms = new Message(api_key, api_secret);

    HashMap<String, String> params = new HashMap<String, String>();
    params.put("to", hp);
    params.put("from", "01025920475");
    params.put("type", "SMS");
    params.put("text", "[푸드스트릿] 본인확인 인증번호는" + "[" + numStr + "]" + "입니다.");

    try {
      JSONObject obj = coolsms.send(params);
      System.out.println("성공" + obj.toString());
    } catch (CoolsmsException e) {
      System.out.println("에러1" + e.getMessage());
      System.out.println("에러2" + e.getCode());
    }

  }
}
