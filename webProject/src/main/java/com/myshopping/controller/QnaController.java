package com.myshopping.controller;

import java.io.IOException;
import java.security.Principal;

import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.Response;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myshopping.domain.QnaVO;
import com.myshopping.service.QnaService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/qna/*")
@PreAuthorize("isAuthenticated()")
@AllArgsConstructor
public class QnaController {
	
	private QnaService qnaService;
	
	@GetMapping("/center")
	public void center(Principal principal, Model model) {
		model.addAttribute("qnaList", qnaService.read(principal.getName()));
	}
	
	@GetMapping("/qnaRegister")
	public void qnaRegister() {
		
	}
	
	@PostMapping("/qnaRegister")
	public String qnaRegister(QnaVO qna, RedirectAttributes rttr) {
		
		qnaService.create(qna);
		
		rttr.addFlashAttribute("result", qna.getQna_code());
		
		return "redirect:/qna/center";
	}
	
	@GetMapping("/qnaGetCheck")
	public String qnaGetCheck(@RequestParam("qna_code") Long qna_code, Model model) {
		
		UserDetails member = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String userid = member.getUsername();
		
		QnaVO qna = new QnaVO();
		qna = qnaService.get(qna_code);
		
		if(!qna.getUserid().equals(userid)) {
			return "redirect:/accessError";
		} else {
			model.addAttribute("qna", qna);
			return "redirect:/qna/qnaGet?qna_code=" + qna.getQna_code();
		}
	}

	@GetMapping("/qnaGet")
	public void qnaGet(@RequestParam("qna_code") Long qna_code, Model model) {
		
		
		model.addAttribute("qna", qnaService.get(qna_code));
	}
	
	@PostMapping("/qnaModify")
	@ResponseBody
	public void qnaModify(QnaVO qna) {
		qnaService.modify(qna);
	}
	
	@PostMapping("/qnaRemove")
	@ResponseBody
	public void qnaRemove(Long qna_code) {
		qnaService.remove(qna_code);
	}
}
