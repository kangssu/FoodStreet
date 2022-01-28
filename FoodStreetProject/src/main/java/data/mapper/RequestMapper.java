package data.mapper;

import org.apache.ibatis.annotations.Mapper;
import data.dto.RequestDto;

@Mapper
public interface RequestMapper {

  public void insertRequest(RequestDto dto);
}
