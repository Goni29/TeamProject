package com.lucle.myp.domain;

import java.util.Date;

import lombok.Data;

@Data
public class GroupBuyingVo {

	private Long gno;
	private String title;
	private String content;
	private String regidate;
	private String goaldate;
	private Long goaltarget;
	private Long num;
	private Long personnum;
	private String id;
	private String nickname;
	private Date buyingdate;
	private Long buyno;
	private Long category;
	private String productname;
	private Integer age;
	private Integer gender;
	private String address;
	private String detailaddress;
	private String extraaddress;
	private String delivery;
	
}
