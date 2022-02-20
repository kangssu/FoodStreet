package data.controller;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import data.dto.MemberStoryDto;
import data.dto.StoryDto;
import data.service.FoodStoryService;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RequestMapping("/foodstory")
@Controller
public class FoodStoryController {

  private final FoodStoryService service;

  @GetMapping("/list")
  public ModelAndView list() {

    ModelAndView mv = new ModelAndView();

    List<StoryDto> list = service.storyList();

    mv.addObject("list", list);
    mv.setViewName("/foodstory/story_list");
    return mv;
  }

  @GetMapping("/view")
  public ModelAndView view(@RequestParam("num") int num, HttpSession session) {

    ModelAndView mv = new ModelAndView();

    MemberStoryDto dto = service.storyView(num);

    mv.addObject("dto", dto);
    mv.setViewName("/foodstory/story_view");

    return mv;
  }
}
