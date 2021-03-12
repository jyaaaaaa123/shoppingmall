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
	public List<QnaVO> realAllList() {
		return mapper.realAllList();
	}
	
	@Override
	public List<QnaVO> read(String userid) {
		return mapper.readList(userid);
	}

	@Override
	public void create(QnaVO qna) {
		mapper.insert(qna);
	}

	@Override
	public void modify(QnaVO qna) {
		mapper.update(qna);
	}

	@Override
	public void remove(Long qna_code) {
		mapper.delete(qna_code);
	}

	@Override
	public QnaVO get(Long qna_code) {
		return mapper.read(qna_code);
	}

	@Override
	public int updateReply(Long qna_code) {
		return mapper.updateReply(qna_code);
	}

}
