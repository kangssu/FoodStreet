package data.controller;

import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;
import data.dto.MemberDto;
import data.service.UserMypageService;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class UserMypageController {

  private final UserMypageService service;

  @GetMapping("/mypage")
  public String userHome() {
    return "/m/user_mypage/home";
  }

  @GetMapping("/mypage/modify")
  public ModelAndView userForm(HttpSession session) {

    ModelAndView mv = new ModelAndView();

    MemberDto dto = (MemberDto) session.getAttribute("member");

    mv.addObject("dto", dto);
    mv.setViewName("/m/user_mypage/user_update");

    return mv;
  }

}
