package com.myshopping.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.myshopping.domain.QnaReplyVO;
import com.myshopping.service.QnaReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/reply/*")
@AllArgsConstructor
public class ReplyController {
	
	private QnaReplyService service;
	
	@PostMapping(value = "/create", produces = {MediaType.TEXT_PLAIN_VALUE}, consumes = "application/json")
	public ResponseEntity<String> create(@RequestBody QnaReplyVO qnaReply) {
		
		int result = service.register(qnaReply);
		return result == 1? new ResponseEntity<String>("success", HttpStatus.OK) : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
}
