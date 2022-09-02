package com.spring.dfms.admin.notice.controller;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.dfms.admin.notice.dto.NoticeDto;
import com.spring.dfms.admin.notice.service.AdminNoticeService;
import com.spring.dfms.member.dto.MemberDto;

@Controller
@RequestMapping("/admin/notice")
public class AdminNoticeController {
	
	@Autowired
	private AdminNoticeService adminNoticeService;
	
	@RequestMapping(value="/adminNoticeList" , method = RequestMethod.GET)
	public ModelAndView adminNoticeList(HttpServletRequest request)  throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/notice/adminNoticeList");
		mv.addObject("noticeList", adminNoticeService.getNoticeList());
		
		return mv;
	}
	
	@RequestMapping(value="/noticeDetail" , method = RequestMethod.GET)
	public ModelAndView noticeDetail(@RequestParam("noticeCd") int noticeCd) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		NoticeDto noticeDto = adminNoticeService.getNoticeDetail(noticeCd);
		mv.setViewName("admin/notice/noticeDetail");
		mv.addObject("noticeDto" , noticeDto);
		
		return mv;
		
	}
	
	@RequestMapping(value="/adminNoticeAdd" , method = RequestMethod.GET)
	public String addNewNotice() {
		return "/admin/notice/adminNoticeAdd";
	}
	
	
	@RequestMapping(value="/adminNoticeAdd" , method = RequestMethod.POST)
	public ResponseEntity<Object> addNewNotice(MultipartHttpServletRequest multipartRequest) throws Exception {
		
		multipartRequest.setCharacterEncoding("utf-8");

		NoticeDto noticeDto = new NoticeDto();
		noticeDto.setSubject(multipartRequest.getParameter("subject"));
		noticeDto.setContent(multipartRequest.getParameter("content"));
		adminNoticeService.addNewNotice(noticeDto);
		
		String jsScript= "<script>";
				jsScript += " alert('공지을 등록하였습니다.');";
				jsScript +=" location.href='adminNoticeList';";
				jsScript +="</script>";
		
		HttpHeaders responseHeaders = new HttpHeaders();
	    responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
		
		}
	
	@RequestMapping(value="/adminNoticeModify" , method=RequestMethod.GET)
	public ModelAndView adminNoticeModify(@RequestParam("noticeCd") int noticeCd) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/notice/adminNoticeModify");
		mv.addObject("noticeDto" , adminNoticeService.getNoticeDetail(noticeCd));
		
		return mv;
		
	}
	
	@RequestMapping(value="/adminNoticeModify" , method=RequestMethod.POST)
	public ResponseEntity<Object> adminNoticeModify(NoticeDto noticeDto, HttpServletRequest request) throws Exception {
		
		adminNoticeService.modifyNotice(noticeDto);
		
		String jsScript= "<script>";
				jsScript += " alert('공지를 수정하였습니다.');";
				jsScript +=" location.href='adminNoticeList';";
				jsScript +="</script>";

		HttpHeaders responseHeaders = new HttpHeaders();
	    responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
		
	}
	
	@RequestMapping(value="/adminNoticeRemove" , method=RequestMethod.GET)
	public ResponseEntity<Object> adminNoticeRemove(@RequestParam("noticeCd") int noticeCd) throws Exception {
		
		adminNoticeService.removeNotice(noticeCd);
		
		String jsScript= "<script>";
		jsScript += " alert('등록된 공지을 삭제하였습니다.');";
		jsScript +=" location.href='adminNoticeList';";
		jsScript +="</script>";

		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);

	}
	

}
