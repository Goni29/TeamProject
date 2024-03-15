package com.lucle.myp.domain;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReplyPageDto {
	List<ReplyVo> list;

	PageDto pageInfo;
}
