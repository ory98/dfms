package com.spring.dfms.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.dfms.member.dto.MemberDto;
import com.spring.dfms.member.service.MemberService;


@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@RequestMapping(value="/register" , method = RequestMethod.GET)
	public ModelAndView register() throws Exception {
		return new ModelAndView("/member/register");
	}
	
	@RequestMapping(value="/register" , method = RequestMethod.POST)
	public ResponseEntity<Object> register(MemberDto memberDto , HttpServletRequest request) throws Exception {
	
		memberDto.setPasswd(bCryptPasswordEncoder.encode(memberDto.getPasswd()));
		
		memberService.addMember(memberDto);

		String message  = "<script>";
			   message += " alert('회원가입되었습니다.');";
			   message += " location.href='" + request.getContextPath() + "/';";
			   message += " </script>";
	    
	    HttpHeaders responseHeaders = new HttpHeaders();
	    responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		return new ResponseEntity<Object>(message, responseHeaders, HttpStatus.OK);
	
	}
	
	@RequestMapping(value="/checkDuplicatedId" , method = RequestMethod.GET)
	public ResponseEntity<String> overlapped(@RequestParam("memberId") String memberId) throws Exception{
		return new ResponseEntity<String>(memberService.checkDuplicatedId(memberId), HttpStatus.OK);
	}
	
	@RequestMapping(value="/login" , method = RequestMethod.GET)
	public ModelAndView login() throws Exception {
		return new ModelAndView("/member/login");
	}
	
	@RequestMapping(value="/login" , method=RequestMethod.POST)
	public ResponseEntity<Object> login(MemberDto memberDto, HttpServletRequest request) throws Exception {
		
		String message = "";
		if (memberService.login(memberDto)) { 	
			HttpSession session = request.getSession();		
			session.setAttribute("memberId" , memberDto.getMemberId());
			session.setAttribute("point" , memberService.getPoint(memberDto.getMemberId()));
			session.setAttribute("role" , "client");
			session.setAttribute("myHeartCnt" , memberService.getMyHeartCnt(memberDto.getMemberId()));
			session.setAttribute("myCartCnt" , memberService.getMyCartCnt(memberDto.getMemberId()));
			session.setMaxInactiveInterval(60 * 30);
			message  = "<script>";
			message += " alert('로그인 되었습니다.');";
			message += " location.href='" + request.getContextPath() + "/';";
			message += " </script>";
		}
		else { 
			message  = "<script>";
			message += " alert('로그인에 실패하였습니다. 아이디와 비밀번호를 확인하세요.');";
			message += " history.go(-1);";
			message += " </script>";
		}
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		return new ResponseEntity<Object>(message, responseHeaders, HttpStatus.OK);
		
	}
	
	@RequestMapping(value="/logout" , method = RequestMethod.GET)
	public ResponseEntity<Object> logout(HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		session.invalidate(); 
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		String jsScript = "<script>";
			   jsScript += " alert('로그아웃 되었습니다.');";
			   jsScript += "location.href='" + request.getContextPath() + "/';";
			   jsScript += " </script>";
		
		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
	
	}
	
	@RequestMapping(value="/findId" , method = RequestMethod.GET)
	public ModelAndView findId() throws Exception {
		return new ModelAndView("/member/findId");
	}
	
	@RequestMapping(value="/findId" , method=RequestMethod.POST)
	public ResponseEntity<Object> findId(MemberDto memberDto,  HttpServletRequest request) throws Exception {
		
		String message = "";
		
		MemberDto findId = memberService.findId(memberDto);
		
		if (findId != null) {
			
			String id = findId.getMemberId();
			
			message  = "<script>";		
			message += " alert('찾으시는 아이디는 : " + id  + " 입니다.');";
			message += " location.href='" + request.getContextPath() + "/member/login';";
			message += " </script>";
			
		}
		else { 
			message  = "<script>";
			message += " alert('찾기에 실패하였습니다. 이름과 이메일을 다시 확인하세요.');";
			message += " history.go(-1);";
			message += " </script>";
		}
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		return new ResponseEntity<Object>(message, responseHeaders, HttpStatus.OK);
		
	}
	
	@RequestMapping(value="/findPw" , method = RequestMethod.GET)
	public ModelAndView findPw() throws Exception {
		return new ModelAndView("/member/findPw");
	}
	
	@RequestMapping(value="/findPw" , method=RequestMethod.POST)
	public ResponseEntity<Object> findPw(MemberDto memberDto,  HttpServletRequest request) throws Exception {
		
		String message = "";
		
		MemberDto findPw = memberService.findId(memberDto);
		
		if (findPw != null) {
			message  = "<script>";		
			message += " location.href='" + request.getContextPath() + "/member/updatePw?memberId=" + findPw.getMemberId() + "';";
			message += " </script>";
			
		}
		
		else { 
			message  = "<script>";
			message += " alert('찾기에 실패하였습니다. 입력정보를 다시 확인하세요.');";
			message += " history.go(-1);";
			message += " </script>";
		}
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		return new ResponseEntity<Object>(message, responseHeaders, HttpStatus.OK);
		
	}
	
	@RequestMapping(value="/updatePw" , method = RequestMethod.GET)
	public ModelAndView updatePw(@RequestParam("memberId") String memberId) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/member/updatePw");
		mv.addObject("memberId", memberId);
		return mv;
	}
	
	@RequestMapping(value="/updatePw" , method=RequestMethod.POST)
	public ResponseEntity<Object> updatePw(MemberDto memberDto , HttpServletRequest request) throws Exception {
		
		memberService.updatePw(memberDto);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		String jsScript  = "<script>";
				jsScript += " alert('수정되었습니다.');";
				jsScript += " location.href='" + request.getContextPath() + "/member/login';";
				jsScript += " </script>";
		
		System.out.println(memberDto);
		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
		
	}
}
