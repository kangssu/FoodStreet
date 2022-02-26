package com.foodstreetproject;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan({"data.*", "com.foodstreetproject"})
@MapperScan("data.*")
public class FoodStreetProjectApplication extends SpringBootServletInitializer {



  @Override
  protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
    // WAR packaging
    return super.configure(builder);
  }

  public static void main(String[] args) {
    SpringApplication.run(FoodStreetProjectApplication.class, args);
  }


}
