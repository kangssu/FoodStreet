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
@Alias("rvdto")
public class ReviewDto {
  private int idx;
  private int num;
  private String id;
  private String comment;
  private MultipartFile upload1;
  private MultipartFile upload2;
  private MultipartFile upload3;
  private MultipartFile upload4;
  private String img_name1;
  private String img_name2;
  private String img_name3;
  private String img_name4;
  private Date reporting_date;
}
