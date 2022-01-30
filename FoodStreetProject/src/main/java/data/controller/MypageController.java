package data.controller;

import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;
import data.dto.RequestDto;
import data.service.MypageService;

@Controller
public class MypageController {

  private final MypageService service;

  public MypageController(MypageService service) {
    this.service = service;
  }

  @GetMapping("/admin/mypage")
  public ModelAndView home() {

    ModelAndView mv = new ModelAndView();

    List<RequestDto> list = service.getList();

    mv.addObject("list", list);
    mv.setViewName("/mypage/admin_home");

    return mv;
  }

  //////// 여기부터 일반 회원 마이페이지 ////////

  @GetMapping("/mypage")
  public String userHome() {
    return "/mypage/user_home";
  }
}
