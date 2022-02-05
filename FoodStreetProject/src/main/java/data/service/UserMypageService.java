package data.service;

import org.springframework.stereotype.Service;
import data.dto.MemberDto;
import data.mapper.UserMypageMapper;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class UserMypageService {

  private final UserMypageMapper mapper;

  public MemberDto getIdFind(String id) {
    return mapper.getIdFind(id);
  }
}
