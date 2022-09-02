package com.spring.dfms.myPage.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.dfms.member.dto.MemberDto;
import com.spring.dfms.myPage.dto.CartDto;
import com.spring.dfms.myPage.dto.HeartDto;

@Repository
public class MyPageDaoImpl implements MyPageDao {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<Map<String, Object>> selectListMyOrder(String memberId) throws Exception {
		return sqlSession.selectList("myPage.selectListMyOrder" , memberId);
	}

	@Override
	public Map<String, Object> selectOneMyOrder(Map<String, Object> orderDetailMap) throws Exception {
		return sqlSession.selectOne("myPage.selectOneMyOrder" , orderDetailMap);
	}

	@Override
	public MemberDto selectOneMyInfo(String memberId) throws Exception {
		return sqlSession.selectOne("myPage.selectOneMyInfo" , memberId);
	}

	@Override
	public void updateMyInfo(MemberDto memberDto) throws Exception {
		sqlSession.update("myPage.updateMyInfo" , memberDto);
	}

	@Override
	public void deleteMember(String memberId) throws Exception {
		sqlSession.delete("myPage.deleteMember" , memberId);
	}

	@Override
	public CartDto selectOneDuplicatedCart(CartDto cartDto) throws Exception {
		return sqlSession.selectOne("myPage.selectOneDuplicatedCart" , cartDto);
	}

	@Override
	public void insertCart(CartDto cartDto) throws Exception {
		sqlSession.insert("myPage.insertCart" , cartDto);
	}

	@Override
	public List<Map<String, Object>> selectListMyCart(String memberId) throws Exception {
		return sqlSession.selectList("myPage.selctListMyCart" , memberId);
	}

	@Override
	public void deleteCart(int[] deleteCartCdList) throws Exception {
		sqlSession.delete("myPage.deleteCart" , deleteCartCdList);
	}

	@Override
	public void updateCartGoodsQty(Map<String, Object> updateMap) throws Exception {
		sqlSession.update("myPage.updateCartGoodsQty" , updateMap);
	}

	@Override
	public int selectCountMyCart(String memberId) throws Exception {
		return sqlSession.selectOne("myPage.selectCountMyCart" , memberId);
	}
	
	@Override
	public void deleteHeart(int goodsCd) throws Exception {
		sqlSession.delete("myPage.deleteHeart" , goodsCd);
	}
	
	@Override
	public HeartDto selectOneDuplicatedHeart(HeartDto heartDto) throws Exception {
		return sqlSession.selectOne("myPage.selectOneDuplicatedHeart" , heartDto);
	}

	@Override
	public void insertHeart(HeartDto heartDto) throws Exception {
		sqlSession.insert("myPage.insertHeart" , heartDto);
	}

	@Override
	public List<Map<String, Object>> selectListHeart(String memberId) throws Exception {
		return sqlSession.selectList("myPage.selctListHeart" , memberId);
	}
	
	@Override
	public void updateHeartGoodsQty(Map<String, Object> updateMap) throws Exception {
		sqlSession.update("myPage.updateHeartGoodsQty" , updateMap);
	}
	
	@Override
	public int selectCountHeart(String memberId) throws Exception {
		return sqlSession.selectOne("myPage.selectCountHeart" , memberId);
	}

}
