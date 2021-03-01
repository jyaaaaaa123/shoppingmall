package com.myshopping.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CartVO {
	
	private Long cart_code;
	private String userid;
	private Long product_code;
	private int cart_stock;
	private Date cart_date;
	
}
