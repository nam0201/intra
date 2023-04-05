package com.example.demo.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.MemberService;
import com.example.demo.vo.MemberVo;
import com.example.demo.vo.MemoVo;

@Controller
public class MemberController {
	
	@Autowired
	@Qualifier("ms2")
	private MemberService service;
	
	@RequestMapping("/member/login")
	public String login()
	{
		return service.login();
	}
	
	@RequestMapping("/member/login_ok")
	public String login_ok(MemberVo mvo,HttpSession session)
	{
		return service.login_ok(mvo,session);
	}
	
	@RequestMapping("/member/member_input")
	public String member_input(Model model)
	{
		return service.member_input(model);
	}
	
	@RequestMapping("/member/member_input_ok")
	public String member_input_ok(MemberVo mvo)
	{
		return service.member_input_ok(mvo);
	}
	
	@RequestMapping("/member/logout")
	public String logout(HttpSession session)
	{
		return service.logout(session);
	}
	
	@RequestMapping("/member/mypage")
	public String mypage(Model model, HttpSession session)
	{
		return service.mypage(model,session);
	}
	
	@RequestMapping("/member/towork")
	public String towork(HttpSession session)
	{
		return service.towork(session);
	}
	
	@RequestMapping("/member/tohome")
	public String tohome(HttpSession session)
	{
		return service.tohome(session);
	}
	
	@RequestMapping("/member/member_commute")
	public String member_commute(Model model)
	{
		return service.member_commute(model);
	}
	
	@RequestMapping("/member/sendmemo")
	public String sendmemo(Model model)
	{
		return service.sendmemo(model);
	}
	
	@RequestMapping("/member/getName")
	public @ResponseBody ArrayList<MemberVo> getName(String depart)
	{
		return service.getName(depart);
	}
	
	@RequestMapping("/member/sendmemo_ok")
	public @ResponseBody String sendmemo_ok(MemoVo mvo,HttpSession session)
	{
		return service.sendmemo_ok(mvo,session);
	}
	
	//ajax 여러개 불러올시 @responsebody
	@RequestMapping("/member/getSendMemo")
	public @ResponseBody ArrayList<MemoVo> getSendMemo(HttpSession session)
	{
	   return service.getSendMemo(session);	
	}
	
	@RequestMapping("/member/getReceiveMemo")
	public @ResponseBody ArrayList<MemoVo> getReceiveMemo(HttpSession session)
	{
		return service.getReceiveMemo(session);
	}
	
	@RequestMapping("/member/viewmemo")
	public @ResponseBody MemoVo viewmemo(HttpServletRequest request)
	{
		return service.viewmemo(request);
	}
	

}
