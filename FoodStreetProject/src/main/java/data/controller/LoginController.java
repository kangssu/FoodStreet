package data.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import data.dto.MemberDto;
import data.service.LoginService;

@Controller
public class LoginController {

  private final LoginService service;
  private final BCryptPasswordEncoder pwdEncoder;

  public LoginController(LoginService service, BCryptPasswordEncoder pwdEncoder) {
    this.service = service;
    this.pwdEncoder = pwdEncoder;
  }

  @GetMapping("/login")
  public String login() {
    return "/users/login";
  }

  // 로그인
  @PostMapping("/login/success")
  public void success(MemberDto dto, HttpSession session, HttpServletResponse response)
      throws IOException {

    // session.getAttribute("member");

    MemberDto login = service.login(dto);
    boolean pwMatch = pwdEncoder.matches(dto.getPw(), login.getPw());
    System.out.println("로그인 : " + login + " 일치여부 : " + pwMatch);

    if (login != null && pwMatch == true) {
      session.setAttribute("member", login);

      response.setContentType("text/html; charset=UTF-8");
      PrintWriter out = response.getWriter();
      out.println("<script>location.href='/';</script>");
      System.out.println("로그인성공");
    } else {
      session.setAttribute("member", null);
      response.setContentType("text/html; charset=UTF-8");

      PrintWriter out = response.getWriter();
      out.println(
          "<script>alert('아이디 또는 비밀번호를 다시 한번 확인해 주시기 바랍니다.'); location.href='/login';</script>");
      System.out.println("로그인실패");
    }
  }

  // 로그아웃
  @GetMapping("/logout/success")
  public String logout(HttpSession session) {
    session.removeAttribute("member");
    System.out.println("로그아웃성공");
    return "redirect:/";
  }
}
