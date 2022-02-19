package data.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import data.dto.RequestReviewDto;
import data.dto.MemberDto;
import data.dto.RequestDto;

@Mapper
public interface UserMypageMapper {

  public MemberDto getNumFind(int num);

  public String getImg(String id);

  public List<RequestDto> getIdList(String id, int start, int end);

  public List<RequestDto> noPageList(String id);

  public int totalCount(String id);

  public RequestDto numRequestView(int num);

  public int requestDel(int num);

  public List<RequestReviewDto> reviewNoPageList(String id);

  public int totalCountReview(String id);

  public List<RequestReviewDto> getReviewList(String id, int start, int end);
}
