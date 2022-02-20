package data.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import data.dto.MemberStoryDto;
import data.dto.StoryDto;

@Mapper
public interface FoodStoryMapper {

  public List<StoryDto> storyList();

  public List<MemberStoryDto> storyJoinList();

  public MemberStoryDto storyView(int num);

}
