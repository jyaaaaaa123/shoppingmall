package com.myshopping.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myshopping.domain.MemberVO;
import com.myshopping.service.MemberService;
import com.myshopping.service.QnaService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member/*")
@AllArgsConstructor
public class MemberController {
	
	private MemberService service;
	
	
	
	private BCryptPasswordEncoder pwdEncoder;
	
	@GetMapping("/myPage")
	@PreAuthorize("isAuthenticated()")
	public void myPage() {
		
	}
	
	@GetMapping("/register")
	public void regiUser() {
		
	}
	
	@PostMapping("/register")
	public String regiUser(MemberVO member) {
		String inputPass = member.getUserpw();
		String pwd = pwdEncoder.encode(inputPass);
		member.setUserpw(pwd);
		
		service.Register(member);
		
		return "redirect:/member/login";
	}
	
	@PostMapping("myPageUpdate")
	@PreAuthorize("isAuthenticated()")
	public String updateUser(MemberVO member) {
		service.update(member);
		
		return "redirect:/member/myPage";
	}
	
	@GetMapping("/withdraw")
	@PreAuthorize("isAuthenticated()")
	public void withdrawUser() {
	}
	
	@PostMapping("/withdraw")
	@PreAuthorize("isAuthenticated()")
	public String withdrawUser(@RequestParam("userid") String userid) {
		service.remove(userid);
		
		return "redirect:/";
	}
	
	
}
