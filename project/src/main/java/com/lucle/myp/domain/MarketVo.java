package com.lucle.myp.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MarketVo {
	private Long num; // 고유 번호
	private String productName;
	private String marketName;
	private String url;
	private String imgUrl;
	private String won;
	private String delivery;
	private String deliveryFee;
	private String keyword;
	private int visible;
	private String groupbuying;
	private String description;
	
	private int large;
	private int medium;
	private int small;
	private int sub_category;
	private Long category;
	
	private Long marketViewCount;
	
	//아래는 MarketView의 컬럼들.
	private Long vno;
	private String id;
	private String viewDate;
	private String pcategory;
	
	private Long gno;
	private String title;
	private String content;
	private String regidate;
	private String goaldate;
	private Long goaltarget;
	private int achievementrate;

	private Long personnum;

	private String nickname;
	private String name;
	
	/* 카테고리 등급 */
	private int tier;
	
	/* 카테고리 이름 */
	private String cateName;
	
	/* 카테고리 넘버 */
	private String cateCode;
	
	/* 상위 카테고리 */
	private String cateParent;
	
	private Long CATEGORY_LARGE;
	private Long CATEGORY_MEDIUM;
	private Long CATEGORY_SMALL;
	private Long CATEGORY_SUB_CATEGORY;
	private Long MARKET_NUM;
	
}
