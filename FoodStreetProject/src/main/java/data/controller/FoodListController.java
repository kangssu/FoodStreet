package data.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FoodListController {

  @GetMapping("/food/list")
  public String foodList() {
    return "/food/food_list";
  }

  @GetMapping("/food/view")
  public String foodView() {
    return "/food/food_view";
  }
}
