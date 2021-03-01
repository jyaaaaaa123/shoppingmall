package com.myshopping.controller;

import javax.servlet.http.HttpSession;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myshopping.domain.CartVO;
import com.myshopping.domain.MemberVO;
import com.myshopping.service.CartService;


import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/cart/*")
@Log4j
@AllArgsConstructor
public class CartController {
	
	private CartService service;
	
	@ResponseBody
	@PostMapping("/add")
	public void insertCart(CartVO cart) {
		UserDetails member = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		cart.setUserid(member.getUsername());
		service.insertCart(cart);
	}
}
