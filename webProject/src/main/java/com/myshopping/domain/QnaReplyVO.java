package com.myshopping.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class QnaReplyVO {
	
	private Long qna_code;
	private Long qna_reply_code;
	private String qna_reply_title;
	private String qna_reply;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date qna_replydate;
	
}
