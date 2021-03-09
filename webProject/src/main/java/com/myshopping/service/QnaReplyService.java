package com.myshopping.service;

import java.util.List;

import com.myshopping.domain.QnaReplyVO;

public interface QnaReplyService {
	
	public QnaReplyVO getByQnaCode(Long qna_code);
	
	public int register(QnaReplyVO qnaReply);
	
	public QnaReplyVO get(Long qna_reply_code);
	
	public void modify(Long qna_reply_code);
	
	public void remove(Long qna_reply_code);
}
