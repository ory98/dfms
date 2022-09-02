package com.spring.dfms.myPage.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.spring.dfms.member.dto.MemberDto;
import com.spring.dfms.myPage.dto.CartDto;
import com.spring.dfms.myPage.dto.HeartDto;

@Repository
public interface MyPageService {
	
	public List<Map<String,Object>> getMyOrderList(String memberId) throws Exception;
	public Map<String,Object> getMyOrderDetail(Map<String,Object> orderDetailMap) throws Exception;
	public MemberDto getMyInfo(String memberId) throws Exception;
	public void modifyMyInfo(MemberDto memberDto) throws Exception;
	public void removeMember(String memberId) throws Exception;
	
	public boolean checkDuplicatedCart(CartDto cartDto) throws Exception;
	public void addCart(CartDto cartDto) throws Exception;
	public List<Map<String,Object>> getMyCartList(String memberId) throws Exception;
	public void removeCart(int[] deleteCartCdList) throws Exception;
	public void modifyCartGoodsQty(Map<String,Object> updateMap) throws Exception;
	public int countCartList(String memberId) throws Exception;
	
	public void removeHeart(int goodsCd) throws Exception;
	public boolean checkDuplicatedHeart(HeartDto heartDto) throws Exception;
	public void addHeart(HeartDto heartDto) throws Exception;
	public List<Map<String,Object>> getHeartList(String memberId) throws Exception;
	public void modifyHeartGoodsQty(Map<String,Object> updateMap) throws Exception;
	public int countHeartList(String memberId) throws Exception;

}
