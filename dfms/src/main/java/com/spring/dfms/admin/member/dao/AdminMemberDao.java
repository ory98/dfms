package com.spring.dfms.admin.member.dao;

import java.util.List;
import java.util.Map;

import com.spring.dfms.admin.member.dto.AdminDto;
import com.spring.dfms.member.dto.MemberDto;

public interface AdminMemberDao {
	
	public AdminDto selectAdminLogin(AdminDto adminDto) throws Exception;
	public List<MemberDto> selectListMember() throws Exception;
	public void modifyMemberInfo(Map<String,String> memberMap) throws Exception;
	
}
