package com.object.asc.user;

import java.util.List;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.object.asc.user.dao.UserDAO;
import com.object.asc.user.domain.User;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class UserDaoTest {
	
	@Inject
	private UserDAO dao;
	
	Logger logger = Logger.getLogger(UserDaoTest.class);
	
	/** 회원가입 테스트*/
	@Test
	public void TestRegister(){
		
		User user = new User();
		user.setId("hmlee@naver.com");
		user.setPassword("1234");
		user.setName("명이에용");
		user.setPhone("010-1111-2222");
		user.setStatus(0);
		user.setUserNo(4);
		
		dao.register(user);
		logger.info(user.toString());
		
	}
	
<<<<<<< HEAD
	/** 회원정보 조회 테스트*/
	@Test
	public void TestGet(){
		
		User user = dao.get(2);
		logger.info(user.toString());
		
	}
=======
>>>>>>> branch 'master' of https://github.com/don-key/asc
	
	
	
	@Test
	public void userFind(){
		
		List<String> list = dao.userFind("d%");
		
		for (String string : list) {
			logger.info(string+"test");
		}
	}
}
