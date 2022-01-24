package data.oauth;

import java.util.Map;
import lombok.Builder;
import lombok.Getter;

@Builder
@Getter
public class OAuthAttributes {

  private Map<String, Object> attributes;
  private String nameAttributeKey;
  private String name;
  private String email;
  private String nickname;
  private String picture;

  public static OAuthAttributes of(String registrationId, String userNameAttributeName,
      Map<String, Object> attributes) {

    if ("naver".equals(registrationId)) {
      return ofNaver("id", attributes);
    }
    return ofGoogle(userNameAttributeName, attributes);
  }

  private static OAuthAttributes ofGoogle(String userNameAttributeName,
      Map<String, Object> attributes) {
    return OAuthAttributes.builder().name((String) attributes.get("email"))
        .email((String) attributes.get("email")).nickname((String) attributes.get("nickname"))
        .picture((String) attributes.get("picture")).attributes(attributes)
        .nameAttributeKey(userNameAttributeName).build();
  }

  @SuppressWarnings("unchecked")
  private static OAuthAttributes ofNaver(String userNameAttributeName,
      Map<String, Object> attributes) {
    Map<String, Object> response = (Map<String, Object>) attributes.get("response");

    return OAuthAttributes.builder().name((String) response.get("email"))
        .email((String) response.get("email")).nickname((String) response.get("nickname"))
        .picture((String) response.get("picture")).attributes(response)
        .nameAttributeKey(userNameAttributeName).build();
  }
}
