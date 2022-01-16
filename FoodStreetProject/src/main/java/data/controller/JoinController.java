package data.controller;

import java.io.IOException;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import data.dto.MemberDto;
import data.service.MemberService;

@Controller
public class JoinController {

  private final MemberService service;

  @Autowired
  public JoinController(MemberService service) {
    this.service = service;
  }

  @GetMapping("/join")
  public String join() {
    return "/users/join";
  }

  @GetMapping("/join/form")
  public String form() {
    return "/users/join_form";
  }

  // 회원가입
  @PostMapping("/join/success")
  public String insert(@Valid MemberDto dto, Errors errors, Model model,
      HttpServletResponse response) throws IOException {

    if (errors.hasErrors()) {
      // 회원가입 실패시 작성한 정보 유지!
      model.addAttribute("MemberDto", dto);

      // 유효성 실패한 항목들에 대한 메세지!
      Map<String, String> validatorResult = service.validateHandling(errors);
      for (String key : validatorResult.keySet()) {
        model.addAttribute(key, validatorResult.get(key));
      }
      return "/users/join_form";
    }

    service.insertMember(dto);
    return "/users/join_success";
  }

  @ResponseBody
  @RequestMapping("/join/idCheck")
  public int idCheck(@RequestBody String id) {

    int count = service.idCheck(id);

    return count;
  }

}
