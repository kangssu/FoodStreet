package data.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FoodRequestController {

  @GetMapping("/request")
  public String request() {
    return "/food_request/request_list";
  }
}
