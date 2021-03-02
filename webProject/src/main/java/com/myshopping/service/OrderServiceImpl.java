package com.myshopping.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.myshopping.domain.CartListVO;
import com.myshopping.domain.CartVO;
import com.myshopping.domain.OrderProductVO;
import com.myshopping.domain.OrderVO;
import com.myshopping.mapper.CartMapper;
import com.myshopping.mapper.OrderMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class OrderServiceImpl implements OrderService {
	
	private CartMapper cartMapper;
	private OrderMapper orderMapper;
	
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

	@Override
	public void insertOrderProduct(OrderProductVO orderProduct) {
		orderMapper.insertOrderProduct(orderProduct);
	}

	@Override
	public void insertOrder(OrderVO order) {
		orderMapper.insertOrder(order);
	}

	

}
