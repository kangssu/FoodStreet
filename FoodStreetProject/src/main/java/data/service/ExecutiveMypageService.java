package data.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import data.dto.StoryDto;
import data.mapper.ExecutiveMypageMapper;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class ExecutiveMypageService {

  private final ExecutiveMypageMapper mapper;

  public void insertStory(StoryDto dto, MultipartFile file)
      throws IllegalStateException, IOException {

    String projectpath = System.getProperty("user.dir") + "\\src\\main\\webapp\\images";
    String allprojectpath = projectpath.replaceAll("\\\\", "/");
    UUID uuid = UUID.randomUUID();

    String origin_img = file.getOriginalFilename();

    if (origin_img != "") {
      String fileName = uuid + "_" + file.getOriginalFilename();
      File saveFile = new File(allprojectpath, fileName);
      file.transferTo(saveFile);

      dto.setThumbnail(fileName);
    }

    mapper.insertStory(dto);
  }

  public List<StoryDto> storyList(String id) {
    return mapper.storyList(id);
  }

  public int totalCount(String id) {
    return mapper.totalCount(id);
  }

  public StoryDto storyGetView(int num) {
    return mapper.storyGetView(num);
  }

  public void updateStory(StoryDto dto, MultipartFile file)
      throws IllegalStateException, IOException {

    String projectpath = System.getProperty("user.dir") + "\\src\\main\\webapp\\images";
    String allprojectpath = projectpath.replaceAll("\\\\", "/");
    UUID uuid = UUID.randomUUID();

    String origin_img = file.getOriginalFilename();

    if (origin_img != "") {
      String fileName = uuid + "_" + file.getOriginalFilename();
      File saveFile = new File(allprojectpath, fileName);
      file.transferTo(saveFile);

      dto.setThumbnail(fileName);
    }

    mapper.updateStory(dto);
  }

  public int storyDelete(int num) {
    return mapper.storyDelete(num);
  }

}
