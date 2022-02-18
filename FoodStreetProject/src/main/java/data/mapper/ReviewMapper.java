package data.mapper;

import org.apache.ibatis.annotations.Mapper;
import data.dto.ReviewDto;

@Mapper
public interface ReviewMapper {

  public void reviewInsert(ReviewDto dto);

  public ReviewDto reviewDetail(int idx);

  public void reviewUpdate(ReviewDto dto);

  public ReviewDto idxFindImg(int idx);

  public void reviewImgDelete(ReviewDto dto);

  public int reviewDel(int idx);
}
