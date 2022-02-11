package data.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import data.dto.ReviewDto;
import data.service.ReviewService;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class ReviewContorller {

  private final ReviewService service;

  @ResponseBody
  @PostMapping("/review/insert")
  public void insert(ReviewDto dto) {

    service.reviewInsert(dto);
  }
}
