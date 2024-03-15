package com.lucle.myp.service;

import java.util.List;

import com.lucle.myp.domain.BoardVo;
import com.lucle.myp.domain.Criteria;
import com.lucle.myp.domain.PageDto;
import com.lucle.myp.domain.ReplyPageDto;
import com.lucle.myp.domain.ReplyVo;

public interface ReplyService {

	int register(ReplyVo reply);

	ReplyVo get(Long rno);
	
	int getCount(Long bno);

	List<ReplyVo> getList(Long bno);
	
	List<ReplyVo> getListWithPaging(Criteria cri, Long bno);
	
	
	boolean remove(Long rno);
	
	boolean modify(ReplyVo reply);
	
	public int addReply(ReplyVo vo);
	
	public ReplyPageDto replyList(Criteria cri);
	
	List<ReplyVo> getListByProductNum(Long num);

}
