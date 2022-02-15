package data.controller;

import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import data.dto.RequestDto;
import data.dto.ReviewDto;
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

    String img = service.imgNameList(num);
    String[] results = img.split(",");

    int count = 0;

    for (int i = 0; i < results.length; i++) {
      count++;
    }

    List<ReviewDto> reviewList = service.reviewList(num);

    mv.addObject("dto", dto);
    mv.addObject("count", count);
    mv.addObject("currentPage", page);
    mv.addObject("reviewList", reviewList);
    mv.setViewName("/food/food_view");

    return mv;
  }
}
