package com.myshopping.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.myshopping.domain.QnaVO;
import com.myshopping.mapper.ProductMapper;
import com.myshopping.mapper.QnaMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class QnaServiceImpl implements QnaService {
	
	private QnaMapper mapper;
	
	@Override
	public List<QnaVO> read(String userid) {
		return mapper.readList(userid);
	}

}
