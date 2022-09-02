package com.spring.dfms.member.dao;

import com.spring.dfms.member.dto.MemberDto;

public interface MemberDao {

	public MemberDto selectLogin(MemberDto memberDto) throws Exception;
	public MemberDto findId(MemberDto memberDto) throws Exception;
	public MemberDto updatePw(MemberDto memberDto) throws Exception;
	public int selectPoint(String memberId) throws Exception;
	public void insertMember(MemberDto memberDto) throws Exception;
	public String selectDuplicatedId(String memberId) throws Exception;
	public int selectMyHeartCnt(String memberId) throws Exception;
	public int selectMyCartCnt(String memberId) throws Exception;
}
