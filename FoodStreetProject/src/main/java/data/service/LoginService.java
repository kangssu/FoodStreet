package data.service;

import org.springframework.stereotype.Service;
import data.dto.MemberDto;
import data.mapper.LoginMapper;

@Service
public class LoginService {

  private final LoginMapper mapper;

  public LoginService(LoginMapper mapper) {
    this.mapper = mapper;
  }

  public MemberDto login(MemberDto dto) {
    return mapper.login(dto);
  }

}
