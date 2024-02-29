package com.lucle.myp.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class Criteria {
	private int pageNum; // 첫 페이지는 1
	private int amount; // 한 페이지에 보여질 양. 기본적으로는 10.
	
	private String type; // board의 검색 타입, market의 쇼핑몰
	private String keyword; // market 검색어 및 추천 글에 입력되는 키워드.
	
	private String sort = "bno"; // 소트 방식. 기본적으로는 bno(등록 순서, 즉 최신순)
	private int sortTime = 36500; // market 검색어 시간. 1은 1일이므로 24시간 내의 데이터만 나옴.
	//기본 값은 36500 = 100년으로 했음. 사실상 모든 기간.
	private int visible = 1; // 1이면 보임. 기본값. 0이면 안 보임(삭제).
	private int category = -1; // 0이면 일반. 1이 핫딜.
	
	public Criteria() {
		this(1, 10);
	}

	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
		
	}
	
	public String[] getTypeArr() {
		
		return type == null? new String[] {}: type.split("");
	}
	
	public String[] getMarketNameArr() {
		
		return type == null? new String[] {}: type.split(",");
	}
	
}
