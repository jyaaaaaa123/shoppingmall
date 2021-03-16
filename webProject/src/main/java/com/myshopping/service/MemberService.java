package com.myshopping.service;

import java.util.List;

import com.myshopping.domain.MemberVO;

public interface MemberService {
	
	public List<MemberVO> memberList();
	
	public void Register(MemberVO member);
	
	public MemberVO readUser(String userid);
	
	public void update(MemberVO member);
	
	public void remove(String userid);
	
	public MemberVO checkId(String userid);
}
