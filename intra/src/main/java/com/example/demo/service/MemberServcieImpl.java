package com.example.demo.service;

import java.time.LocalDate;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.mapper.MemberMapper;
import com.example.demo.vo.CommuteVo;
import com.example.demo.vo.DepartVo;
import com.example.demo.vo.MemberVo;
import com.example.demo.vo.MemoVo;

@Service
@Qualifier("ms2")
public class MemberServcieImpl implements MemberService {
	
	@Autowired
	private MemberMapper mapper;

	@Override
	public String login() {
		
		return "/member/login";
	}

	@Override
	public String login_ok(MemberVo mvo, HttpSession session) {
		MemberVo mvo2=mapper.login_ok(mvo);
		if(mvo2!=null)
		{
			// 세션을 추가
			session.setAttribute("sawon", mvo2.getSawon());
			//depart테이블의 부서코드를 세션변수로
			session.setAttribute("depart", mvo2.getDepart());
			session.setAttribute("level", mvo2.getLevel());
			return "redirect:/main/main";
		 }
		 else
		 {
			return "redirect:/member/login";
		 }
	}

	@Override
	public String member_input(Model model) {
		
		// 부서정보를 전달
		ArrayList<DepartVo> list=mapper.getDepart();
		model.addAttribute("list", list);
		
		//사원번호를 mapper를 통해 생성하여 전달
		int num=mapper.getSawon();
		String code="c"+String.format("%03d", num);
		model.addAttribute("code", code);
		return "/member/member_input";
	}

	@Override
	public String member_input_ok(MemberVo mvo) {
		mapper.member_input_ok(mvo);
		return "redirect:/main/main";
	}

	@Override
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/main/main";
	}

	@Override
	public String mypage(Model model, HttpSession session) {
		// 회원정보
		String sawon=session.getAttribute("sawon").toString();
		MemberVo mvo=mapper.getMember(sawon);
		model.addAttribute("mvo", mvo);
		
		model.addAttribute("depart", mapper.getDepartName(mvo.getDepart()));
		// 출퇴근 클릭
		LocalDate today=LocalDate.now();
		CommuteVo cvo=mapper.getCommute(today.toString(),sawon);
		int chk;
		if(cvo==null)
		{
			//없다.
			chk=1;
		}
		else if(cvo.getTohome()==null & cvo.getTowork()==null && cvo.getState()==4)
		 {
			// 휴가인 경우!
		    	chk=4;
		 }
		else if(cvo.getTowork()!=null && cvo.getTohome()==null)
		  {   //출근이 저장되었다.
			  chk=2;
		  }
		else
		  {   //출,퇴근이 전부 저장되었다.
              chk=3;			
		  }
	model.addAttribute("chk", chk);	
		// 사원간 쪽지
		// 보낸 쪽지의 총 갯수와 보낸쪽지에서 읽은 갯수를 알아오기
        int chongcnt=mapper.getChongCnt(sawon);    
	    int readcnt=mapper.getReadCnt(sawon);
	    model.addAttribute("chongcnt", chongcnt);
	    model.addAttribute("readcnt", readcnt);
	    
	    int chongcnt2=mapper.getChongCnt2(sawon);    
	    int readcnt2=mapper.getReadCnt2(sawon);
	    model.addAttribute("chongcnt2", chongcnt2);
	    model.addAttribute("readcnt2", readcnt2);
	    
		return "/member/mypage";
	}

	@Override
	public String towork(HttpSession session) {
		String sawon=session.getAttribute("sawon").toString();
		String today=LocalDate.now().toString();
		mapper.towork(today,sawon);
		return "redirect:/member/mypage";
	}

	@Override
	public String tohome(HttpSession session) {
		String sawon=session.getAttribute("sawon").toString();
		String today=LocalDate.now().toString();
		mapper.tohome(today,sawon);
		return "redirect:/member/mypage";
	}

	@Override
	public String member_commute(Model model) {
		String today=LocalDate.now().toString();
		ArrayList<CommuteVo> list=mapper.member_commute(today);
		
		//상태 : 정상, 지각, 조퇴, 지각&조퇴 결근, 휴가
		
	    model.addAttribute("list", list);
	    model.addAttribute("today", today);
	    return "/member/member_commute";
	}

	@Override
	public String sendmemo(Model model) {
		ArrayList<DepartVo> list=mapper.getDepart();
		model.addAttribute("list", list);
		return "/member/sendmemo";
	}

	@Override
	public ArrayList<MemberVo> getName(String depart) {
		return mapper.getName(depart);
		
	}

	@Override
	public String sendmemo_ok(MemoVo mvo, HttpSession session) {
		String sesawon=session.getAttribute("sawon").toString();
		mvo.setSesawon(sesawon);
		mapper.sendmemo_ok(mvo);
		
		return "<script> window.close() </script>";
	}

	@Override
	public ArrayList<MemoVo> getSendMemo(HttpSession session) {
		String sawon=session.getAttribute("sawon").toString();
		
		ArrayList<MemoVo> list=mapper.getSendMemo(sawon);
		return list;
	}

	@Override
	public ArrayList<MemoVo> getReceiveMemo(HttpSession session) {
		String sawon=session.getAttribute("sawon").toString();
		ArrayList<MemoVo> list=mapper.getReceiveMemo(sawon);
		return list;
	}

	@Override
	public MemoVo viewmemo(HttpServletRequest request) {
		String id=request.getParameter("id");
		String n=request.getParameter("n");
		//System.out.println(n);
		//받은 쪽지일 경우에만 state=1
		if(n.equals("2"))
		   mapper.setState(id);
		return mapper.viewmemo(id);
	}

}
