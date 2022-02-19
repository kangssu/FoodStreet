package data.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import data.dto.MemberDto;
import data.dto.StoryDto;
import data.paging.Criteria;
import data.paging.Paging;
import data.service.ExecutiveMypageService;
import data.service.UserMypageService;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RequestMapping("/executive")
@Controller
public class ExecutiveMypageController {

  private final ExecutiveMypageService service;
  private final UserMypageService u_service;

  @GetMapping("/mypage")
  public ModelAndView home(Criteria cri, HttpSession session) {

    ModelAndView mv = new ModelAndView();

    MemberDto dto = (MemberDto) session.getAttribute("member");
    String id = dto.getId();

    String img_name = u_service.getImg(id);

    int listCount = service.totalCount(id);

    Paging paging = new Paging();
    paging.setCri(cri);
    paging.setTotalCount(listCount);
    int no = paging.getNo();

    int currentPage = cri.getPage();
    List<StoryDto> list = service.storyList(id);

    mv.addObject("list", list);
    mv.addObject("paging", paging);
    mv.addObject("no", no);
    mv.addObject("currentPage", currentPage);
    mv.addObject("img_name", img_name);
    mv.setViewName("/m/executive_mypage/home");

    return mv;
  }

  @GetMapping("/story/form")
  public ModelAndView storyForm(HttpSession session) {
    ModelAndView mv = new ModelAndView();

    MemberDto dto = (MemberDto) session.getAttribute("member");
    String id = dto.getId();

    String img_name = u_service.getImg(id);

    mv.addObject("img_name", img_name);
    mv.setViewName("/m/executive_mypage/story_form");

    return mv;
  }

  @PostMapping("/story/success")
  public void insert(StoryDto dto, MultipartFile file, HttpServletResponse response)
      throws IllegalStateException, IOException {

    service.insertStory(dto, file);

    response.setContentType("text/html; charset=UTF-8");
    PrintWriter out = response.getWriter();
    out.println("<script>alert('스토리가 등록되었습니다!'); location.href='/executive/mypage';</script>");
  }

  @GetMapping("/story/view")
  public ModelAndView storyView(@RequestParam("num") int num,
      @RequestParam(value = "page", defaultValue = "1", required = false) int page,
      HttpSession session) {

    ModelAndView mv = new ModelAndView();

    MemberDto dto = (MemberDto) session.getAttribute("member");
    String id = dto.getId();

    String img_name = u_service.getImg(id);

    StoryDto sdto = service.storyGetView(num);

    mv.addObject("img_name", img_name);
    mv.addObject("sdto", sdto);
    mv.addObject("currentPage", page);
    mv.setViewName("/m/executive_mypage/story_update");

    return mv;

  }

  @PostMapping("/story/update")
  public void storyUpdate(StoryDto dto, MultipartFile file, HttpServletResponse response)
      throws IllegalStateException, IOException {

    service.updateStory(dto, file);

    response.setContentType("text/html; charset=UTF-8");
    PrintWriter out = response.getWriter();
    out.println("<script>alert('스토리가 수정되었습니다!'); location.href='/executive/mypage';</script>");
  }

  @ResponseBody
  @PostMapping("/story/delete")
  public void delete(@RequestBody int num) {
    service.storyDelete(num);
  }

}
