package com.myshopping.service;

import java.util.List;

import com.myshopping.domain.QnaVO;

public interface QnaService {
	
	public List<QnaVO> realAllList();
	
	public List<QnaVO> read(String userid);
	
	public void create(QnaVO qna);
	
	public QnaVO get(Long qna_code);
	
	public void modify(QnaVO qna);
	
	public void remove(Long qna_code);
	
	public int updateReply(Long qna_code);
}
