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

  public void reviewInsert(ReviewDto dto) throws IllegalStateException, IOException {

    String projectpath = System.getProperty("user.dir") + "\\src\\main\\webapp\\images";
    String allprojectpath = projectpath.replaceAll("\\\\", "/");

    UUID uuid = UUID.randomUUID();

    String photoName = "";
    for (MultipartFile file : dto.getUpload()) {
      String fileName = uuid + "_" + file.getOriginalFilename();

      photoName += fileName + ",";

      File saveFile = new File(allprojectpath, fileName);

      file.transferTo(saveFile);
    }

    photoName = photoName.substring(0, photoName.length() - 1);

    dto.setImg_name(photoName);
    dto.setImg_path("/images/" + photoName);

    mapper.reviewInsert(dto);
  }

  public int reviewDel(int idx) {
    return mapper.reviewDel(idx);
  }
}
