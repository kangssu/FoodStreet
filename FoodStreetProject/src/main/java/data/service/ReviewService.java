package data.service;

import org.springframework.stereotype.Service;
import data.dto.ReviewDto;
import data.mapper.ReviewMapper;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class ReviewService {

  private final ReviewMapper mapper;

  public void reviewInsert(ReviewDto dto) {
    mapper.reviewInsert(dto);
  }
}
