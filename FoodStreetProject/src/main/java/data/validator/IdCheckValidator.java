package data.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import data.dto.MemberDto;
import data.mapper.MemberMapper;

@Component
public class IdCheckValidator extends AbstractValidator<MemberDto> {

  private final MemberMapper mapper;

  public IdCheckValidator(MemberMapper mapper) {
    this.mapper = mapper;
  }

  @Override
  protected void doValidate(MemberDto dto, Errors errors) {

    if (mapper.existsById(dto.getId())) {
      errors.rejectValue("id", "아이디 중복 오류", "중복된 아이디입니다.");
    }

  }

}
