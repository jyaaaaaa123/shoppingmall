package com.myshopping.controller;

import java.util.List;
import java.util.UUID;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myshopping.domain.CartListVO;
import com.myshopping.domain.OrderProductVO;
import com.myshopping.domain.OrderVO;
import com.myshopping.service.OrderService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/order/*")
@AllArgsConstructor
public class OrderController {

	private OrderService service;
	
	@GetMapping("/orderCheck")
	public void orderCheck(Model model) {
		UserDetails member = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		model.addAttribute("cartList", service.getListCart(member.getUsername()));
	}
	
	@PostMapping("/order")
	public void order(OrderVO order, OrderProductVO orderProduct) {
		UserDetails member = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String userid = member.getUsername();
		String order_code = UUID.randomUUID().toString();
		
		order.setUserid(userid);
		order.setOrder_code(order_code);
		
		service.insertOrder(order);
		
		orderProduct.setUserid(userid);
		orderProduct.setOrder_code(order_code);
		
		service.insertOrderProduct(orderProduct);
		
		service.deleteAllCart(userid);
	}
}
