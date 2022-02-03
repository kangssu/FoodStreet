package data.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserMypageController {

  @GetMapping("/mypage")
  public String userHome() {
    return "/m/mypage/user_home";
  }
}
