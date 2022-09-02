package com.spring.dfms.common.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dfms.common.dto.ContactDto;
import com.spring.dfms.admin.notice.dto.NoticeDto;
import com.spring.dfms.common.dao.CommonDao;

@Service
public class CommonServiceImpl implements CommonService {
	
	@Autowired
	private CommonDao commonDao;

	@Override
	public int getNewGoodsCnt() throws Exception {
		return commonDao.selectOneNewGoodsCnt();
	}

	@Override
	public int getBestGoodsCnt() throws Exception {
		return commonDao.selectOneBestGoodsCnt();
	}

	@Override
	public int getSaleGoodsCnt() throws Exception {
		return commonDao.selectOneSaleGoodsCnt();
	}

	@Override
	public int getPickGoodsCnt() throws Exception {
		return commonDao.selectOnePickGoodsCnt();
	}

	@Override
	public List<Map<String, Object>> getNewGoodsMainInfo() throws Exception {
		return commonDao.selectListGoodsNew();
	}

	@Override
	public List<Map<String, Object>> getBestGoodsMainInfo() throws Exception {
		return commonDao.selectListGoodsBest();
	}

	@Override
	public List<Map<String, Object>> getSaleGoodsMainInfo() throws Exception {
		return commonDao.selectListGoodsSale();
	}

	@Override
	public List<Map<String, Object>> getPickGoodsMainInfo() throws Exception {
		return commonDao.selectListGoodsPick();
	}
	
	@Override
	public List<NoticeDto> getNoticeList() throws Exception {
		return commonDao.selectListNotice();
	}
	
	@Override
	public void addNewContact(ContactDto contactDto) throws Exception {
		commonDao.insertContact(contactDto);
	}


	@Override
	public List<ContactDto> getContactList() throws Exception {
		return commonDao.selectListContact();
	}


	@Override
	public ContactDto getContactDetail(int contactCd) throws Exception {
		return commonDao.selectOneContact(contactCd);
	}


	@Override
	public void removeContact(int contactCd) throws Exception {
		commonDao.deleteContact(contactCd);
	}
	

}
