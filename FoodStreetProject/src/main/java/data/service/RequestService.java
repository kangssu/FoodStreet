package data.service;

import org.springframework.stereotype.Service;
import data.dto.RequestDto;
import data.mapper.RequestMapper;

@Service
public class RequestService {

  private final RequestMapper mapper;

  public RequestService(RequestMapper mapper) {
    this.mapper = mapper;
  }

  public void insertRequest(RequestDto dto) {
    mapper.insertRequest(dto);
  }
}
