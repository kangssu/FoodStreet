package data.service;

import java.util.List;
import org.springframework.stereotype.Service;
import data.dto.MemberDto;
import data.dto.RequestDto;
import data.mapper.MypageMapper;
import data.paging.Criteria;

@Service
public class MypageService {

  private final MypageMapper mapper;

  public MypageService(MypageMapper mapper) {
    this.mapper = mapper;
  }

  public List<RequestDto> getList(Criteria cri) {
    return mapper.getList(cri);
  }

  public int totalCount() {
    return mapper.totalCount();
  }

  public RequestDto getNumList(int num) {
    return mapper.getNumList(num);
  }

  public void requestUpdate(RequestDto dto) {
    mapper.requestUpdate(dto);
  }

  public int requestDel(int num) {
    return mapper.requestDel(num);
  }

  public List<MemberDto> getMemberList(Criteria cri) {
    return mapper.getMemberList(cri);
  }
}
