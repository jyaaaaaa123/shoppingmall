package com.myshopping.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myshopping.domain.ProductVO;
import com.myshopping.service.OrderService;
import com.myshopping.service.ProductService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin/*")
@Log4j
@AllArgsConstructor
@PreAuthorize("hasRole('ROLE_ADMIN')")
public class AdminController {
	
	private ProductService productService;
	private OrderService orderService;
	
	@GetMapping("/adminProduct")
	public void adminProduct(Model model) {
		model.addAttribute("list", productService.getList());
	}
	
	@GetMapping("/adminProductUpdate")
	public void adminProductUpdate(@RequestParam("product_code") Long code, Model model) {
		model.addAttribute("get", productService.get(code));
	}
	
	@GetMapping("/adminProductRegister")
	public void adminProductRegister() {
		
	}
	
	@PostMapping("/adminProductRegister")
	public String adminProductRegister(ProductVO product, RedirectAttributes rttr) {
		productService.Register(product);
		
		rttr.addFlashAttribute("result", product.getProduct_code());
		
		return "redirect:/admin/adminProduct";
	}
	
	@PostMapping("/adminProductRemove")
	public void adminProductRemove() {
		
	}
	
	@PostMapping("/adminProductUpdate")
	public String moidfy(ProductVO product) {
		productService.modify(product);
		return "redirect:/admin/adminProduct";
	}
	
	@GetMapping("/adminOrder")
	public void adminOrder(Model model) {
		model.addAttribute("orderList", orderService.getAllOrderList());
	}
	
	@ResponseBody
	@PostMapping("/adminOrderCom")
	public String adminOrderComplete(@RequestParam("order_code") String order_code) {
		orderService.updateOrderComplete(order_code);
		return "redirect:/admin/adminOrder";
	}
	
	@GetMapping("/adminQna")
	public void adminQna() {
		
	}
	
	@GetMapping("/adminMember")
	public void adminMember() {
		
	}
}
