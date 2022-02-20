package data.service;

import java.util.List;
import org.springframework.stereotype.Service;
import data.dto.MemberStoryDto;
import data.dto.StoryDto;
import data.mapper.FoodStoryMapper;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class FoodStoryService {

  private final FoodStoryMapper mapper;

  public List<StoryDto> storyList() {
    return mapper.storyList();
  }

  public List<MemberStoryDto> storyJoinList() {
    return mapper.storyJoinList();
  }

  public MemberStoryDto storyView(int num) {
    return mapper.storyView(num);
  }

}
