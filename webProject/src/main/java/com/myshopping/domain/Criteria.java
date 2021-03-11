package com.myshopping.domain;

import lombok.Data;

@Data
public class Criteria {
	
	private int pageNum;
	private int amount;
	
	private String type;
	
	public Criteria() {
		this(1, 5, "sortRegi");
	}
	
	public Criteria(int pageNum, int amount, String type) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.type = type;
	}
	
}


