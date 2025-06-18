package com.qly.mapper;

import com.qly.dto.InquiryDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface InquiryMapper {
    void insertInquiry(InquiryDto dto);
    List<InquiryDto> selectAll();
    InquiryDto selectById(int id);
}
