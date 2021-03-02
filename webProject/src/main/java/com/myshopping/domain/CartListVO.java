package com.myshopping.domain;

import lombok.Data;

@Data
public class CartListVO {
	private Long cart_code;
	private String userid;
	private int cart_stock;
	private Long product_code;
	
	private String product_name;
	private int product_price;
}
