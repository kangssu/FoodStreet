package data.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import data.dto.MemberDto;

@Component
public class PwCheckValidator extends AbstractValidator<MemberDto> {

  @Override
  protected void doValidate(MemberDto dto, Errors errors) {

    if (!dto.getPw().equals(dto.getPw_check())) {
      errors.rejectValue("pw_check", "패스워드 불일치", "일치하지 않습니다.");
    }
  }
}
