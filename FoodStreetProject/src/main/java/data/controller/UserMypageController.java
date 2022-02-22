package data.controller;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import data.dto.MemberDto;
import data.dto.RequestDto;
import data.dto.RequestReviewDto;
import data.paging.Criteria;
import data.paging.Paging;
import data.service.UserMypageService;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class UserMypageController {

  private final UserMypageService service;

  @GetMapping("/mypage")
  public ModelAndView userHome(HttpSession session) {

    ModelAndView mv = new ModelAndView();

    MemberDto member = (MemberDto) session.getAttribute("member");
    String id = member.getId();

    List<RequestDto> list = service.noPageList(id);
    String img_name = service.getImg(id);
    List<RequestReviewDto> rlist = service.reviewNoPageList(id);

    mv.addObject("list", list);
    mv.addObject("img_name", img_name);
    mv.addObject("rlist", rlist);
    mv.setViewName("/m/user_mypage/home");

    return mv;
  }

  @GetMapping("/mypage/my")
  public ModelAndView userForm(HttpSession session) {

    ModelAndView mv = new ModelAndView();

    MemberDto member = (MemberDto) session.getAttribute("member");
    int num = member.getNum();
    String id = member.getId();

    MemberDto dto = service.getNumFind(num);
    String img_name = service.getImg(id);

    mv.addObject("dto", dto);
    mv.addObject("img_name", img_name);
    mv.setViewName("/m/user_mypage/user_update");
    return mv;
  }

  @GetMapping("/mypage/request/list")
  public ModelAndView requestList(Criteria cri, HttpSession session) {

    ModelAndView mv = new ModelAndView();

    MemberDto member = (MemberDto) session.getAttribute("member");
    String id = member.getId();

    int listCount = service.totalCount(id);
    String img_name = service.getImg(id);

    Paging paging = new Paging();
    paging.setCri(cri);
    paging.setTotalCount(listCount);
    int no = paging.getNo();
    int currentPage = cri.getPage();
    int start = cri.getPageStart();
    int end = cri.getPerPageNum();

    List<RequestDto> list = service.getIdList(id, start, end);

    mv.addObject("list", list);
    mv.addObject("paging", paging);
    mv.addObject("no", no);
    mv.addObject("currentPage", currentPage);
    mv.addObject("img_name", img_name);
    mv.setViewName("/m/user_mypage/request_list");

    return mv;
  }

  @GetMapping("/user/request/view")
  public ModelAndView requestView(@RequestParam("num") int num,
      @RequestParam(value = "page", defaultValue = "1", required = false) int page,
      HttpSession session) {

    ModelAndView mv = new ModelAndView();

    MemberDto member = (MemberDto) session.getAttribute("member");
    String id = member.getId();

    String img_name = service.getImg(id);
    RequestDto dto = service.numRequestView(num);

    mv.addObject("dto", dto);
    mv.addObject("img_name", img_name);
    mv.addObject("currentPage", page);
    mv.setViewName("/m/user_mypage/request_confirm");

    return mv;
  }

  @ResponseBody
  @RequestMapping("/user/request/delete")
  public void del(@RequestBody int num) {
    service.requestDel(num);
  }

  @GetMapping("/mypage/review/list")
  public ModelAndView reviewList(Criteria cri, HttpSession session) {

    ModelAndView mv = new ModelAndView();

    MemberDto member = (MemberDto) session.getAttribute("member");
    String id = member.getId();

    int listCount = service.totalCountReview(id);
    String img_name = service.getImg(id);

    Paging paging = new Paging();
    paging.setCri(cri);
    paging.setTotalCount(listCount);
    int no = paging.getNo();
    int currentPage = cri.getPage();
    int start = cri.getPageStart();
    int end = cri.getPerPageNum();

    List<RequestReviewDto> list = service.getReviewList(id, start, end);

    mv.addObject("list", list);
    mv.addObject("paging", paging);
    mv.addObject("no", no);
    mv.addObject("currentPage", currentPage);
    mv.addObject("img_name", img_name);
    mv.setViewName("/m/user_mypage/review_list");

    return mv;
  }

}
