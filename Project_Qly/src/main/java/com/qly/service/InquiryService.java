package com.qly.service;

import com.qly.dto.InquiryDto;
import java.util.List;

public interface InquiryService {
    void saveInquiry(InquiryDto dto);
    List<InquiryDto> getAllInquiries();
    InquiryDto getInquiryById(int id);
}
