package com.spring.dfms.common.controller;

import java.io.File;
import java.io.OutputStream;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.dfms.common.dto.ContactDto;
import com.spring.dfms.common.service.CommonService;

import net.coobird.thumbnailator.Thumbnails;

import org.springframework.stereotype.Controller;

@Controller
public class CommonController {
	
	@Autowired
	private CommonService commonService;	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView main() throws Exception{
		
		ModelAndView mv = new ModelAndView("/main");
		
		Map<String, String> goodsListMap = new HashMap<String, String>();
		goodsListMap.put("sort", "all");
		goodsListMap.put("part", "all");
		
		mv.addObject("newGoodsCnt" , commonService.getNewGoodsCnt());
		mv.addObject("bestGoodsCnt" , commonService.getBestGoodsCnt());
		mv.addObject("saleGoodsCnt" , commonService.getSaleGoodsCnt());
		mv.addObject("pickGoodsCnt" , commonService.getPickGoodsCnt());		
		mv.addObject("newGoodsInfo", commonService.getNewGoodsMainInfo());
		mv.addObject("bestGoodsInfo", commonService.getBestGoodsMainInfo());
		mv.addObject("saleGoodsInfo", commonService.getSaleGoodsMainInfo());
		mv.addObject("pickGoodsInfo", commonService.getPickGoodsMainInfo());
		
		
		return mv;
	}
	
	@RequestMapping(value="/company" , method=RequestMethod.GET)
	public ModelAndView company() throws Exception{
		return new ModelAndView("/company");
	}
	
	@RequestMapping(value="/noticeList" , method = RequestMethod.GET)
	public ModelAndView noticeList(HttpServletRequest request)  throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/noticeList");
		mv.addObject("noticeList", commonService.getNoticeList());
		
		return mv;
	}
	
	@RequestMapping(value="/contact" , method=RequestMethod.GET)
	public ModelAndView contact() throws Exception{
		return new ModelAndView("/contact");
	}
	
	@RequestMapping(value="/contact" , method=RequestMethod.POST)
	public ResponseEntity<Object> contact(ContactDto contactDto , HttpServletRequest request) throws Exception{
		
		commonService.addNewContact(contactDto);
		String jsScript  = "<script>";
				jsScript += " alert('컨텍트 정보가 등록 되었습니다.');";
				jsScript += " location.href='" + request.getContextPath() + "/';";
				jsScript += " </script>";
 
	   HttpHeaders responseHeaders = new HttpHeaders();
	   responseHeaders.add("Content-Type", "text/html; charset=utf-8");
	
	   return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
		
	}
	
	@RequestMapping(value="/contactList" , method=RequestMethod.GET)
	public ModelAndView contactList() throws Exception{
		ModelAndView mv = new ModelAndView("/common/contactList");
		mv.setViewName("/contactList");
		mv.addObject("contactList", commonService.getContactList());
		return mv;
	}
	
	@RequestMapping(value="/contactDetail" , method=RequestMethod.GET)
	public ModelAndView contactDetail(@RequestParam("contactCd") int contactCd) throws Exception{
		ModelAndView mv = new ModelAndView("/common/contactList");
		mv.setViewName("/contactDetail");
		mv.addObject("contactDto", commonService.getContactDetail(contactCd));
		return mv;
	}
	
	@RequestMapping(value="/removeContact" , method=RequestMethod.GET)
	public ResponseEntity<Object> removeCart(@RequestParam("contactCd") int contactCd) throws Exception {
		
		commonService.removeContact(contactCd);
		
		String jsScript = "<script>";
				jsScript += "alert('컨텍트 정보를 삭제하였습니다.'); ";
				jsScript += "location.href='contactList'";
				jsScript += "</script>";
		
	    HttpHeaders responseHeaders = new HttpHeaders();
	    responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
		
	}
	
	
	// 썸네일(이미지) 가져오는 컨트롤러 
	private static final String CURR_IMAGE_REPO_PATH = "C:\\file_repo";
	private static final String SEPERATOR = "\\";	// window

	//private static final String CURR_IMAGE_REPO_PATH = "/var/lib/tomcat9/file_repo";
	//private static final String SEPERATOR = "/";		// linux
	
	@RequestMapping("/thumbnails")
	public void thumbnails(@RequestParam("goodsFileName") String goodsFileName , HttpServletResponse response) throws Exception {
	
		OutputStream out = response.getOutputStream();
		String filePath = CURR_IMAGE_REPO_PATH + SEPERATOR + goodsFileName;
		
		File image = new File(filePath);
		if (image.exists()) { 
			Thumbnails.of(image).size(800,800).outputFormat("png").toOutputStream(out);
		}
		byte[] buffer = new byte[1024 * 8];
		out.write(buffer);
		out.close();
		
	}

}
