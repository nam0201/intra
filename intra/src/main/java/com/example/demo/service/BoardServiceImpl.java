package com.example.demo.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.mapper.BoardMapper;
import com.example.demo.vo.BoardVo;

@Service
@Qualifier("bs")
public class BoardServiceImpl implements BoardService {
 
	@Autowired
	private BoardMapper mapper;

	@Override
	public String list(HttpSession session, Model model) {
		String depart=session.getAttribute("depart").toString();
		ArrayList<BoardVo> list=mapper.list(depart);
		model.addAttribute("list", list);		
		model.addAttribute("dname", mapper.getDepart(depart));
		return "/board/list";
	}

	@Override
	public String write() {
		return "/board/write";
	}

	@Override
	public String write_ok(BoardVo bvo,HttpSession session) {
		String sawon=session.getAttribute("sawon").toString();
	    String depart=session.getAttribute("depart").toString();
	    
	    bvo.setSawon(sawon);
	    bvo.setDepart(depart);
	    
		mapper.write_ok(bvo);
		return "redirect:/board/list";
	}

	@Override
	public String readnum(HttpServletRequest request) {
		String id=request.getParameter("id");
		mapper.readnum(id);
		
		return "redirect:/board/content?id="+id;
	}

	@Override
	public String content(HttpServletRequest request, Model model) {
		String id=request.getParameter("id");
		BoardVo bvo=mapper.content(id);
	    bvo.setContent(bvo.getContent().replace("\r\n", "<br>"));
	    model.addAttribute("bvo", bvo);
		return "/board/content";
	}

	@Override
	public String delete(HttpServletRequest request,HttpSession session) {
		String sawon=session.getAttribute("sawon").toString();
		String id=request.getParameter("id");
		boolean chk=mapper.isSawon(sawon,id);
		if(chk)
		{
			mapper.delete(id);
			return "redirect:/board/list";
		}
		else
		{
			return "redirect:/board/content?id="+id;
		}
	}

	@Override
	public String update(HttpServletRequest request, HttpSession session,Model model) {
		String sawon=session.getAttribute("sawon").toString();
		String id=request.getParameter("id");
		boolean chk=mapper.isSawon(sawon,id);
		if(chk)
		{
			model.addAttribute("bvo", mapper.content(id));
			return "/board/update";
		}
		else
		{
			return "redirect:/board/content?id="+id;
		}
	}

	@Override
	public String update_ok(BoardVo bvo) {
		mapper.update_ok(bvo);
		
		return "redirect:/board/content?id="+bvo.getId();
	}
	
	
}
