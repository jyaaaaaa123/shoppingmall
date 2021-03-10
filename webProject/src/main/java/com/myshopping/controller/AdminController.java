package com.myshopping.controller;

import java.util.List;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myshopping.domain.OrderProductVO;
import com.myshopping.domain.ProductVO;
import com.myshopping.service.OrderService;
import com.myshopping.service.ProductService;
import com.myshopping.service.QnaService;

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
	private QnaService qnaService;
	
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
	
	@Transactional
	@PostMapping("/adminProductRegister")
	public String adminProductRegister(ProductVO product, RedirectAttributes rttr) {
		
		if(product.getImageList() != null) {
			product.getImageList().forEach(image -> log.info(image));
		}
		productService.Register(product);
		
		rttr.addFlashAttribute("result", product.getProduct_code());
		
		return "redirect:/admin/adminProduct";
	}
	
	@PostMapping("/adminProductRemove")
	public String adminProductRemove(Long product_code) {
		productService.remove(product_code);
		return "redirect:/admin/adminProduct";
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
	
	@GetMapping("/adminOrderSelect")
	public void adminOrderSelect(@RequestParam("order_code") String order_code, Model model) {
		model.addAttribute("orderSelectList", orderService.getOrderSelectList(order_code));
	}
	
	@ResponseBody
	@PostMapping("/adminOrderCom")
	public void adminOrderComplete(@RequestParam("order_code") String order_code) {
		
		orderService.updateOrderComplete(order_code);
		
		List<OrderProductVO> opList = orderService.getOrderProductList(order_code);
		
		for(OrderProductVO op : opList) {
			productService.updateProductSales(op);
			productService.updateProductStock(op);
		}
	}
	
	@GetMapping("/adminQnaGet")
	public void adminQna(@RequestParam("qna_code") Long qna_code, Model model) {
		model.addAttribute("qna", qnaService.get(qna_code));
	}
	
	@GetMapping("/adminQna")
	public void adminQna(Model model) {
		model.addAttribute("qnaList", qnaService.realAllList());
	}
	
	@GetMapping("/adminMember")
	public void adminMember() {
		
	}
}
