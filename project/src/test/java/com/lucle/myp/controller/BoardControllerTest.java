package com.lucle.myp.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { 
		"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@WebAppConfiguration
@Log4j

public class BoardControllerTest {
	@Autowired
	private WebApplicationContext wac;
	
	private MockMvc mvc;
	
    @Before
    public void setup() {
        mvc = MockMvcBuilders.webAppContextSetup(wac).build();
    }
	
	@Test
	public void listTest() throws Exception { // 테스트 하고자 하는 컨트롤러가 forwarding
		log.info(
				mvc.perform(MockMvcRequestBuilders.get("/board/list"))
				.andReturn()
				.getModelAndView()
				.getModelMap()
				);
	}
	
	@Test
	public void registerTest() throws Exception { // 테스트 하고자 하는 컨트롤러가 redirect
		String resultPage = mvc.perform(
				MockMvcRequestBuilders.post("/board/register")
				.param("title", "111")
				.param("content", "22")
				.param("writer", "33"))
				.andReturn()
				.getModelAndView()
				.getViewName();
		
		log.info("============regi=========>" + resultPage);
	}
	
	@Test
	public void getTest() throws Exception {
		log.info(
				mvc.perform(MockMvcRequestBuilders.get("/board/get")
				.param("bno", "27"))
				.andReturn()
				.getModelAndView()
				.getModelMap()
				);
	}
	
	@Test
	public void modifyTest() throws Exception {
		String resultPage = mvc.perform(
				MockMvcRequestBuilders.post("/board/modify")
				.param("bno", "33")
				.param("title", "17171717")
				.param("content", "17171717171")
				.param("writer", "7177171717117"))
				.andReturn()
				.getModelAndView()
				.getViewName();
		
		log.info("============modify=========>" + resultPage);
	}
	
	@Test
	public void removeTest() throws Exception {
		String resultPage = mvc.perform(
				MockMvcRequestBuilders.post("/board/remove")
				.param("bno", "12"))
				.andReturn()
				.getModelAndView()
				.getViewName();
		
		log.info("============remove=========>" + resultPage);
	}
	
	@Test
	public void listPagingTest() throws Exception { // 테스트 하고자 하는 컨트롤러가 forwarding
		log.info(
				mvc.perform(MockMvcRequestBuilders.get("/board/list")
				.param("pageNum", "3")
				.param("amount", "20"))
				.andReturn()
				.getModelAndView()
				.getModelMap()
				);
	}
}
