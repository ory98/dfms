package com.spring.dfms.order.dao;

import java.util.List;
import java.util.Map;

import com.spring.dfms.goods.dto.GoodsDto;
import com.spring.dfms.member.dto.MemberDto;
import com.spring.dfms.order.dto.OrderDto;

public interface OrderDao {
	
	public void insertOrder(OrderDto orderDto) throws Exception;
	public MemberDto selectOneOrderer(String memberId) throws Exception;
	public GoodsDto selectOneCartGoods(int goodsCd) throws Exception;
	public List<GoodsDto> selectListCartGoods(int[] goodsCdList) throws Exception;
	public void insertOrderByCart(List<OrderDto> orderList) throws Exception;
	public void updateGoodsStockCnt(Map<String,Object> orderMap) throws Exception;
	public void updateMemberPoint(Map<String,Object> orderMap) throws Exception;
	public void updateGoodsStockCntByCart(List<Map<String,Integer>> goodsMapList) throws Exception;
	public void updateMemberPointByCart(Map<String,Object> memberMap) throws Exception;
	public void deleteCartByOrder(int[] cartCdList)  throws Exception;
}
