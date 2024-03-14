package com.lucle.myp.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class UserVo {
	private String id;
	private String name;
	private String password;
	private String address;
	private String email;
	private String regiDate;
	private Timestamp lastConDate;
	private int grade;
	private int gender;
	private int age;
	private String nickname;
	private int visible;
	private String session_id; // 세션 ID
	private String postcode;
	private String extraAddress;
	
	private String addressDetail; // 상세 주소. 자유 기입
	
}
