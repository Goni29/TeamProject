package com.lucle.myp.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.lucle.myp.domain.BoardVo;
import com.lucle.myp.domain.Criteria;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
@Log4j
public class BoardMapperTest {

	// @Setter(onMethod_ = @Autowired)
	@Autowired
	private BoardMapper mapper;

	@Test
	public void testGetList() {
		mapper.getList("bno").forEach( (boardVo) -> log.info(boardVo) );
	}
	
	@Test
	public void testInsert() {
		BoardVo board = new BoardVo();
		board.setTitle("새작글");
		board.setWriter("셀키라");
		board.setContent("naiyou");
		mapper.insertSelectKey(board);
		log.info(board);
	}
	
	@Test
	public void testRead(){
		log.info(mapper.read(3L));
	}
	
	@Test
	public void testUpdate() {
		BoardVo board = new BoardVo();
		board.setBno(42L);
		board.setTitle("새작글수정");
		board.setWriter("셀키라수정");
		board.setContent("naiyou수정");
		mapper.update(board);
		
	}
	
	@Test
	public void testDelete() {
		log.info(mapper.delete(32L));
		
	}
	
	@Test
	public void testPaging() {
		
		Criteria cri = new Criteria();
		
		List<BoardVo> list = mapper.getListWithPage(cri);
		
		list.forEach( board -> log.info(list));
		
		
		
	}
}
