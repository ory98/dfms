package com.spring.dfms.member.service;

import com.spring.dfms.member.dto.MemberDto;

public interface MemberService {
	
	public boolean login(MemberDto memberDto) throws Exception;
	public MemberDto findId(MemberDto memberDto) throws Exception;
	public MemberDto updatePw(MemberDto memberDto) throws Exception;
	public int getPoint(String memberId) throws Exception;
	public void addMember(MemberDto memberDto) throws Exception;
	public String checkDuplicatedId(String memberId) throws Exception;
	public int getMyHeartCnt(String memberId) throws Exception;
	public int getMyCartCnt(String memberId) throws Exception;

}
