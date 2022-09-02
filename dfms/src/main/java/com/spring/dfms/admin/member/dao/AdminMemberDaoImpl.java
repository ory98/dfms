package com.spring.dfms.admin.member.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.dfms.admin.member.dto.AdminDto;
import com.spring.dfms.member.dto.MemberDto;

@Repository
public class AdminMemberDaoImpl implements AdminMemberDao {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public AdminDto selectAdminLogin(AdminDto adminDto) throws Exception {
		return sqlSession.selectOne("admin.member.selectAdminLogin" , adminDto);
	}

	@Override
	public List<MemberDto> selectListMember() throws Exception {
		return sqlSession.selectList("admin.member.selectListMember");
	}

	@Override
	public void modifyMemberInfo(Map<String, String> memberMap) throws Exception {
		sqlSession.update("admin.member.modifyMemberInfo" , memberMap);
	}

}
