package data.controller;

import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;
import data.dto.RequestDto;
import data.paging.Criteria;
import data.paging.Paging;
import data.service.MypageService;

@Controller
public class MypageController {

  private final MypageService service;

  public MypageController(MypageService service) {
    this.service = service;
  }

  @GetMapping("/admin/mypage")
  public ModelAndView home(Criteria cri) {

    ModelAndView mv = new ModelAndView();

    List<RequestDto> list = service.getList(cri);

    mv.addObject("list", list);
    mv.setViewName("/m/mypage/admin_home");

    return mv;
  }

  @GetMapping("/admin/mypage/request")
  public ModelAndView adminRequest(Criteria cri) {
    ModelAndView mv = new ModelAndView();

    int listCount = service.totalCount();

    Paging paging = new Paging();
    paging.setCri(cri);
    paging.setTotalCount(listCount);

    List<RequestDto> list = service.getList(cri);
    int currentPage = cri.getPage();
    System.out.println(paging);

    mv.addObject("list", list);
    mv.addObject("paging", paging);
    mv.addObject("currentPage", currentPage);
    mv.setViewName("/m/mypage/admin_request_list");

    return mv;
  }

  //////// 여기부터 일반 회원 마이페이지 ////////

  @GetMapping("/mypage")
  public String userHome() {
    return "/m/mypage/user_home";
  }
}
