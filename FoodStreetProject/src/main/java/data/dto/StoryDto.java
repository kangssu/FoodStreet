package data.dto;

import java.util.Date;
import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
@Alias("sdto")
public class StoryDto {

  private int num;
  private String id;
  private String title;
  private String content;
  private MultipartFile upload;
  private String thumbnail;
  private Date reporting_date;
}
