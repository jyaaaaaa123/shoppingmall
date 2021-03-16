package com.myshopping.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.myshopping.domain.MemberVO;
import com.myshopping.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {
	
	
	private MemberMapper mapper;
	
	@Override
	public void Register(MemberVO member) {
		mapper.regiUser(member);
	}
	
	@Override
	public MemberVO readUser(String userid) {
		return mapper.readUser(userid);
	}
	
	@Override
	public void update(MemberVO member) {
		mapper.updateUser(member);
	}

	@Override
	public void remove(String userid) {
		
		mapper.remove(userid);
		
	}

	@Override
	public MemberVO checkId(String userid) {
		return mapper.checkId(userid);
	}

	@Override
	public List<MemberVO> memberList() {
		return mapper.memberList();
	}

	

}
