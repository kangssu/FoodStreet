package data.oauth;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;
import data.dto.MemberDto;
import data.dto.Role;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Component
public class OAuth2LoginSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {

  private final OAuth2JoinService service;
  private final HttpSession session;

  @Override
  public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
      Authentication authentication) throws IOException, ServletException {

    CustomOAuth2User OAuth2User = (CustomOAuth2User) authentication.getPrincipal();

    String email = OAuth2User.getEmail();
    String name = OAuth2User.getName();

    MemberDto member = service.findEmailMember(email);

    if (member == null) {
      service.createNewMember(email, name, Role.SOCIAL);
      MemberDto again_member = service.findEmailMember(email);
      session.setAttribute("member", again_member);
      System.out.println("로그인 + 회원가입 성공");
    } else {
      // 여기에 업데이트 넣으면됨!
      session.setAttribute("member", member);
      System.out.println("로그인 + 기존 회원(업데이트 성공)");
    }

    System.out.println("이메일 확인 " + email);

    super.onAuthenticationSuccess(request, response, authentication);
  }
}
