package com.spring.dfms.admin.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dfms.admin.notice.dao.AdminNoticeDao;
import com.spring.dfms.admin.notice.dto.NoticeDto;
import com.spring.dfms.goods.dto.GoodsDto;

@Service
public class AdminNoticeServiceImpl implements AdminNoticeService {
	
	@Autowired
	private AdminNoticeDao adminNoticeDao;

	@Override
	public List<NoticeDto> getNoticeList() throws Exception {
		return adminNoticeDao.selectListNotice();
	}
	
	@Override
	public NoticeDto getNoticeDetail(int noticeCd) throws Exception {
		return adminNoticeDao.selectOneNotice(noticeCd);
	}

	@Override
	public void addNewNotice(NoticeDto noticeDto) throws Exception {
		adminNoticeDao.insertNotice(noticeDto);

	}

	@Override
	public void modifyNotice(NoticeDto noticeDto) throws Exception {
		adminNoticeDao.updateNotice(noticeDto);
	}

	@Override
	public void removeNotice(int noticeCd) throws Exception {
		adminNoticeDao.deleteNotice(noticeCd);
	}

}
