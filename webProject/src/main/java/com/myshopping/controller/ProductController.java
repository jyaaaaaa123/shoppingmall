package com.myshopping.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myshopping.domain.Criteria;
import com.myshopping.domain.PageDTO;
import com.myshopping.domain.ProductVO;
import com.myshopping.service.ProductService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/product/*")
@AllArgsConstructor
public class ProductController {
	
	private ProductService service;
	
	//카테고리 별 목록 조회
	@GetMapping("/list")
	public void getlist(Model model, Criteria cri, @RequestParam("product_ctgr") String product_ctgr) {
		model.addAttribute("product", service.getCtgrList(product_ctgr, cri));
		model.addAttribute("best", service.getBestList(product_ctgr));
		
		int total = service.getTotalCount(product_ctgr, cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total, product_ctgr));
	}
	
	
	@GetMapping("/selectProduct")
	public void getSelect(@RequestParam("product_code") Long product_code, Model model) {
		model.addAttribute("selectedProduct", service.get(product_code));
		model.addAttribute("List", service.getCommentByProduct(product_code));
	}
	
	@GetMapping("/search")
	public void searchList(Model model, @RequestParam("product_name") String product_name, Criteria cri) {
		
		model.addAttribute("product", service.search(product_name, cri));
		int total = service.getSearchCount(product_name, cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total, product_name));
	}
}
