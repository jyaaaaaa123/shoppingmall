package com.myshopping.service;

import java.util.List;

import com.myshopping.domain.CartListVO;
import com.myshopping.domain.CartVO;
import com.myshopping.domain.CommentVO;
import com.myshopping.domain.OrderProductListVO;
import com.myshopping.domain.OrderProductVO;
import com.myshopping.domain.OrderVO;

public interface OrderService {
	
	//Cart
	public void insertCart(CartVO cart);
	
	public List<CartListVO> getListCart(String userid);
	
	public void deleteCart(Long cart_code);
	
	public void deleteAllCart(String userid);
	
	//Order
	public void insertOrder(OrderVO order);
	
	public void insertOrderProduct(OrderProductVO orderProduct);
	
	public OrderVO getOrder(String order_code);
	
	public List<OrderProductListVO> getAllOrderList();
	
	public List<OrderVO> getOrderList(String userid);
	
	public List<OrderProductVO> getOrderProductList(String order_code);
	
	public List<OrderProductListVO> getOrderSelectList(String order_code);
	
	public int updateOrderComplete(String order_code);
	
	//comment

		
	//byOrderProduct
	public List<CommentVO> getCommentByOrder(Long order_product_code);
		
	//insert
	public void insertComment(CommentVO comment, Long order_product_code);
		
	//read
	public CommentVO readComment(Long comment_code);
		
	//update 
	public int updateComment(Long comment_code);
		
	//delete
	public int deleteComment(Long comment_code);
}
