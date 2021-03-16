package com.myshopping.controller;


import javax.servlet.http.HttpSession;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myshopping.domain.CartVO;
import com.myshopping.service.OrderService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/cart/*")
@Log4j
@AllArgsConstructor
public class CartController {
	
	private OrderService service;
	
	@ResponseBody
	@PostMapping("/add")
	public void insertCart(CartVO cart) {
		UserDetails member = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		cart.setUserid(member.getUsername());
		service.insertCart(cart);
	}
	
	
	@GetMapping("/cartList")
	@PreAuthorize("isAuthenticated()")
	public void getListCart(Model model) {
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		UserDetails member = (UserDetails) principal;
		model.addAttribute("cartList", service.getListCart(member.getUsername()));
	}
	
	@ResponseBody
	@PostMapping("/delete")
	public void deleteCart(Long cart_code) {
		service.deleteCart(cart_code);
	}
}
