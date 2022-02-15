package data.dto;

import java.util.Date;
import java.util.List;
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
  private List<MultipartFile> upload;
  private String img_name;
  private String img_path;
  private Date reporting_date;
}
