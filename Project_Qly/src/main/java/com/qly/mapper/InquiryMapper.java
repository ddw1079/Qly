package com.qly.mapper;

import com.qly.dto.InquiryDto;
import com.qly.dto.UserDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface InquiryMapper {
    void insertInquiry(InquiryDto dto);                     // 1:1 문의 등록
    List<InquiryDto> selectAll();                           // 전체 문의 목록 조회 (관리자용)
    InquiryDto selectById(String questionId);               // 문의 상세 조회
    List<InquiryDto> selectByUserId(int userId);            // 사용자 ID로 해당 사용자 문의 조회
    void insertQustion(InquiryDto dto);                     // 관리자 답변 등록
}
