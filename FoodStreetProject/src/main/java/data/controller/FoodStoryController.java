package data.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/foodstory")
@Controller
public class FoodStoryController {

  @GetMapping("/list")
  public String list() {
    return "/foodstory/story_list";
  }

  @GetMapping("/view")
  public String view() {
    return "/foodstory/story_view";
  }
}
