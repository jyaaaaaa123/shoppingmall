package com.myshopping.service;

import org.springframework.stereotype.Service;

import com.myshopping.domain.CartVO;
import com.myshopping.mapper.CartMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class CartServiceImpl implements CartService {
	
	private CartMapper cartMapper;
	
	@Override
	public void insertCart(CartVO cart) {
		cartMapper.insertCart(cart);
	}

}
