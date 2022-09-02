package com.spring.dfms.member.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.spring.dfms.member.dao.MemberDao;
import com.spring.dfms.member.dto.MemberDto;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Override
	public boolean login(MemberDto memberDto) throws Exception {
		
		MemberDto checkExsistId = memberDao.selectLogin(memberDto);
		if (checkExsistId != null) {
			if (bCryptPasswordEncoder.matches(memberDto.getPasswd() ,checkExsistId.getPasswd())) {
				return true;
			}			
		}
		return false;
	}
	
	@Override
	public MemberDto findId(MemberDto memberDto) throws Exception { 
		return memberDao.findId(memberDto);
	}
	
	@Override
	public MemberDto updatePw(MemberDto memberDto) throws Exception {
		memberDto.setPasswd(bCryptPasswordEncoder.encode(memberDto.getPasswd()));
		System.out.println(memberDto);
		return memberDao.updatePw(memberDto);
	}
	
	@Override
	public int getPoint(String memberId) throws Exception {
		return memberDao.selectPoint(memberId);
	}

	@Override
	public void addMember(MemberDto memberDto) throws Exception {
		if (memberDto.getEmailstsYn() == null)  memberDto.setEmailstsYn("N");
		if (memberDto.getSmsstsYn() == null)    memberDto.setSmsstsYn("N");
		memberDao.insertMember(memberDto);

	}

	@Override
	public String checkDuplicatedId(String memberId) throws Exception {
		
		if (memberDao.selectDuplicatedId(memberId) == null)	return "duplicate";
		else												return "notDuplicate";
			
	}

	@Override
	public int getMyHeartCnt(String memberId) throws Exception {
		return memberDao.selectMyHeartCnt(memberId);
	}

	@Override
	public int getMyCartCnt(String memberId) throws Exception {
		return memberDao.selectMyCartCnt(memberId);
	}

}
