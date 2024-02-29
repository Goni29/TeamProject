package com.lucle.myp;

import static org.junit.Assert.assertNotNull;

import java.sql.SQLException;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
public class BeanTest {
	
	@Autowired
	ApplicationContext context;
	
	@Autowired
	DataSource ds;
	
	@Autowired
	SqlSession mybatis;
	
	@Test
	public void contextTest() {
		
		assertNotNull(context);
	}
	
	@Test
	public void dsTest() throws SQLException {

		assertNotNull(ds);
		assertNotNull(ds.getConnection());
	}
	
	@Test
	public void mbTest() {
	}
}
