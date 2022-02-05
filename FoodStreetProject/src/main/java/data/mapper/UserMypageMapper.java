package data.mapper;

import org.apache.ibatis.annotations.Mapper;
import data.dto.MemberDto;

@Mapper
public interface UserMypageMapper {

  public MemberDto getIdFind(String id);
}
