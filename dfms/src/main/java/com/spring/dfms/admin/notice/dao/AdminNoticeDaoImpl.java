package com.spring.dfms.admin.notice.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.dfms.admin.notice.dto.NoticeDto;
import com.spring.dfms.goods.dto.GoodsDto;

@Repository
public class AdminNoticeDaoImpl implements AdminNoticeDao {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<NoticeDto> selectListNotice() throws Exception {
		return sqlSession.selectList("admin.notice.selectListNotice");
	}
	
	@Override
	public NoticeDto selectOneNotice(int noticeCd) throws Exception {
		return sqlSession.selectOne("admin.notice.selectOneNotice" , noticeCd);
	}

	@Override
	public void insertNotice(NoticeDto noticeDto) throws Exception {
		sqlSession.insert("admin.notice.insertNotice" , noticeDto);
	}

	@Override
	public void updateNotice(NoticeDto noticeDto) throws Exception {
		sqlSession.update("admin.notice.updateNotice" , noticeDto);
	}

	@Override
	public void deleteNotice(int noticeCd) throws Exception {
		sqlSession.delete("admin.notice.deleteNotice" , noticeCd);
	}

}
