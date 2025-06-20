package com.qly.mapper;

import com.qly.dto.InquiryDto;
import com.qly.dto.UserDto;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface InquiryMapper {
    void insertInquiry(InquiryDto dto);                     // 1:1 占쏙옙占쏙옙 占쏙옙占�
    List<InquiryDto> selectAll();                           // 占쏙옙체 占쏙옙占쏙옙 占쏙옙회 (占쏙옙占쏙옙占쌘울옙)
    InquiryDto selectById(int questionId);               // 占쏙옙占쏙옙 占쏙옙 占쏙옙회
    List<InquiryDto> selectByUserId(int userId);            // 占쏙옙占쏙옙占� ID占쏙옙 占쏙옙占쏙옙 占쏙옙占� 占쏙옙회
    void insertQustion(InquiryDto dto);
    
}
