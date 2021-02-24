package com.myshopping.mapper;

import com.myshopping.domain.MemberVO;

public interface MemberMapper {
	
	public MemberVO read(String userid);
}
