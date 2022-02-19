package data.dto;

import java.util.Date;
import org.apache.ibatis.type.Alias;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
@Alias("frdto")
public class RequestReviewDto {

  // request dto
  private String food_store;
  private String place_name;

  // review dto
  private int idx;
  private String id;
  private String comment;
  private String img_name1;
  private String img_name2;
  private String img_name3;
  private String img_name4;
  private Date reporting_date;

}
