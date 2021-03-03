package com.myshopping.domain;

import lombok.Data;

@Data
public class OrderProductVO {
	
	private Long order_product_code;
	private Long product_code;
	private String order_code;
	private int order_product_stock;
	private String userid;
	private boolean order_product_comment;
}
