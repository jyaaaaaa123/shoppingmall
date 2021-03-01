package com.myshopping.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myshopping.domain.ProductVO;
import com.myshopping.service.ProductService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin/*")
@Log4j
@AllArgsConstructor
@PreAuthorize("hasRole('ROLE_ADMIN')")
public class AdminController {
	
	private ProductService service;
	
	@GetMapping("/adminProduct")
	public void adminProduct(Model model) {
		model.addAttribute("list", service.getList());
	}
	
	@GetMapping("/adminProductUpdate")
	public void adminProductUpdate(@RequestParam("product_code") Long code, Model model) {
		model.addAttribute("get", service.get(code));
	}
	
	@GetMapping("/adminProductRegister")
	public void adminProductRegister() {
		
	}
	
	@PostMapping("/adminProductRegister")
	public String adminProductRegister(ProductVO product, RedirectAttributes rttr) {
		service.Register(product);
		
		rttr.addFlashAttribute("result", product.getProduct_code());
		
		return "redirect:/admin/adminProduct";
	}
	
	@PostMapping("/adminProductRemove")
	public void adminProductRemove() {
		
	}
	
	@PostMapping("/adminProductUpdate")
	public String moidfy(ProductVO product) {
		service.modify(product);
		return "redirect:/admin/adminProduct";
	}
	
	@GetMapping("/adminOrder")
	public void adminOrder() {
		
	}
	
	@GetMapping("/adminQna")
	public void adminQna() {
		
	}
	
	@GetMapping("/adminMember")
	public void adminMember() {
		
	}
}
