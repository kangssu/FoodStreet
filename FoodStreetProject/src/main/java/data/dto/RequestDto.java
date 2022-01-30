package data.dto;

import java.util.Date;
import org.apache.ibatis.type.Alias;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Alias("rdto")
public class RequestDto {

  private int num;
  private String name;
  private String food_store;
  private String place_name;
  private String address1;
  private String address2;
  private String hp;
  private String type_of_food;
  private String price;
  private String store_time;
  private String img_name;
  private String img_path;
  private String menu;
  private String comment;
  private String reason;
  private Date reporting_date;
  private String state;
}
