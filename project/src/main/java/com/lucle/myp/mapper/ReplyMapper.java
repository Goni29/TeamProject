package com.lucle.myp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lucle.myp.domain.Criteria;
import com.lucle.myp.domain.ReplyVo;

public interface ReplyMapper {
	
	public List<ReplyVo> getList(Long bno);
	
	public List<ReplyVo> getListAll();
	
	public int insert(ReplyVo reply);
	
	public ReplyVo read(Long rno);
	
	public int delete(Long rno);
	
	public int update(ReplyVo reply);
	
	public int getCount(Long bno);
	
	public int addReply (ReplyVo vo);
	
	public List<ReplyVo> readReply(Criteria cri);
	
	public int replyTotal(Long rno);
	
	List<ReplyVo> getListWithPaging(
			@Param("cri") Criteria cri,
			@Param("bno") Long bno
			);
	
	List<ReplyVo> getListByProductNum(@Param("num") Long num);

}
