package com.myshopping.mapper;

import com.myshopping.domain.MemberVO;

public interface MemberMapper {
	
	public void regiUser(MemberVO member);
	
	public MemberVO readUser(String userid);
	
	public int updateUser(MemberVO member);
	
	public int remove(String userid);
}
