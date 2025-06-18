package com.qly.service;

import com.qly.dto.InquiryDto;
import com.qly.mapper.InquiryMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class InquiryServiceImpl implements InquiryService {

    @Autowired
    private InquiryMapper mapper;

    @Override
    public void saveInquiry(InquiryDto dto) {
        mapper.insertInquiry(dto);
    }

    @Override
    public List<InquiryDto> getAllInquiries() {
        return mapper.selectAll();
    }

    @Override
    public InquiryDto getInquiryById(int id) {
        return mapper.selectById(id);
    }
}
