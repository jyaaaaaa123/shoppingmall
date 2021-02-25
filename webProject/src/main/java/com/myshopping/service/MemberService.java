package com.myshopping.service;

import com.myshopping.domain.MemberVO;

public interface MemberService {
	
	public void Register(MemberVO member);
	
	public void update(MemberVO member);
	
	public void remove(String userid);
}
