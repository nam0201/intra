package com.example.demo.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.CommuteVo;
import com.example.demo.vo.DepartVo;
import com.example.demo.vo.MemberVo;
import com.example.demo.vo.MemoVo;

@Mapper
public interface MemberMapper {
	public MemberVo login_ok(MemberVo mvo);
	public ArrayList<DepartVo> getDepart();
    public int getSawon();
    public void member_input_ok(MemberVo mvo);
    public MemberVo getMember(String sawon);
    public String getDepartName(String depart);
    public CommuteVo getCommute(String today,String sawon);
    public void towork(String today,String sawon);
    public void tohome(String today,String sawon);
    public ArrayList<CommuteVo> member_commute(String today);
    public ArrayList<MemberVo> getName(String depart);
    public  void sendmemo_ok(MemoVo mvo);
    public int getChongCnt(String sawon);
    public int getReadCnt(String sawon);
    public int getChongCnt2(String sawon);
    public int getReadCnt2(String sawon);
    public ArrayList<MemoVo> getSendMemo(String sawon);
	public ArrayList<MemoVo> getReceiveMemo(String sawon);
	public MemoVo viewmemo(String id);
	public void setState(String id);
}
