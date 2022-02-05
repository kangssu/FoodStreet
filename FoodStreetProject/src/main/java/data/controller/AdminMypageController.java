package data.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import data.dto.MemberDto;
import data.dto.RequestDto;
import data.paging.Criteria;
import data.paging.Paging;
import data.service.AdminMypageService;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class AdminMypageController {

  private final AdminMypageService service;

  @GetMapping("/admin/mypage")
  public ModelAndView home(Criteria cri) {

    ModelAndView mv = new ModelAndView();

    List<RequestDto> list = service.getList(cri);
    List<MemberDto> executive_list = service.getExecutiveList(cri);

    mv.addObject("list", list);
    mv.addObject("executive_list", executive_list);
    mv.setViewName("/m/admin_mypage/home");

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
    mv.setViewName("/m/admin_mypage/request_list");

    return mv;
  }

  @GetMapping("/admin/request/view")
  public ModelAndView requestUdateView(@RequestParam("num") int num) {
    ModelAndView mv = new ModelAndView();

    RequestDto dto = service.getNumList(num);

    mv.addObject("dto", dto);
    mv.setViewName("/m/admin_mypage/request_form");

    return mv;
  }

  @PostMapping("/request/update")
  public void requestUpdate(RequestDto dto, int num, HttpServletResponse response)
      throws IOException {

    RequestDto stateItem = service.getNumList(num);

    String db_state = stateItem.getState();
    String up_state = dto.getState();

    if (db_state.equals("대기중") && up_state.equals("등록완료")) {
      service.requestUpdate(dto);
      response.setContentType("text/html; charset=UTF-8");
      PrintWriter out = response.getWriter();
      out.println(
          "<script>alert('맛집리스트로 등록되었습니다!'); location.href='/admin/request/list';</script>");
    } else {
      service.requestUpdate(dto);
      response.setContentType("text/html; charset=UTF-8");
      PrintWriter out = response.getWriter();
      out.println(
          "<script>alert('해당 맛집이 수정되었습니다!'); location.href='/admin/request/list';</script>");
    }
  }

  @ResponseBody
  @RequestMapping("/request/delete")
  public void requestDelete(@RequestBody int num) {

    service.requestDel(num);
  }

  @GetMapping("/admin/executive/form")
  public String insert() {
    return "/m/admin_mypage/executive_form";
  }

  @GetMapping("/admin/executive/list")
  public ModelAndView executiveList(Criteria cri) {
    ModelAndView mv = new ModelAndView();

    int listCount = service.totalExecutiveCount();

    Paging paging = new Paging();
    paging.setCri(cri);
    paging.setTotalCount(listCount);
    int no = paging.getNo();

    List<MemberDto> list = service.getExecutiveList(cri);
    int currentPage = cri.getPage();

    mv.addObject("list", list);
    mv.addObject("paging", paging);
    mv.addObject("no", no);
    mv.addObject("currentPage", currentPage);
    mv.setViewName("/m/admin_mypage/executive_list");

    return mv;
  }

  @GetMapping("/admin/executive/view")
  public ModelAndView executiveUpdateView(@RequestParam("num") int num) {

    ModelAndView mv = new ModelAndView();
    MemberDto dto = service.executiveNumList(num);

    mv.addObject("dto", dto);
    mv.setViewName("/m/admin_mypage/executive_update");

    return mv;
  }

  @ResponseBody
  @RequestMapping("/executive/delete")
  public void executiveDelete(@RequestBody int num) {

    service.executiveDel(num);
  }
}
