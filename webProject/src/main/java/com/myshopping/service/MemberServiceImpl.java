package com.myshopping.service;

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
	public void update(MemberVO member) {
		mapper.updateUser(member);
	}

	@Override
	public void remove(String userid) {
		
		mapper.remove(userid);
		
	}

}
