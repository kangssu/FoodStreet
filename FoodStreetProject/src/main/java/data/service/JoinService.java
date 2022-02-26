package data.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import org.json.simple.JSONObject;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;
import org.springframework.web.multipart.MultipartFile;
import data.dto.MemberDto;
import data.dto.Role;
import data.mapper.JoinMapper;
import lombok.RequiredArgsConstructor;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@RequiredArgsConstructor
@Service
public class JoinService {

  private final JoinMapper mapper;
  private final PasswordEncoder passwordEncoder;

  public void insertMember(MemberDto dto, MultipartFile file) throws IOException {

    String projectpath = "/home/tomcat/apache-tomcat-9.0.58/webapps/foodstreet/images";
    UUID uuid = UUID.randomUUID();

    String fileName = uuid + "_" + file.getOriginalFilename();

    File saveFile = new File(projectpath, fileName);

    file.transferTo(saveFile);

    dto.setPw(passwordEncoder.encode(dto.getPw()));
    dto.setImg_name(fileName);
    dto.setImg_path("/images/" + fileName);

    if (dto.getMember_level() == 10) {
      dto.setAuth_provider(Role.USER);
    } else {
      dto.setAuth_provider(Role.EXECUTIVE);
    }
    mapper.insertMember(dto);
  }

  public MemberDto updateMember(MemberDto dto, int num, MultipartFile file) throws IOException {

    String projectpath = "/home/tomcat/apache-tomcat-9.0.58/webapps/foodstreet/images";
    UUID uuid = UUID.randomUUID();

    String fileName = uuid + "_" + file.getOriginalFilename();

    File saveFile = new File(projectpath, fileName);

    MemberDto item = mapper.getFindJoin(num);

    if (dto.getPw().length() == 0) {
      dto.setPw(item.getPw());
    } else {
      dto.setPw(passwordEncoder.encode(dto.getPw()));
    }

    if (file.getOriginalFilename().equals("")) {
      dto.setImg_name(item.getImg_name());
      dto.setImg_path("/images/" + item.getImg_name());
    } else {
      File delFile = new File(projectpath, item.getImg_name());
      delFile.delete();

      file.transferTo(saveFile);
      dto.setImg_name(fileName);
      dto.setImg_path("/images/" + fileName);
    }

    mapper.updateMember(dto);
    return item;
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
}
