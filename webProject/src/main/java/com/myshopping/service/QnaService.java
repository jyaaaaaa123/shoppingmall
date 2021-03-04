package com.myshopping.service;

import java.util.List;

import com.myshopping.domain.QnaVO;

public interface QnaService {
	
	public List<QnaVO> realAllList();
	
	public List<QnaVO> read(String userid);
}
