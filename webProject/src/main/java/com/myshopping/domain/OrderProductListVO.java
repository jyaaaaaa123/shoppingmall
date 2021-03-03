package com.myshopping.domain;

import java.util.Date;

import lombok.Data;

@Data
public class OrderProductListVO {
	
	private String order_code;
	private String userid;
	private String order_address;
	private int order_allprice;
	private Date order_day;
	private boolean order_complete;
	private String order_name;
	private String order_phone;
	
	private Long order_product_code;
	private Long product_code;
	private int order_product_stock;
	private boolean order_product_comment;
	
	
	private String product_ctgr;
	private String product_name;
	private Long product_price;
	private String product_explain;
	private int product_stock;
	private int product_sales;
	
}
