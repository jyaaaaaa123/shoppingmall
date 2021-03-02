package com.myshopping.service;

import java.util.List;

import com.myshopping.domain.CartListVO;
import com.myshopping.domain.CartVO;
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
}
