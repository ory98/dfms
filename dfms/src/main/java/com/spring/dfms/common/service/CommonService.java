package com.spring.dfms.common.service;

import java.util.List;
import java.util.Map;

import com.spring.dfms.common.dto.ContactDto;
import com.spring.dfms.admin.notice.dto.NoticeDto;
import com.spring.dfms.member.dto.MemberDto;

public interface CommonService {
	
	public int getNewGoodsCnt() throws Exception;
	public int getBestGoodsCnt() throws Exception;
	public int getSaleGoodsCnt() throws Exception;
	public int getPickGoodsCnt() throws Exception;
	public List<Map<String,Object>> getNewGoodsMainInfo() throws Exception;
	public List<Map<String,Object>> getBestGoodsMainInfo() throws Exception;
	public List<Map<String,Object>> getSaleGoodsMainInfo() throws Exception;
	public List<Map<String,Object>> getPickGoodsMainInfo() throws Exception;
	public List<NoticeDto> getNoticeList() throws Exception;
	public void addNewContact(ContactDto contactDto) throws Exception;
	public List<ContactDto> getContactList() throws Exception;
	public ContactDto getContactDetail(int contactCd) throws Exception;
	public void removeContact(int contactCd) throws Exception;
	
}
