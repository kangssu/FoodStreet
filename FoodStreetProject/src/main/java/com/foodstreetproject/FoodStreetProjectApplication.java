package com.foodstreetproject;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan({"data.*", "com.foodstreetproject"})
@MapperScan("data.*")
public class FoodStreetProjectApplication {

  public static void main(String[] args) {
    SpringApplication.run(FoodStreetProjectApplication.class, args);
  }

}
