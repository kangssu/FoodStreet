package data.service;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;
import org.springframework.web.multipart.MultipartFile;
import data.dto.MemberDto;
import data.dto.Role;
import data.mapper.JoinMapper;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class JoinService {

  private final JoinMapper mapper;
  private final PasswordEncoder passwordEncoder;

  @Autowired
  public JoinService(JoinMapper mapper, PasswordEncoder passwordEncoder) {
    this.mapper = mapper;
    this.passwordEncoder = passwordEncoder;
  }

  public void insertMember(MemberDto dto, MultipartFile file) throws IOException {

    String projectpath = System.getProperty("user.dir") + "\\src\\main\\resources\\static\\photo";
    UUID uuid = UUID.randomUUID();

    String fileName = uuid + "_" + file.getOriginalFilename();

    File saveFile = new File(projectpath, fileName);

    file.transferTo(saveFile);

    dto.setPw(passwordEncoder.encode(dto.getPw()));
    dto.setImg_name(fileName);
    dto.setImg_path("/photo/" + fileName);
    dto.setAuth_provider(Role.USER);
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

  public void phoneNumberCertified(String hp, String randomNum) {

    String api_key = "NCSFETPM9HD9ZWFA";
    String api_secret = "WMMTGPK3CZV4NOI8KDPWGCF5EBSWLLBX";
    Message coolsms = new Message(api_key, api_secret);

    HashMap<String, String> params = new HashMap<String, String>();
    params.put("to", hp);
    params.put("from", "01025920475");
    params.put("type", "SMS");
    params.put("text", "[푸드스트릿] 본인확인 인증번호는" + "[" + randomNum + "]" + "입니다.");

    try {
      JSONObject obj = coolsms.send(params);
      System.out.println("성공" + obj.toString());
    } catch (CoolsmsException e) {
      System.out.println("에러1" + e.getMessage());
      System.out.println("에러2" + e.getCode());
    }

  }

  public MemberDto getFindByEmail(String email) {
    return mapper.getFindByEmail(email);
  }

  public void createNewMember(String email, String name, Role Auth_provider) {
    MemberDto dto = new MemberDto();
    dto.setMember_level(10);
    dto.setEmail(email);
    dto.setName(name);
    dto.setGaipday(new Date());
    dto.setAuth_provider(Role.SOCIAL);

    mapper.insertMember(dto);

  }
}
