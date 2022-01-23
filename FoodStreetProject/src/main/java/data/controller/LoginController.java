package data.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class LoginController {

  @GetMapping("/login")
  public String login() {
    return "/users/login";
  }

  @PostMapping("/login/success")
  public String success() {

    return "/inc/main";
  }
}
