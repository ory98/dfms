package com.spring.dfms.goods.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.spring.dfms.goods.dto.GoodsDto;

@Repository
public interface GoodsService {
	
	public List<GoodsDto> getGoodsList(Map<String,String> goodsListMap) throws Exception;
	public List<GoodsDto> getRelatedGoodsList(Map<String,Object> goodsMap) throws Exception;
	public GoodsDto getGoodsDetail(int goodsCd) throws Exception;
	public List<GoodsDto> getSearchGoodsList(Map<String,Object> searchMap) throws Exception;
	

}
