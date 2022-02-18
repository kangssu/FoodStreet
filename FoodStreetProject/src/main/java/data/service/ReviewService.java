package data.service;

import java.io.File;
import java.io.IOException;
import java.util.UUID;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import data.dto.ReviewDto;
import data.mapper.ReviewMapper;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class ReviewService {

  private final ReviewMapper mapper;

  public void reviewInsert(ReviewDto dto, MultipartFile file1, MultipartFile file2,
      MultipartFile file3, MultipartFile file4) throws IllegalStateException, IOException {

    String projectpath = System.getProperty("user.dir") + "\\src\\main\\webapp\\images";
    String allprojectpath = projectpath.replaceAll("\\\\", "/");

    UUID uuid = UUID.randomUUID();
    String origin_file1 = file1.getOriginalFilename();
    String origin_file2 = file2.getOriginalFilename();
    String origin_file3 = file3.getOriginalFilename();
    String origin_file4 = file4.getOriginalFilename();

    if (!origin_file1.equals("")) {
      String fileName1 = uuid + "_" + file1.getOriginalFilename();
      File saveFile1 = new File(allprojectpath, fileName1);
      file1.transferTo(saveFile1);
      dto.setImg_name1(fileName1);
    } else {
      dto.setImg_name1(dto.getImg_name1());
    }

    if (!origin_file2.equals("")) {
      String fileName2 = uuid + "_" + file2.getOriginalFilename();
      File saveFile2 = new File(allprojectpath, fileName2);
      file2.transferTo(saveFile2);
      dto.setImg_name2(fileName2);
    } else {
      dto.setImg_name2(dto.getImg_name2());
    }

    if (!origin_file3.equals("")) {
      String fileName3 = uuid + "_" + file3.getOriginalFilename();
      File saveFile3 = new File(allprojectpath, fileName3);
      file3.transferTo(saveFile3);
      dto.setImg_name3(fileName3);
    } else {
      dto.setImg_name3(dto.getImg_name3());
    }

    if (!origin_file4.equals("")) {
      String fileName4 = uuid + "_" + file1.getOriginalFilename();
      File saveFile4 = new File(allprojectpath, fileName4);
      file4.transferTo(saveFile4);
      dto.setImg_name4(fileName4);
    } else {
      dto.setImg_name4(dto.getImg_name4());
    }

    mapper.reviewInsert(dto);
  }

  public ReviewDto reviewDetail(int idx) {
    return mapper.reviewDetail(idx);
  }

  public void reviewUpdate(ReviewDto dto, MultipartFile file1, MultipartFile file2,
      MultipartFile file3, MultipartFile file4) throws IllegalStateException, IOException {

    String projectpath = System.getProperty("user.dir") + "\\src\\main\\webapp\\images";
    String allprojectpath = projectpath.replaceAll("\\\\", "/");

    UUID uuid = UUID.randomUUID();
    String origin_file1 = file1.getOriginalFilename();
    String origin_file2 = file2.getOriginalFilename();
    String origin_file3 = file3.getOriginalFilename();
    String origin_file4 = file4.getOriginalFilename();

    int idx = dto.getIdx();

    ReviewDto item = mapper.idxFindImg(idx);

    if (!origin_file1.equals("")) {
      String fileName1 = uuid + "_" + file1.getOriginalFilename();
      File saveFile1 = new File(allprojectpath, fileName1);
      file1.transferTo(saveFile1);
      dto.setImg_name1(fileName1);
    } else if (origin_file1.equals("") && item != null) {
      dto.setImg_name1(item.getImg_name1());
    }

    if (!origin_file2.equals("")) {
      String fileName2 = uuid + "_" + file2.getOriginalFilename();
      File saveFile2 = new File(allprojectpath, fileName2);
      file2.transferTo(saveFile2);
      dto.setImg_name2(fileName2);
    } else if (origin_file2.equals("") && item != null) {
      dto.setImg_name2(item.getImg_name2());
    }

    if (!origin_file3.equals("")) {
      String fileName3 = uuid + "_" + file3.getOriginalFilename();
      File saveFile3 = new File(allprojectpath, fileName3);
      file3.transferTo(saveFile3);
      dto.setImg_name3(fileName3);
    } else if (origin_file3.equals("") && item != null) {
      dto.setImg_name3(item.getImg_name3());
    }

    if (!origin_file4.equals("")) {
      String fileName4 = uuid + "_" + file1.getOriginalFilename();
      File saveFile4 = new File(allprojectpath, fileName4);
      file4.transferTo(saveFile4);
      dto.setImg_name4(fileName4);
    } else if (origin_file4.equals("") && item != null) {
      dto.setImg_name4(item.getImg_name4());
    }

    mapper.reviewUpdate(dto);
  }

  public void reviewImgDelete(ReviewDto dto, int idx, String img_back) {
    ReviewDto item = mapper.idxFindImg(idx);
    System.out.println("넘어온 이미지 값 : " + img_back + " 기존 이미지 값 : " + item.getImg_name1());
    System.out.println("넘어온 이미지 값 : " + img_back + " 기존 이미지 값 : " + item.getImg_name2());
    System.out.println("넘어온 이미지 값 : " + img_back + " 기존 이미지 값 : " + item.getImg_name3());
    System.out.println("넘어온 이미지 값 : " + img_back + " 기존 이미지 값 : " + item.getImg_name4());

    if (img_back.equals(item.getImg_name1())) {
      dto.setImg_name1("");
      System.out.println("1");
    } else {
      dto.setImg_name1(item.getImg_name1());
      System.out.println("2");
    }

    if (img_back.equals(item.getImg_name2())) {
      dto.setImg_name2("");
      System.out.println("3");
    } else {
      dto.setImg_name2(item.getImg_name2());
      System.out.println("4");
    }

    if (img_back.equals(item.getImg_name3())) {
      dto.setImg_name3("");
      System.out.println("5");
    } else {
      dto.setImg_name3(item.getImg_name3());
      System.out.println("6");
    }

    if (img_back.equals(item.getImg_name4())) {
      dto.setImg_name4("");
      System.out.println("7");
    } else {
      dto.setImg_name4(item.getImg_name4());
      System.out.println("8");
    }

    mapper.reviewImgDelete(dto);
  }

  public int reviewDel(int idx) {
    return mapper.reviewDel(idx);
  }
}
