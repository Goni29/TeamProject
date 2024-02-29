package com.lucle.myp.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVo {
	private Long bno;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private Date updatedate;
	private int viewCount;
	private int recommend;
	private Long num; // market 고유 번호
	private String summary; // 게시글에서 사용되는 글의 요약. 사실 없어도 될 듯?
	private String id;
	private int category; // 글의 카테고리. 0은 일반. 1은 핫딜.
	
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
