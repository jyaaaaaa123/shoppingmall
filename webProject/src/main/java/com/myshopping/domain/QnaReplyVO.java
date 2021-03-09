package com.myshopping.domain;

import java.util.Date;

import lombok.Data;

@Data
public class QnaReplyVO {
	
	private Long qna_code;
	private Long qna_reply_code;
	
	private String qna_reply;
	private Date qna_replydate;
	
}
