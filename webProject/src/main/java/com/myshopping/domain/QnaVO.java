package com.myshopping.domain;

import java.util.Date;

import lombok.Data;

@Data
public class QnaVO {
	
	private Long qna_code;
	private String qna_title;
	private String qna_content;
	private String userid;
	private Date qna_date;

}
