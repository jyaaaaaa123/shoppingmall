package com.myshopping.mapper;

import java.util.List;

import com.myshopping.domain.CartVO;
import com.myshopping.domain.OrderProductListVO;
import com.myshopping.domain.OrderProductVO;
import com.myshopping.domain.OrderVO;

public interface OrderMapper {
	
	//Create
	public void insertOrder(OrderVO order);
	
	public void insertOrderProduct(OrderProductVO orderProduct);
	
	//Read
	public List<OrderVO> getAllOrderList();
	
	public List<OrderVO> getOrderList(String userid);
	
	public List<OrderProductVO> getOrderProductList();
	
	public List<OrderProductListVO> getOrderSelectList(String order_code);
	
	//Update
	public int updateOrderComplete(String order_code);
	
	
	//delete
}
