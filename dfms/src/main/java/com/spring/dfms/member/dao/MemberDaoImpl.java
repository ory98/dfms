package com.spring.dfms.member.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.dfms.member.dto.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public MemberDto selectLogin(MemberDto memberDto) throws Exception {
		return sqlSession.selectOne("member.selectLogin" , memberDto);
	}
	
	@Override
	public MemberDto findId(MemberDto memberDto) throws Exception {
		return sqlSession.selectOne("member.selectMemberId" , memberDto);
	}
	
	@Override
	public MemberDto updatePw(MemberDto memberDto) throws Exception {
		sqlSession.update("member.updatePw" , memberDto);
		System.out.println(memberDto);
		return memberDto;
	}
	
	@Override
	public int selectPoint(String memberId) throws Exception {
		return sqlSession.selectOne("member.selectPoint" , memberId);
	}

	@Override
	public void insertMember(MemberDto memberDto) throws Exception {
		sqlSession.insert("member.insertMember" , memberDto);
	}

	@Override
	public String selectDuplicatedId(String memberId) throws Exception {
		return sqlSession.selectOne("member.selectDuplicatedId" , memberId);
	}

	@Override
	public int selectMyHeartCnt(String memberId) throws Exception {
		return sqlSession.selectOne("member.selectMyHeartCnt" , memberId);
	}

	@Override
	public int selectMyCartCnt(String memberId) throws Exception {
		return sqlSession.selectOne("member.selectMyCartCnt" , memberId);
	}

}
