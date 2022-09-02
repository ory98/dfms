package com.spring.dfms.common.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.dfms.common.dto.ContactDto;
import com.spring.dfms.admin.notice.dto.NoticeDto;

@Repository
public class CommonDaoImpl implements CommonDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int selectOneNewGoodsCnt() throws Exception {
		return sqlSession.selectOne("common.selectOneNewGoodsCnt");
	}

	@Override
	public int selectOneBestGoodsCnt() throws Exception {
		return sqlSession.selectOne("common.selectOneBestGoodsCnt");
	}

	@Override
	public int selectOneSaleGoodsCnt() throws Exception {
		return sqlSession.selectOne("common.selectOneSaleGoodsCnt");
	}

	@Override
	public int selectOnePickGoodsCnt() throws Exception {
		return sqlSession.selectOne("common.selectOnePickGoodsCnt");
	}

	@Override
	public List<Map<String, Object>> selectListGoodsNew() throws Exception {
		return sqlSession.selectList("common.selectListGoodsNew");
	}

	@Override
	public List<Map<String, Object>> selectListGoodsBest() throws Exception {
		return sqlSession.selectList("common.selectListGoodsBest");
	}

	@Override
	public List<Map<String, Object>> selectListGoodsSale() throws Exception {
		return sqlSession.selectList("common.selectListGoodsSale");
	}

	@Override
	public List<Map<String, Object>> selectListGoodsPick() throws Exception {
		return sqlSession.selectList("common.selectListGoodsPick");
	}
	
	@Override
	public List<NoticeDto> selectListNotice() throws Exception {
		return sqlSession.selectList("common.selectListNotice");
	}
	
	@Override
	public void insertContact(ContactDto contactDto) throws Exception {
		sqlSession.insert("common.insertContact" , contactDto);
	}

	@Override
	public List<ContactDto> selectListContact() throws Exception {
		return sqlSession.selectList("common.selectListContact");
	}

	@Override
	public ContactDto selectOneContact(int contactCd) throws Exception {
		return sqlSession.selectOne("common.selectOneContact" , contactCd);
	}

	@Override
	public void deleteContact(int contactCd) throws Exception {
		sqlSession.delete("common.deleteContact" , contactCd);
	}

}
