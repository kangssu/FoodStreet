package data.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import data.dto.RequestDto;
import data.paging.Criteria;

@Mapper
public interface MypageMapper {

  public List<RequestDto> getList(Criteria cri);

  public int totalCount();

  public RequestDto getNumList(int num);

  public int requestDel(int num);
}

