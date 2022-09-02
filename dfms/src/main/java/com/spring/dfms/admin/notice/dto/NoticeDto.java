package com.spring.dfms.admin.notice.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class NoticeDto {
	
	private int noticeCd;
	private String memberId;
	private int goodsCd;
	private int orderCd;
	private int noticeQty;
	private String content;
	private String subject;
	private Date enrollDt;
	private int readCount;
	
	public int getNoticeCd() {
		return noticeCd;
	}
	public void setNoticeCd(int noticeCd) {
		this.noticeCd = noticeCd;
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
	public void setGoodsCd(int goodCd) {
		this.goodsCd = goodCd;
	}
	public int getOrderCd() {
		return orderCd;
	}
	public void setOrderCd(int orderCd) {
		this.orderCd = orderCd;
	}
	public int getNoticeQty() {
		return noticeQty;
	}
	public void setNoticeQty(int noticeQty) {
		this.noticeQty = noticeQty;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public Date getEnrollDt() {
		return enrollDt;
	}
	public void setEnrollDt(Date enrollDt) {
		this.enrollDt = enrollDt;
	}
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	
	

}
