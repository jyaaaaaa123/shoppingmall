package com.myshopping.mapper;

import java.util.List;

import com.myshopping.domain.MemberVO;

public interface MemberMapper {
	
	public List<MemberVO> memberList();
	
	public void regiUser(MemberVO member);
	
	public MemberVO readUser(String userid);
	
	public int updateUser(MemberVO member);
	
	public int remove(String userid);
	
	public MemberVO checkId(String userid);
}
