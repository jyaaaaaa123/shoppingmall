package com.myshopping.controller;

import java.util.List;
import java.util.UUID;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myshopping.domain.CartListVO;
import com.myshopping.domain.CartVO;
import com.myshopping.domain.MemberVO;
import com.myshopping.domain.OrderProductVO;
import com.myshopping.domain.OrderVO;
import com.myshopping.service.MemberService;
import com.myshopping.service.OrderService;
import com.myshopping.service.ProductService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/order/*")
@AllArgsConstructor
public class OrderController {

	private OrderService orderService;
	private ProductService productService;
	private MemberService memberService;
	
	@GetMapping("/orderCheck")
	public void orderCheck(Model model) {
		UserDetails member = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		model.addAttribute("cartList", orderService.getListCart(member.getUsername()));
	}
	
	@Transactional
	@PostMapping("/order")
	public String order(OrderVO order, OrderProductVO orderProduct) {
		UserDetails member = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String userid = member.getUsername();
		String order_code = UUID.randomUUID().toString();
		
		order.setUserid(userid);
		order.setOrder_code(order_code);
		
		orderService.insertOrder(order);
		
		orderProduct.setUserid(userid);
		orderProduct.setOrder_code(order_code);
		
		orderService.insertOrderProduct(orderProduct);
		
		orderService.deleteAllCart(userid);
		return "redirect:/";
	}
	
	@ResponseBody
	@GetMapping("/order/myInfo")
	public MemberVO myInfo() {
		UserDetails member = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String userid = member.getUsername();
		
		return memberService.readUser(userid);
	}
}
