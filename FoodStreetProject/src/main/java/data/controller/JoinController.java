package data.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
  @PostMapping("/join/insert")
  public void insert(@Valid MemberDto dto, HttpServletResponse response) throws IOException {

    service.insertMember(dto);

    response.setContentType("text/html; charset=UTF-8");
    PrintWriter out = response.getWriter();
    out.println("<script>alert('회원가입 되었습니다!'); location.href='/login';</script>");
    out.flush();
  }
}
