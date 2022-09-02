package com.spring.dfms.admin.notice.dao;

import java.util.List;

import com.spring.dfms.admin.notice.dto.NoticeDto;

public interface AdminNoticeDao {
	
	public List<NoticeDto>selectListNotice() throws Exception;
	public NoticeDto selectOneNotice(int noticeCd) throws Exception;
	public void insertNotice(NoticeDto noticeDto) throws Exception;
	public void updateNotice(NoticeDto noticeDto) throws Exception;
	public void deleteNotice(int noticeCd) throws Exception;

}
