package com.example.demo.vo;

import lombok.Data;

@Data
public class CommuteVo {
	private int id,state;
	private String towork,tohome,writeday,sawon;
	
	//member테이블과 연동시 사용
	private String name;

}
