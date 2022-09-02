package com.spring.dfms.order.service;

import java.util.List;
import java.util.Map;

import com.spring.dfms.goods.dto.GoodsDto;
import com.spring.dfms.member.dto.MemberDto;
import com.spring.dfms.order.dto.OrderDto;

public interface OrderService {
	
	public void addOrder(OrderDto orderDto, int point) throws Exception;
	public MemberDto getOrdererDetail(String memberId) throws Exception;
	public GoodsDto getGoodsDetail(int goodsCd) throws Exception;
	public List<GoodsDto> getGoodsListByCart(int[] goodsCdList) throws Exception;
	public void addOrderByCart(Map<String,String> orderListMap)  throws Exception;

}
