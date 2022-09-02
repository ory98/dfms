package com.spring.dfms.myPage.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class HeartDto {
	
	private int heartCd;
	private String memberId;
	private int goodsCd;
	private int heartGoodsQty;
	
	public int getHeartCd() {
		return heartCd;
	}
	public void setHeartCd(int heartCd) {
		this.heartCd = heartCd;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getGoodsCd() {
		return goodsCd;
	}
	public void setGoodsCd(int goodsCd) {
		this.goodsCd = goodsCd;
	}
	public int getHeartGoodsQty() {
		return heartGoodsQty;
	}
	public void setHeartGoodsQty(int heartGoodsQty) {
		this.heartGoodsQty = heartGoodsQty;
	}
	
	
}
