package com.lucle.myp.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVo {
	private Long rno;
	private Long bno;
	private String reply;
	private String replyer;
	private Date replydate;
	private Date updatedate;
	private String id;
	private int visible;

}
