package data.oauth;

import javax.servlet.http.HttpSession;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

@Service
public class CustomOAuth2UserService extends DefaultOAuth2UserService {

  private final HttpSession session;

  public CustomOAuth2UserService(HttpSession session) {
    this.session = session;
  }

  @Override
  public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
    OAuth2User user = super.loadUser(userRequest);
    System.out.println("getClientRegistration : " + userRequest.getClientRegistration());
    System.out.println("getAccessToken : " + userRequest.getAccessToken().getTokenValue());
    System.out.println("getAttribute : " + super.loadUser(userRequest).getAttributes());
    session.setAttribute("user", user);
    return new CustomOAuth2User(user);
  }
}
