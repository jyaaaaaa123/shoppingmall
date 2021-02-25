package com.myshopping.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.myshopping.service.QnaService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/qna/*")
@AllArgsConstructor
public class QnaController {
	
	private QnaService qnaservice;
	
	@GetMapping("/center")
	@PreAuthorize("isAuthenticated()")
	public void center(@RequestParam("userid") String userid, Model model) {
		model.addAttribute("qnaList", qnaservice.read(userid));
	}
}
