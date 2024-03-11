package com.lucle.myp.domain;

import lombok.Data;

@Data
public class MarketVo {
	private Long num; // 고유 번호
	private String productName;
	private String marketName;
	private String url;
	private String imgUrl;
	private String won;
	private String dollar;
	private String delivery;
	private String deliveryFee;
	private String otherCosts;
	private String k_ProductName;
	private String keyword;
	private int visible;
	
	private int large;
	private int medium;
	private int small;
	private int sub_category;
	
	private Long marketViewCount;
	
	//아래는 MarketView의 컬럼들.
	private Long vno;
	private String id;
	private String viewDate;
	
}
