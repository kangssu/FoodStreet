package data.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import data.dto.MemberDto;
import data.mapper.MemberMapper;

@Service
public class MemberService {

  private final MemberMapper mapper;

  @Autowired
  public MemberService(MemberMapper mapper) {
    this.mapper = mapper;
  }

  public void insertMember(MemberDto dto) {
    mapper.insertMember(dto);
  }

}
