package com.qly.service;

import com.qly.dto.InquiryDto;
import java.util.List;

public interface InquiryService {
    void saveInquiry(InquiryDto dto);                  // 저장
    List<InquiryDto> getAllInquiries();                // 전체 조회
    InquiryDto getInquiryById(int questionId);      // ID로 조회
    void insertInquiry(InquiryDto dto);                // 등록
    List<InquiryDto> getInquiriesByUserId(int userId); // 사용자별 목록
    void insertQustion(InquiryDto dto);   // 관리자 답변
}
