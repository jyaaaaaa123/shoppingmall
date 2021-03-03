package com.myshopping.mapper;

import java.util.List;

import com.myshopping.domain.CommentVO;

public interface CommentMapper {
	
	//byProduct
	public List<CommentVO> getCommentByProduct(String product_code);
	
	//byOrderProduct
	public List<CommentVO> getCommentByOrder(String order_product_code);
	
	//insert
	public void insertComment(CommentVO comment);
	
}
