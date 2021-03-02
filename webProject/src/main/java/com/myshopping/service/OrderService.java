package com.myshopping.service;

import java.util.List;

import com.myshopping.domain.CartListVO;
import com.myshopping.domain.CartVO;

public interface OrderService {
	
	//Cart
	public void insertCart(CartVO cart);
	
	public List<CartListVO> getListCart(String userid);
	
	public void deleteCart(Long cart_code);
	
	//Order
	
}
