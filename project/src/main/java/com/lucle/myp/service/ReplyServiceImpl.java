package com.lucle.myp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lucle.myp.domain.Criteria;
import com.lucle.myp.domain.PageDto;
import com.lucle.myp.domain.ReplyPageDto;
import com.lucle.myp.domain.ReplyVo;
import com.lucle.myp.mapper.ReplyMapper;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	ReplyMapper mapper;
	
	@Override
	public int register(ReplyVo reply) {
		return mapper.insert(reply);
	}

	@Override
	public ReplyVo get(Long rno) {
		return mapper.read(rno);
	}

	@Override
	public List<ReplyVo> getList(Long bno) {
		return mapper.getList(bno);
	}

	@Override
	public boolean remove(Long rno) {
		return mapper.delete(rno) == 1;
	}

	@Override
	public boolean modify(ReplyVo reply) {
		return mapper.update(reply) == 1;
	}

	@Override
	public List<ReplyVo> getListWithPaging(Criteria cri, Long bno) {
		return mapper.getListWithPaging(cri, bno);
	}

	@Override
	public int getCount(Long bno) {
		
		return mapper.getCount(bno);
	}
	
	@Override
	public int addReply(ReplyVo vo) {
		
		int result = mapper.addReply(vo);
		
		return result;
	}
	
	@Override
	public ReplyPageDto replyList(Criteria cri) {
		ReplyPageDto dto = new ReplyPageDto();
		
		dto.setList(mapper.readReply(cri));
		dto.setPageInfo(new PageDto(mapper.replyTotal(cri.getRno()), cri));
		
		return dto;
	}
	
	@Override
	public List<ReplyVo> getListByProductNum(Long num) {
	    return mapper.getListByProductNum(num);
	}


}
