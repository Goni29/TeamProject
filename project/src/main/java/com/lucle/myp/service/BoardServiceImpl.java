package com.lucle.myp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lucle.myp.domain.BoardVo;
import com.lucle.myp.domain.Criteria;
import com.lucle.myp.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardMapper mapper;
	
	@Override
	public void register(BoardVo board) {
		
		if(board.getNum() == null) {
			mapper.insertNumNull(board);
		}else {
			mapper.insert(board);
		}
	}

	@Override
	public BoardVo get(Long bno) {
		return mapper.read(bno);
	}

	@Override
	public List<BoardVo> getList(String sort) {
		return mapper.getList(sort);
	}
	
	@Override
	public List<BoardVo> getListWithPage(Criteria criteria) {
		return mapper.getListWithPage(criteria);
	}

	@Override
	public boolean remove(Long bno) {
		return mapper.delete(bno) == 1;
		
	}

	@Override
	public boolean modify(BoardVo board) {
		return mapper.update(board) == 1;
	}

	@Override
	public int getCount() {
		return mapper.getCount();
	}

	@Override
	public int getCountWithSearch(Criteria cri) {
		return mapper.getCountWithSearch(cri);
	}

	@Override
	public int viewCountPlus(Long bno) {
		return mapper.viewCountPlus(bno);
	}
	

}
