package data.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import data.oauth.CustomOAuth2UserService;
import data.oauth.OAuth2LoginSuccessHandler;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

  private final CustomOAuth2UserService OAuth2UserService;

  private final OAuth2LoginSuccessHandler OAuth2LoginSuccessHandler;

  @Bean
  public PasswordEncoder passwordEncoder() {
    return new BCryptPasswordEncoder();
  }

  @Override
  protected void configure(HttpSecurity http) throws Exception {
    http.csrf().disable().cors().disable().authorizeRequests().antMatchers("/oauth2/**").permitAll()
        .anyRequest().permitAll().and().oauth2Login().loginPage("/login").userInfoEndpoint()
        .userService(OAuth2UserService).and()
        .successHandler((AuthenticationSuccessHandler) OAuth2LoginSuccessHandler);
  }
}
