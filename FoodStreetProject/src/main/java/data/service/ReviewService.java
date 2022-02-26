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

    String projectpath = "/home/tomcat/apache-tomcat-9.0.58/webapps/foodstreet/images";
    UUID uuid = UUID.randomUUID();

    if (!file1.getOriginalFilename().equals("")) {
      String fileName1 = uuid + "_" + file1.getOriginalFilename();
      File saveFile1 = new File(projectpath, fileName1);
      file1.transferTo(saveFile1);
      dto.setImg_name1(fileName1);
    } else {
      dto.setImg_name1(dto.getImg_name1());
    }

    if (!file2.getOriginalFilename().equals("")) {
      String fileName2 = uuid + "_" + file2.getOriginalFilename();
      File saveFile2 = new File(projectpath, fileName2);
      file2.transferTo(saveFile2);
      dto.setImg_name2(fileName2);
    } else {
      dto.setImg_name2(dto.getImg_name2());
    }

    if (!file3.getOriginalFilename().equals("")) {
      String fileName3 = uuid + "_" + file3.getOriginalFilename();
      File saveFile3 = new File(projectpath, fileName3);
      file3.transferTo(saveFile3);
      dto.setImg_name3(fileName3);
    } else {
      dto.setImg_name3(dto.getImg_name3());
    }

    if (!file4.getOriginalFilename().equals("")) {
      String fileName4 = uuid + "_" + file4.getOriginalFilename();
      File saveFile4 = new File(projectpath, fileName4);
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

    String projectpath = "/home/tomcat/apache-tomcat-9.0.58/webapps/foodstreet/images";
    UUID uuid = UUID.randomUUID();

    int idx = dto.getIdx();

    ReviewDto item = mapper.idxFindImg(idx);

    if (!file1.getOriginalFilename().equals("")) {
      String fileName = uuid + "_" + file1.getOriginalFilename();
      File saveFile = new File(projectpath, fileName);
      file1.transferTo(saveFile);
      dto.setImg_name1(fileName);
    } else if (file1.getOriginalFilename().equals("") && item != null) {
      dto.setImg_name1(item.getImg_name1());
    }

    if (!file2.getOriginalFilename().equals("")) {
      String fileName = uuid + "_" + file2.getOriginalFilename();
      File saveFile = new File(projectpath, fileName);
      file2.transferTo(saveFile);
      dto.setImg_name2(fileName);
    } else if (file2.getOriginalFilename().equals("") && item != null) {
      dto.setImg_name2(item.getImg_name2());
    }

    if (!file3.getOriginalFilename().equals("")) {
      String fileName = uuid + "_" + file3.getOriginalFilename();
      File saveFile = new File(projectpath, fileName);
      file3.transferTo(saveFile);
      dto.setImg_name3(fileName);
    } else if (file3.getOriginalFilename().equals("") && item != null) {
      dto.setImg_name3(item.getImg_name3());
    }

    if (!file4.getOriginalFilename().equals("")) {
      String fileName = uuid + "_" + file4.getOriginalFilename();
      File saveFile = new File(projectpath, fileName);
      file4.transferTo(saveFile);
      dto.setImg_name4(fileName);
    } else if (file4.getOriginalFilename().equals("") && item != null) {
      dto.setImg_name4(item.getImg_name4());
    }

    mapper.reviewUpdate(dto);
  }

  public void reviewImgDelete(ReviewDto dto, int idx, String img_back) {
    String projectpath = "/home/tomcat/apache-tomcat-9.0.58/webapps/foodstreet/images";

    ReviewDto item = mapper.idxFindImg(idx);

    if (img_back.equals(item.getImg_name1())) {
      File delFile = new File(projectpath, item.getImg_name1());
      delFile.delete();
    } else {
      dto.setImg_name1(item.getImg_name1());
    }

    if (img_back.equals(item.getImg_name2())) {
      File delFile = new File(projectpath, item.getImg_name2());
      delFile.delete();
    } else {
      dto.setImg_name2(item.getImg_name2());
    }

    if (img_back.equals(item.getImg_name3())) {
      File delFile = new File(projectpath, item.getImg_name3());
      delFile.delete();
    } else {
      dto.setImg_name3(item.getImg_name3());
    }

    if (img_back.equals(item.getImg_name4())) {
      File delFile = new File(projectpath, item.getImg_name4());
      delFile.delete();
    } else {
      dto.setImg_name4(item.getImg_name4());
    }

    mapper.reviewImgDelete(dto);
  }

  public int reviewDel(int idx) {

    String projectpath = "/home/tomcat/apache-tomcat-9.0.58/webapps/foodstreet/images";

    ReviewDto item = mapper.idxFindImg(idx);

    if (item.getImg_name1() != null) {
      File delFile1 = new File(projectpath, item.getImg_name1());
      delFile1.delete();
    } else if (item.getImg_name2() != null) {
      File delFile2 = new File(projectpath, item.getImg_name2());
      delFile2.delete();
    } else if (item.getImg_name3() != null) {
      File delFile3 = new File(projectpath, item.getImg_name3());
      delFile3.delete();
    } else if (item.getImg_name4() != null) {
      File delFile4 = new File(projectpath, item.getImg_name4());
      delFile4.delete();
    }

    return mapper.reviewDel(idx);
  }
}
