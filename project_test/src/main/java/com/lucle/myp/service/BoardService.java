package com.lucle.myp.service;

import java.util.List;

import com.lucle.myp.domain.BoardVo;
import com.lucle.myp.domain.Criteria;
import com.lucle.myp.domain.JoinBoardVo;

public interface BoardService {

	void register(BoardVo board);

	BoardVo get(Long bno);

	List<BoardVo> getList(String sort);
	
	List<BoardVo> getListWithPage(Criteria cri);
	
	boolean remove(Long bno);
	
	boolean modify(BoardVo board);
	
	int getCount();
	
	int getCountWithSearch(Criteria cri);
	
	int viewCountPlus(Long bno);

}
