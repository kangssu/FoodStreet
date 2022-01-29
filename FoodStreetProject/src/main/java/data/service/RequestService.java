package data.service;

import java.io.File;
import java.io.IOException;
import java.util.UUID;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import data.dto.RequestDto;
import data.mapper.RequestMapper;

@Service
public class RequestService {

  private final RequestMapper mapper;

  public RequestService(RequestMapper mapper) {
    this.mapper = mapper;
  }

  public void insertRequest(RequestDto dto, MultipartFile file)
      throws IllegalStateException, IOException {

    String projectpath = System.getProperty("user.dir") + "\\src\\main\\resources\\static\\photo";
    UUID uuid = UUID.randomUUID();

    String fileName = uuid + "_" + file.getOriginalFilename();

    File saveFile = new File(projectpath, fileName);

    file.transferTo(saveFile);

    dto.setImg_name(fileName);
    dto.setImg_path("/photo/" + fileName);

    mapper.insertRequest(dto);
  }
}
