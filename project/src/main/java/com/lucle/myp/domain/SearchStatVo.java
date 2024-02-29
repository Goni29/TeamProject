package com.lucle.myp.domain;

import lombok.Data;

@Data
public class SearchStatVo {
	
	private String searchWord;
	private long searchCount; //검색 횟수
	
	//나이대
	private long teens; // 10대
	private long twenties;
	private long thirties;
	private long forties;
	private long fifties;
	private long above;
	
	//성별
	private long male;
	private long female;
	
	//지역
	private long seoul;
	private long gyeonggi;
}
