package data.controller;

import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import data.dto.MemberReviewDto;
import data.dto.RequestDto;
import data.paging.Criteria;
import data.paging.Paging;
import data.service.FoodListService;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class FoodListController {

  private final FoodListService service;

  @GetMapping("/food/list")
  public ModelAndView foodList(@RequestParam(value = "category", required = false) String category,
      Criteria cri) {

    ModelAndView mv = new ModelAndView();

    int listCount = service.totalCount();
    int categoryCount = service.categoryTotalCount(category);

    Paging paging = new Paging();
    paging.setCri(cri);

    int currentPage = cri.getPage();
    int start = cri.getPageStart();
    int end = cri.getPerPageNum();

    if (category != null) {
      List<RequestDto> list = service.categoryList(category, start, end);
      mv.addObject("list", list);
      mv.addObject("category", category);
      paging.setTotalCount(categoryCount);

    } else {
      List<RequestDto> list = service.allList(cri);
      mv.addObject("list", list);
      paging.setTotalCount(listCount);
    }

    mv.addObject("paging", paging);
    mv.addObject("currentPage", currentPage);
    mv.setViewName("/f/food/food_list");

    return mv;
  }

  @GetMapping("/food/view")
  public ModelAndView foodView(@RequestParam("num") int num,
      @RequestParam(value = "page", defaultValue = "1", required = false) int page) {

    ModelAndView mv = new ModelAndView();

    RequestDto dto = service.getNumList(num);

    List<RequestDto> results = service.imgNameList(num);
    List<MemberReviewDto> reviewList = service.reviewList(num);

    mv.addObject("dto", dto);
    mv.addObject("results", results);
    mv.addObject("currentPage", page);
    mv.addObject("reviewList", reviewList);
    mv.setViewName("/food/food_view");

    return mv;
  }

  @ResponseBody
  @RequestMapping("/food/view/address")
  public RequestDto addressFind(@RequestBody int num) {
    System.out.println("넘버 확인 : " + num);
    RequestDto address = service.addressFind(num);
    System.out.println("정보 확인 : " + address);
    return address;
  }
}
