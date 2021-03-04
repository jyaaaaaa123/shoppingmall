package com.myshopping.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.myshopping.domain.CartListVO;
import com.myshopping.domain.CartVO;
import com.myshopping.domain.CommentVO;
import com.myshopping.domain.OrderProductListVO;
import com.myshopping.domain.OrderProductVO;
import com.myshopping.domain.OrderVO;
import com.myshopping.mapper.CartMapper;
import com.myshopping.mapper.CommentMapper;
import com.myshopping.mapper.OrderMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class OrderServiceImpl implements OrderService {
	
	private CartMapper cartMapper;
	private OrderMapper orderMapper;
	private CommentMapper commentMapper;
	
	@Override
	public void insertCart(CartVO cart) {
		cartMapper.insertCart(cart);
	}

	@Override
	public List<CartListVO> getListCart(String userid) {
		return cartMapper.cartList(userid);
	}

	@Override
	public void deleteCart(Long cart_code) {
		cartMapper.deleteCart(cart_code);
	}
	
	@Override
	public void deleteAllCart(String userid) {
		cartMapper.deleteAllCart(userid);
	}

	
	//order
	@Override
	public void insertOrderProduct(OrderProductVO orderProduct) {
		orderMapper.insertOrderProduct(orderProduct);
	}

	@Override
	public void insertOrder(OrderVO order) {
		orderMapper.insertOrder(order);
	}
	
	@Override
	public List<OrderProductListVO> getAllOrderList() {
		return orderMapper.getAllOrderList();
	}
	
	@Override
	public List<OrderVO> getOrderList(String userid) {
		return orderMapper.getOrderList(userid);
	}

	@Override
	public List<OrderProductListVO> getOrderSelectList(String order_code) {
		return orderMapper.getOrderSelectList(order_code);
	}

	@Override
	public int updateOrderComplete(String order_code) {
		return orderMapper.updateOrderComplete(order_code);
	}
	
	//comment

	@Override
	public List<CommentVO> getCommentByOrder(Long order_product_code) {
		return commentMapper.getCommentByOrder(order_product_code);
	}

	@Override
	public void insertComment(CommentVO comment, Long order_product_code) {
		commentMapper.insertComment(comment);
		orderMapper.updateOrderProductComplete(order_product_code);
	}

	@Override
	public CommentVO readComment(Long comment_code) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateComment(Long comment_code) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteComment(Long comment_code) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<OrderProductVO> getOrderProductList(String order_code) {
		return orderMapper.getOrderProductList(order_code);
	}

	

	

}
