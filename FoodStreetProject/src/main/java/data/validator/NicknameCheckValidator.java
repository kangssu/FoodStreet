package data.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import data.dto.MemberDto;
import data.mapper.MemberMapper;

@Component
public class NicknameCheckValidator extends AbstractValidator<MemberDto> {

  private final MemberMapper mapper;

  public NicknameCheckValidator(MemberMapper mapper) {
    this.mapper = mapper;
  }

  @Override
  protected void doValidate(MemberDto dto, Errors errors) {

    if (mapper.existsByNickname(dto.getNickname())) {
      errors.rejectValue("nickname", "닉네임 중복 오류", "중복된 닉네임입니다.");
    }
  }
}
