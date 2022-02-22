package data.oauth;

import org.apache.ibatis.annotations.Mapper;
import data.dto.MemberDto;

@Mapper
public interface OAuth2JoinMapper {

  public void insertOAuthMember(MemberDto dto);

  public MemberDto findEmailMember(String email);
}
