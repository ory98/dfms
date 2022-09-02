package com.spring.dfms.common.dao;

import java.util.List;
import java.util.Map;

import com.spring.dfms.common.dto.ContactDto;
import com.spring.dfms.admin.notice.dto.NoticeDto;

public interface CommonDao {
	
	public int selectOneNewGoodsCnt() throws Exception;
	public int selectOneBestGoodsCnt() throws Exception;
	public int selectOneSaleGoodsCnt() throws Exception;
	public int selectOnePickGoodsCnt() throws Exception;
	public List<Map<String,Object>> selectListGoodsNew() throws Exception;
	public List<Map<String,Object>> selectListGoodsBest() throws Exception;
	public List<Map<String,Object>> selectListGoodsSale() throws Exception;
	public List<Map<String,Object>> selectListGoodsPick() throws Exception;
	public List<NoticeDto>selectListNotice() throws Exception;
	public void insertContact(ContactDto contactDto) throws Exception;
	public List<ContactDto> selectListContact() throws Exception;
	public ContactDto selectOneContact(int contactCd) throws Exception;
	public void deleteContact(int contactCd) throws Exception;
	
}
