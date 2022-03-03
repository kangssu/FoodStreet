package data.mapper;

import org.apache.ibatis.annotations.Mapper;
import data.dto.MemberDto;

@Mapper
public interface JoinMapper {

  public void insertMember(MemberDto dto);

  public void updateMember(MemberDto dto);

  public MemberDto getFindJoin(int num);

  public String getFindName(String id);

  public int idCheck(String id);

  public int nicknameCheck(String nickname);

  public int emailCheck(String email);

  public boolean existsById(String id);

  public boolean existsByNickname(String nickname);

}
