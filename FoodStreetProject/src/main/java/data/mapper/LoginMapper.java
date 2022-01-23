package data.mapper;

import org.apache.ibatis.annotations.Mapper;
import data.dto.MemberDto;

@Mapper
public interface LoginMapper {
  public MemberDto login(MemberDto dto);
}
