package data.controller;

import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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

  @GetMapping("/admin/request/list")
  public ModelAndView requestList(Criteria cri) {
    ModelAndView mv = new ModelAndView();

    int listCount = service.totalCount();

    Paging paging = new Paging();
    paging.setCri(cri);
    paging.setTotalCount(listCount);
    int no = paging.getNo();

    List<RequestDto> list = service.getList(cri);
    int currentPage = cri.getPage();

    mv.addObject("list", list);
    mv.addObject("paging", paging);
    mv.addObject("no", no);
    mv.addObject("currentPage", currentPage);
    mv.setViewName("/m/mypage/admin_request_list");

    return mv;
  }

  @GetMapping("/admin/request/view")
  public ModelAndView requestUdate(int num) {
    ModelAndView mv = new ModelAndView();

    RequestDto dto = service.getNumList(num);

    mv.addObject("dto", dto);
    mv.setViewName("/m/mypage/admin_request_form");

    return mv;
  }

  @PostMapping("/admin/update")
  public String requestUpdate() {
    return "/m/mypage/admin_request_success";
  }

  @ResponseBody
  @RequestMapping("/admin/delete")
  public void requestDelete(@RequestBody int num) {

    service.requestDel(num);
  }

  //////// 여기부터 일반 회원 마이페이지 ////////

  @GetMapping("/mypage")
  public String userHome() {
    return "/m/mypage/user_home";
  }
}
