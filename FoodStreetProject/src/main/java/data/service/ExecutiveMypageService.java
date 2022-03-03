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

    String projectpath = "/home/tomcat/apache-tomcat-9.0.58/webapps/foodstreet/images";
    UUID uuid = UUID.randomUUID();

    int img_length = file.getOriginalFilename().length();

    if (img_length > 0) {
      String fileName = uuid + "_" + file.getOriginalFilename();
      File saveFile = new File(projectpath, fileName);
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

  public void updateStory(StoryDto dto, int num, MultipartFile file)
      throws IllegalStateException, IOException {

    String projectpath = "/home/tomcat/apache-tomcat-9.0.58/webapps/foodstreet/images";

    UUID uuid = UUID.randomUUID();


    String checkImg = mapper.findNumImg(num);

    if (!file.getOriginalFilename().equals("")) {
      if (checkImg != null) {
        File delFile = new File(projectpath, checkImg);
        delFile.delete();
      }
      String fileName = uuid + "_" + file.getOriginalFilename();
      File saveFile = new File(projectpath, fileName);
      file.transferTo(saveFile);

      dto.setThumbnail(fileName);
    } else {
      dto.setThumbnail(checkImg);
    }

    mapper.updateStory(dto);
  }

  public int storyDelete(int num) {

    String projectpath = "/home/tomcat/apache-tomcat-9.0.58/webapps/foodstreet/images";

    String checkImg = mapper.findNumImg(num);

    File delFile = new File(projectpath, checkImg);
    delFile.delete();

    return mapper.storyDelete(num);
  }

}
