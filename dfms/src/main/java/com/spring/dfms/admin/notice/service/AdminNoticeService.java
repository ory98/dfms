package com.spring.dfms.admin.notice.service;

import java.util.List;

import com.spring.dfms.admin.notice.dto.NoticeDto;

public interface AdminNoticeService {
	
	public List<NoticeDto> getNoticeList() throws Exception;
	public void addNewNotice(NoticeDto noticeDto) throws Exception;
	public void modifyNotice(NoticeDto noticeDto) throws Exception;
	public NoticeDto getNoticeDetail(int noticeCd) throws Exception;
	public void removeNotice(int noticeCd) throws Exception;

}
