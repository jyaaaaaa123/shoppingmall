package com.myshopping.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ProductCommentVO {
	private Long product_code;
	private String product_ctgr;
	private String product_name;
	private Long product_price;
	private String product_explain;
	private int product_stock;
	private int product_sales;
	
	private Long comment_code;
	private String userid;
	private String comment_content;
	private int comment_star;
	private Date comment_regdate;
	private Long order_product_code;
}
