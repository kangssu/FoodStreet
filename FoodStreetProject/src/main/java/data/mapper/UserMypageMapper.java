package data.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import data.dto.MemberDto;
import data.dto.RequestDto;

@Mapper
public interface UserMypageMapper {

  public MemberDto getNumFind(int num);

  public List<RequestDto> getIdList(String id, int start, int end);

  public List<RequestDto> noPageList(String id);

  public int totalCount(String id);

  public int requestDel(int num);
}
