package data.controller;

import java.io.IOException;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import data.dto.ReviewDto;
import data.service.ReviewService;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
public class ReviewContorller {

  private final ReviewService service;

  @PostMapping("/review/insert")
  public void insert(@RequestPart(value = "key") ReviewDto dto,
      @RequestPart(value = "file1") MultipartFile file1,
      @RequestPart(value = "file2") MultipartFile file2,
      @RequestPart(value = "file3") MultipartFile file3,
      @RequestPart(value = "file4") MultipartFile file4) throws IllegalStateException, IOException {

    dto.setUpload1(file1);
    dto.setUpload2(file2);
    dto.setUpload3(file3);
    dto.setUpload4(file4);

    service.reviewInsert(dto, file1, file2, file3, file4);
  }

  @GetMapping("/review/detail")
  public ReviewDto reviewDetail(int idx) {

    return service.reviewDetail(idx);
  }

  @PostMapping("/review/update")
  public void update(@RequestPart(value = "key") ReviewDto dto,
      @RequestPart(value = "file1") MultipartFile file1,
      @RequestPart(value = "file2") MultipartFile file2,
      @RequestPart(value = "file3") MultipartFile file3,
      @RequestPart(value = "file4") MultipartFile file4) throws IllegalStateException, IOException {

    dto.setUpload1(file1);
    dto.setUpload2(file2);
    dto.setUpload3(file3);
    dto.setUpload4(file4);

    service.reviewUpdate(dto, file1, file2, file3, file4);
  }

  @PostMapping("/review/img/delete")
  public void reviewImgDelete(ReviewDto dto, int idx, String img_back) {
    service.reviewImgDelete(dto, idx, img_back);
  }

  @PostMapping("/review/delete")
  public void reviewDelete(@RequestBody int idx) {

    service.reviewDel(idx);
  }
}
