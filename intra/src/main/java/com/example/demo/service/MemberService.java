package com.example.demo.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.example.demo.vo.MemberVo;
import com.example.demo.vo.MemoVo;

public interface MemberService {

	public String login();
	public String login_ok(MemberVo mvo, HttpSession session);
	public String member_input(Model model);
	public String member_input_ok(MemberVo mvo);
	public String logout(HttpSession session);
	public String mypage(Model model, HttpSession session);
	public String towork(HttpSession session);
	public String tohome(HttpSession session);
	public String member_commute(Model model);
    public String sendmemo(Model model);
	public ArrayList<MemberVo> getName(String depart);
	public String sendmemo_ok(MemoVo mvo, HttpSession session);
	public  ArrayList<MemoVo> getSendMemo(HttpSession session);
	public ArrayList<MemoVo> getReceiveMemo(HttpSession session);
	public MemoVo viewmemo(HttpServletRequest request);
}
