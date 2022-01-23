package data.mapper;

import org.apache.ibatis.annotations.Mapper;
import data.dto.MemberDto;

@Mapper
public interface JoinMapper {

  public void insertMember(MemberDto dto);

  public int idCheck(String id);

  public int nicknameCheck(String nickname);

  public int emailCheck(String email);

  public boolean existsById(String id);

  public boolean existsByNickname(String nickname);

}
