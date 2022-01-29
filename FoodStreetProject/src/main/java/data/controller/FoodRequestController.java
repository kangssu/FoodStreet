package data.controller;

import java.io.IOException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import data.dto.RequestDto;
import data.service.RequestService;

@Controller
public class FoodRequestController {

  private final RequestService service;

  public FoodRequestController(RequestService service) {
    this.service = service;
  }

  @GetMapping("/request")
  public String request() {
    return "/food_request/request_form";
  }

  @PostMapping("/request/success")
  public String insert(RequestDto dto, MultipartFile file)
      throws IllegalStateException, IOException {

    service.insertRequest(dto, file);
    return "/food_request/request_success";
  }

}
