package com.myshopping.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.myshopping.domain.Criteria;
import com.myshopping.domain.QnaReplyVO;
import com.myshopping.service.QnaReplyService;
import com.myshopping.service.QnaService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/reply/*")
@AllArgsConstructor
public class ReplyController {
	
	private QnaReplyService rService;
	private QnaService qService;
	
	@PostMapping(value = "/new", produces = {MediaType.TEXT_PLAIN_VALUE}, consumes = "application/json")
	public ResponseEntity<String> create(@RequestBody QnaReplyVO qnaReply) {
		
		int result = rService.register(qnaReply);
		qService.updateReply(qnaReply.getQna_code());
		return result == 1? new ResponseEntity<String>("success", HttpStatus.OK) : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	@GetMapping(value = "/get/{qna_code}")
	public ResponseEntity<QnaReplyVO> getByCode(@PathVariable("qna_code") Long qna_code) {
		return new ResponseEntity<QnaReplyVO> (rService.getByQnaCode(qna_code), HttpStatus.OK);
	}
}
