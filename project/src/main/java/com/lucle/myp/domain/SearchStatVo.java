package com.lucle.myp.domain;

import lombok.Data;

@Data
public class SearchStatVo {
	
	private String searchWord;
	private long searchCount; //검색 횟수
	private Long PCATEGORY_COUNT;
	private Long PCATEGORY;
	private Long CATEGORY;
	private Long CATEGORY_COUNT;
	private String pname;
	
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
	private long incheon;
	private long busan;
	private long daegu;
	private long gwangju;
	private long daejeon;
	private long ulsan;
	private long gangwon;
	private long chungbuk;
	private long chungnam;
	private long jeonbuk;
	private long jeonnam;
	private long gyeongbuk;
	private long gyeongnam;
	private long JEJU;
}
