package data.service;

import java.io.File;
import java.util.List;
import org.springframework.stereotype.Service;
import data.dto.MemberDto;
import data.dto.RequestDto;
import data.mapper.AdminMypageMapper;
import data.paging.Criteria;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class AdminMypageService {

  private final AdminMypageMapper mapper;

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

    String projectpath = "/home/tomcat/apache-tomcat-9.0.58/webapps/foodstreet/images";

    String allImage = mapper.numFindImg(num);

    File delFile = new File(projectpath, allImage);
    delFile.delete();

    return mapper.requestDel(num);
  }

  public List<MemberDto> getExecutiveList(Criteria cri) {
    return mapper.getExecutiveList(cri);
  }

  public int totalExecutiveCount() {
    return mapper.totalExecutiveCount();
  }

  public MemberDto executiveNumList(int num) {
    return mapper.executiveNumList(num);
  }

  public int executiveDel(int num) {
    return mapper.executiveDel(num);
  }
}
