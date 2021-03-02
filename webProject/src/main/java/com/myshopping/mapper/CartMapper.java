package com.myshopping.mapper;

import java.util.List;

import com.myshopping.domain.CartListVO;
import com.myshopping.domain.CartVO;

public interface CartMapper {
	
	//카트 담기
	public void insertCart(CartVO cart);
	
	//카트 정보 읽기
	public List<CartListVO> cartList(String userid);
	
	//카트 업데이트
	public void updateCart(int stock);
	
	//카트 삭제
	public void deleteCart(Long cart_code);
	
	//카트 전체 삭제
	public void deleteAllCart(String userid);
}
