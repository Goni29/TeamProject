package com.lucle.myp.mapper;

import java.util.List;

import com.lucle.myp.domain.BoardVo;
import com.lucle.myp.domain.Criteria;

public interface BoardMapper {
	
	//@Select("select * from tbl_board where bno > 0")
	public List<BoardVo> getList(String sort);
	
	public List<BoardVo> getListWithPage(Criteria cri);
	
	public int getCount();
	
	public int getCountWithSearch(Criteria cri);
	
	public void insert(BoardVo board);
	
	public void insertNumNull(BoardVo board); // num이 0일 경우 DB의 num 컬럼에 null로 삽입함.
	
	public void insertSelectKey(BoardVo board);
	
	public BoardVo read(Long bno);
	
	public int delete(Long bno);
	
	public int update(BoardVo board);
	
	public int viewCountPlus(Long bno);
	
	public int recommendPlus(Long bno);
}
