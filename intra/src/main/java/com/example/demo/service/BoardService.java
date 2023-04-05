package com.example.demo.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.example.demo.vo.BoardVo;

public interface BoardService {
	public String list(HttpSession session, Model model);
	public String write();
	public String write_ok(BoardVo bvo,HttpSession session);
	public String readnum(HttpServletRequest request);
	public String content(HttpServletRequest request,Model model);
	public String delete(HttpServletRequest request,HttpSession session);
	public String update(HttpServletRequest request, HttpSession session,Model model);
	public String update_ok(BoardVo bvo);

}
