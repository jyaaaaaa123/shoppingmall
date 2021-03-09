package com.myshopping.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.myshopping.domain.QnaReplyVO;
import com.myshopping.mapper.QnaReplyMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Service
@AllArgsConstructor
@Log4j
public class QnaReplyServiceImpl implements QnaReplyService {
	
	
	private QnaReplyMapper mapper;
	
	
	@Override
	public QnaReplyVO getByQnaCode(Long qna_code) {
		return mapper.getByQnaCode(qna_code);
	}

	@Override
	public int register(QnaReplyVO qnaReply) {
		return mapper.create(qnaReply);
	}

	@Override
	public QnaReplyVO get(Long qna_reply_code) {
		return mapper.read(qna_reply_code);
	}

	@Override
	public void modify(Long qna_reply_code) {
		mapper.update(qna_reply_code);
	}

	@Override
	public void remove(Long qna_reply_code) {
		mapper.delete(qna_reply_code);
	}

}
