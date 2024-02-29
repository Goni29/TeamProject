package com.lucle.myp.domain;

import java.util.Date;

import lombok.Data;

@Data
public class JoinBoardVo {
	private Long fno;
	private Long bno;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private Date updatedate;
	private int viewCount;
	private int recommend;
	private Long num; // market 고유 번호
	private String summary;
	private String id;
	private int category;
	
	private String pCategory;
	
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
}
