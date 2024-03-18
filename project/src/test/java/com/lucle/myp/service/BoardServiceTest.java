package com.lucle.myp.service;

import static org.junit.Assert.assertNotNull;

import java.util.function.Consumer;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.lucle.myp.domain.BoardVo;
import com.lucle.myp.domain.GroupBuyingVo;
import com.lucle.myp.mapper.ReplyMapperTest;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
@Log4j
public class BoardServiceTest {
	@Autowired
	BoardService service;
	
	@Test
	@Ignore
	public void serviceTest() {
		assertNotNull(service);
//		log.info(service+"===================");
		log.info(service.getClass().getName()+"===================");
	}
	
	@Test
	public void testRegister() {
		BoardVo board = new BoardVo();
		board.setContent("아");
		board.setTitle("씨발졸ㅀㅎ려");
		board.setWriter("졸리게");
		service.register(board);
		
		log.info("생성된 게시글 번호" + board.getBno());
		
		BoardVo rtnVo = service.get(board.getBno());
		
		log.info(rtnVo);
	}
	
	@Test
	public void testGetList() {
		service.getList("bno").forEach((board) -> log.info(board));
	}
	
	@Test
	public void testRemove() {
		boolean result = service.remove(12L);
		log.info("삭제 결과" + result);
	}
	
	@Test
	public void testModify() {
		BoardVo board = service.get(19L);
		if (board == null ) return;
		
		board.setTitle("유니코드");
		board.setWriter("블루레이");
		board.setContent("이쁜 사랑하세요");	
		
		if (service.modify(board)) {
			System.out.println("GOOD");
		};
		
	}
	
	@Autowired
	GroupBuyingService buyingService;
	@Test
	public void testService(GroupBuyingVo groupBuyingVo) {
		boolean vo = buyingService.participate(groupBuyingVo);
		if (vo == false ) {
			System.out.println("fail");
		}
		if (vo == true ) {
			System.out.println("GOOD");
		};
		
	}

}
