package data.dto;

import java.util.ArrayList;
import java.util.Date;
import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Alias("rdto")
public class RequestDto {

  private int num;
  private String id;
  private String name;
  private String food_store;
  private String place_name;
  private String address1;
  private String address2;
  private String hp;
  private String type_of_food;
  private String price;
  private String store_time;
  private ArrayList<MultipartFile> upload;
  private String img_name;
  private String img_path;
  private String menu;
  private String comment;
  private String reason;
  private Date reporting_date;
  private String state;

  @Override
  public String toString() {
    return "RequestDto [num=" + num + ", id=" + id + ", name=" + name + ", food_store=" + food_store
        + ", place_name=" + place_name + ", address1=" + address1 + ", address2=" + address2
        + ", hp=" + hp + ", type_of_food=" + type_of_food + ", price=" + price + ", store_time="
        + store_time + ", img_name=" + img_name + ", img_path=" + img_path + ", menu=" + menu
        + ", comment=" + comment + ", reason=" + reason + ", reporting_date=" + reporting_date
        + ", state=" + state + "]";
  }
}
