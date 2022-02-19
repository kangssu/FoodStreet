package data.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import data.dto.StoryDto;

@Mapper
public interface ExecutiveMypageMapper {

  public void insertStory(StoryDto dto);

  public List<StoryDto> storyList(String id);

  public int totalCount(String id);

  public StoryDto storyGetView(int num);

  public void updateStory(StoryDto dto);

  public int storyDelete(int num);
}
