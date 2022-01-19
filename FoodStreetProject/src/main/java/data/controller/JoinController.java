package data.controller;

import java.io.IOException;
import java.util.Map;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import data.dto.MemberDto;
import data.service.MemberService;
import data.validator.IdCheckValidator;
import data.validator.NicknameCheckValidator;

@Controller
public class JoinController {

  private final MemberService service;
  private final IdCheckValidator idValidator;
  private final NicknameCheckValidator nicknameValidator;

  @Autowired
  public JoinController(MemberService service, IdCheckValidator idValidator,
      NicknameCheckValidator nicknameValidator) {
    this.service = service;
    this.idValidator = idValidator;
    this.nicknameValidator = nicknameValidator;
  }

  // 커스텀 유효성 검사!
  @InitBinder
  public void validatorBinder(WebDataBinder binder) {
    binder.addValidators(idValidator);
    binder.addValidators(nicknameValidator);
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
  public String insert(String id, @Valid MemberDto dto, Errors errors, Model model)
      throws IOException {

    // 유효성 검사
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

  // 아이디 중복확인
  @ResponseBody
  @RequestMapping("/idCheck")
  public int idCheck(@RequestBody String id) {

    int cnt = service.idCheck(id);
    return cnt;
  }

  // 닉네임 중복확인
  @ResponseBody
  @RequestMapping("/nicknameCheck")
  public int nicknameCheck(@RequestBody String nickname) {

    int cnt = service.nicknameCheck(nickname);
    return cnt;
  }

  // 이메일 중복확인
  @ResponseBody
  @RequestMapping("/emailCheck")
  public int emailCheck(@RequestBody String email) {

    int cnt = service.emailCheck(email);
    return cnt;
  }
}
