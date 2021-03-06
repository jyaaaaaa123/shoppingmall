package com.myshopping.domain;

import lombok.Data;

@Data
public class ProductImageVO {
	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;
	
	private Long product_code;
}
