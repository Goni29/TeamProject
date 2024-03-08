package com.lucle.myp.domain;

import lombok.Data;

@Data
public class UserVo {
	private String id;
	private String name;
	private String password;
	private String address;
	private String email;
	private String regiDate;
	private String lastConDate;
	private int grade;
	private int gender;
	private int age;
	private String nickname;
	private int visible;
	
	private String addressDetail; // 상세 주소. 자유 기입
	
}
