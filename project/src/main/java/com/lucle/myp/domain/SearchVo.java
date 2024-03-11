package com.lucle.myp.domain;

import lombok.Data;

@Data
public class SearchVo {
	private long sno;
	private String id;
	private String searchWord;
	private String searchDate;
	private int visible;
	private String ip;
	private Long searchCount;
	private int gender;
	private int age;
	private String address;
}
