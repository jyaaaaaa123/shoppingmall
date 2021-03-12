package com.myshopping.mapper;

import java.util.List;

import com.myshopping.domain.QnaVO;

public interface QnaMapper {
	
	public List<QnaVO> realAllList();
	
	public List<QnaVO> readList(String userid);
	
	//create
	public void insert(QnaVO qna);
	
	//read
	public QnaVO read(Long qna_code);
	
	//update
	public int update(QnaVO qna);
	
	//delete
	public int delete(Long qna_code);
	
	//update reply complete
	public int updateReply(Long qna_code);
	
}
