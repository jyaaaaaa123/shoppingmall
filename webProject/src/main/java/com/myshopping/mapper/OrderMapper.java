package com.myshopping.mapper;

import java.util.List;

import com.myshopping.domain.CartVO;
import com.myshopping.domain.OrderProductVO;
import com.myshopping.domain.OrderVO;

public interface OrderMapper {
	
	//orderlist
	public List<OrderVO> getOrderList();
	
	//Create
	public void insertOrder(OrderVO order);
	
	public void insertOrderProduct(OrderProductVO orderProduct);
	
	//Read
	
	//Update
	
	//delete
}
