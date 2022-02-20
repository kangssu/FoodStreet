package data.dto;

import java.util.Date;
import org.apache.ibatis.type.Alias;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
@Alias("msdto")
public class MemberStoryDto {

  // member dto
  private String nickname;
  private String img_name;

  // story dto
  private int num;
  private String id;
  private String title;
  private String content;
  private String thumbnail;
  private Date reporting_date;
}
