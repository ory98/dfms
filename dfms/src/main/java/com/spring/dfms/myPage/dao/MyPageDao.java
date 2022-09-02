package com.spring.dfms.myPage.dao;

import java.util.List;
import java.util.Map;

import com.spring.dfms.member.dto.MemberDto;
import com.spring.dfms.myPage.dto.CartDto;
import com.spring.dfms.myPage.dto.HeartDto;

public interface MyPageDao {
	
	public List<Map<String,Object>> selectListMyOrder(String memberId) throws Exception;
	public Map<String,Object> selectOneMyOrder(Map<String,Object> orderDetailMap) throws Exception;
	public MemberDto selectOneMyInfo(String memberId) throws Exception;
	public void updateMyInfo(MemberDto memberDto) throws Exception;
	public void deleteMember(String memberId) throws Exception;
	
	public CartDto selectOneDuplicatedCart(CartDto cartDto) throws Exception;
	public void insertCart(CartDto cartDto) throws Exception;
	public List<Map<String,Object>> selectListMyCart(String memberId) throws Exception;
	public void deleteCart(int[] deleteCartCdList) throws Exception;
	public void updateCartGoodsQty(Map<String,Object> updateMap) throws Exception;
	public int selectCountMyCart(String memberId) throws Exception;
	
	public void deleteHeart(int goodsCd) throws Exception;
	public HeartDto selectOneDuplicatedHeart(HeartDto heartDto) throws Exception;
	public void insertHeart(HeartDto heartDto) throws Exception;
	public List<Map<String,Object>> selectListHeart(String memberId) throws Exception;
	public void updateHeartGoodsQty(Map<String,Object> updateMap) throws Exception;
	public int selectCountHeart(String memberId) throws Exception;

}
