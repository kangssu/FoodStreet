package data.service;

import java.util.List;
import org.springframework.stereotype.Service;
import data.dto.MemberDto;
import data.dto.RequestDto;
import data.mapper.UserMypageMapper;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class UserMypageService {

  private final UserMypageMapper mapper;

  public MemberDto getNumFind(int num) {
    return mapper.getNumFind(num);
  }

  public String getImg(String id) {
    return mapper.getImg(id);
  }

  public List<RequestDto> getIdList(String id, int start, int end) {
    return mapper.getIdList(id, start, end);
  }

  public List<RequestDto> noPageList(String id) {
    return mapper.noPageList(id);
  }

  public RequestDto numRequestView(int num) {
    return mapper.numRequestView(num);
  }

  public int totalCount(String id) {
    return mapper.totalCount(id);
  }

  public int requestDel(int num) {
    return mapper.requestDel(num);
  }
}
