package com.myshopping.mapper;

import java.util.List;

import com.myshopping.domain.CommentVO;
import com.myshopping.domain.ProductCommentVO;

public interface CommentMapper {
	
	//byProduct
	public List<CommentVO> getCommentByProduct(Long product_code);
	
	//byOrderProduct
	public List<CommentVO> getCommentByOrder(Long order_product_code);
	
	//insert
	public void insertComment(CommentVO comment);
	
	//read
	public CommentVO readComment(Long comment_code);
	
	//update 
	public int updateComment(Long comment_code);
	
	//delete
	public int deleteComment(Long comment_code);
}
