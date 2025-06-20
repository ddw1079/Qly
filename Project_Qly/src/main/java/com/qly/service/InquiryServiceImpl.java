package com.qly.service;

import com.qly.dto.InquiryDto;
import com.qly.mapper.InquiryMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class InquiryServiceImpl implements InquiryService {

	@Autowired
	private InquiryMapper inquiryMapper;

	@Override
	public void insertInquiry(InquiryDto dto) {
		inquiryMapper.insertInquiry(dto);
	}

	@Override
	public List<InquiryDto> getInquiriesByUserId(int userId) {
		return inquiryMapper.selectByUserId(userId); // int → String
	}

	@Override
	public InquiryDto getInquiryById(int questionId) {
		return inquiryMapper.selectById(questionId);
	}

	@Override
	public void saveInquiry(InquiryDto dto) {
		inquiryMapper.insertInquiry(dto); // save = insert
	}

	@Override
	public List<InquiryDto> getAllInquiries() {
		return inquiryMapper.selectAll();
	}
}
