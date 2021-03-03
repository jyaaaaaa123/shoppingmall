package com.myshopping.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CommentVO {
	
	private Long product_code;
	private Long comment_code;
	private String userid;
	private String comment_content;
	private int comment_star;
	private Date comment_regdate;
	private Long order_product_code;
	
}
