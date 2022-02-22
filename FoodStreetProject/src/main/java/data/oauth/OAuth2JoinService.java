package data.oauth;

import java.util.Date;
import org.springframework.stereotype.Service;
import data.dto.MemberDto;
import data.dto.Role;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class OAuth2JoinService {

  private final OAuth2JoinMapper mapper;

  public void createNewMember(String email, String name, Role Auth_provider) {
    MemberDto dto = new MemberDto();
    dto.setMember_level(10);
    dto.setId(email);
    dto.setPw("");
    dto.setEmail(email);
    dto.setName(name);
    dto.setGaipday(new Date());
    dto.setAuth_provider(Role.SOCIAL);

    mapper.insertOAuthMember(dto);

  }

  public MemberDto findEmailMember(String email) {
    return mapper.findEmailMember(email);
  }
}
