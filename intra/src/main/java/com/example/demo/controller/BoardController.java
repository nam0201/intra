package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.service.BoardService;
import com.example.demo.vo.BoardVo;

@Controller
public class BoardController {
	
	@Autowired
	@Qualifier("bs")
	private BoardService service;
	
	@RequestMapping("/board/list")
	public String list(HttpSession session, Model model)
	{
		return service.list(session, model);
	}
	
	@RequestMapping("/board/write")
	public String write()
	{
		return service.write();
	}
	
	@RequestMapping("/board/write_ok")
	public String write_ok(BoardVo bvo,HttpSession session)
	{
		return service.write_ok(bvo,session);
	}
	
	@RequestMapping("/board/readnum")
	public String readnum(HttpServletRequest request)
	{
		return service.readnum(request);
	}
	
	@RequestMapping("/board/content")
	public String content(HttpServletRequest request,Model model)
	{
		return service.content(request,model);
	}
	
	@RequestMapping("/board/delete")
	public String delete(HttpServletRequest request,HttpSession session)
	{
		return service.delete(request,session);
	}
	
	@RequestMapping("/board/update")
	public String update(HttpServletRequest request,HttpSession session,Model model)
	{
		return service.update(request,session,model);
	}
	
	@RequestMapping("/board/update_ok")
	public String update_ok(BoardVo bvo)
	{
		return service.update_ok(bvo);
	}


}
