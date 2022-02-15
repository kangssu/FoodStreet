package data.controller;

import java.io.IOException;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import data.dto.ReviewDto;
import data.service.ReviewService;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class ReviewContorller {

  private final ReviewService service;

  @ResponseBody
  @PostMapping("/review/insert")
  public void insert(@RequestPart(value = "key") ReviewDto dto,
      @RequestPart(value = "file") List<MultipartFile> file)
      throws IllegalStateException, IOException {

    System.out.println("받아온 파일들" + file);
    dto.setUpload(file);

    service.reviewInsert(dto);
  }

  @ResponseBody
  @PostMapping("/review/delete")
  public void requestDelete(@RequestBody int idx) {

    service.reviewDel(idx);
  }
}
