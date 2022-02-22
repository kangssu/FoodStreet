package data.dto;

import java.util.Date;
import org.apache.ibatis.type.Alias;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
@Alias("mrdto")
public class MemberReviewDto {

  // member dto
  private String name;
  private String nickname;
  private String img_name;

  // review dto
  private int num;
  private int idx;
  private String id;
  private String comment;
  private String img_name1;
  private String img_name2;
  private String img_name3;
  private String img_name4;
  private Date reporting_date;
}
