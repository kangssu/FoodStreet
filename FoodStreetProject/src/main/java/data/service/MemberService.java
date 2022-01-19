package data.service;

import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;
import data.dto.MemberDto;
import data.mapper.MemberMapper;

@Service
public class MemberService {

  private final MemberMapper mapper;

  @Autowired
  public MemberService(MemberMapper mapper) {
    this.mapper = mapper;
  }

  public void insertMember(MemberDto dto) {
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
}
