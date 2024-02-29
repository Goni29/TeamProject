package com.lucle.myp.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.lucle.myp.domain.ReplyVo;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
@Log4j
public class ReplyMapperTest {

	// @Setter(onMethod_ = @Autowired)
	@Autowired
	private ReplyMapper mapper;
	
	
	@Test
	public void testInsertR() {
		ReplyVo vo = new ReplyVo();
		vo.setBno(113L);
		vo.setReply("치킨 땡긴다");
		vo.setReplyer("칰충이");
		mapper.insert(vo);
	}

	@Test
	public void testGetRList() {
		List<ReplyVo> list = mapper.getList(113L);
		list.forEach( board -> log.info(list));
	}
	

}
