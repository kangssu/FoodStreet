package data.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import data.dto.RequestDto;

@Mapper
public interface MypageMapper {

  public List<RequestDto> getList();
}

