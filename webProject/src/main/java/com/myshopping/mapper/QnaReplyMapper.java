package com.myshopping.mapper;

import java.util.List;

import com.myshopping.domain.QnaReplyVO;

public interface QnaReplyMapper {
	
	public QnaReplyVO getByQnaCode(Long qna_code);
	
	public int create(QnaReplyVO qnaReply);
	
	public QnaReplyVO read(Long qna_reply_code);
	
	public void update(Long qna_reply_code);
	
	public void delete(Long qna_reply_code);
}
