package com.myshopping.domain;

import lombok.Data;

@Data
public class ProductVO {
	
	private Long product_code;
	private String product_ctgr;
	private String product_name;
	private Long product_price;
	private String product_explain;
	private int product_stock;
	private int product_sales;
}
