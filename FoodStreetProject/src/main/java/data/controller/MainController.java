package data.controller;

import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;
import data.dto.MemberStoryDto;
import data.service.FoodStoryService;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class MainController {

  private final FoodStoryService service;

  @GetMapping("/")
  public ModelAndView main() {

    ModelAndView mv = new ModelAndView();

    List<MemberStoryDto> list = service.storyJoinList();

    mv.addObject("list", list);
    mv.setViewName("/inc/main");
    return mv;

  }
}
