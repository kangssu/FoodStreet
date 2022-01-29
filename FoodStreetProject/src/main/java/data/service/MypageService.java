package data.service;

import java.util.List;
import org.springframework.stereotype.Service;
import data.dto.RequestDto;
import data.mapper.MypageMapper;

@Service
public class MypageService {

  private final MypageMapper mapper;

  public MypageService(MypageMapper mapper) {
    this.mapper = mapper;
  }

  public List<RequestDto> getList() {
    return mapper.getList();
  }
}
