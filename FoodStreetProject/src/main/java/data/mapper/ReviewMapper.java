package data.mapper;

import org.apache.ibatis.annotations.Mapper;
import data.dto.ReviewDto;

@Mapper
public interface ReviewMapper {

  public void reviewInsert(ReviewDto dto);

  public int reviewDel(int idx);
}
