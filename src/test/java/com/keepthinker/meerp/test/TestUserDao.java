package com.keepthinker.meerp.test;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.keepthinker.meerp.dao.UserInfoDao;
import com.keepthinker.meerp.dao.support.UserInfoDaoImpl;

import junit.framework.TestCase;

public class TestUserDao extends TestCase {
	public void testJUser() {
		ClassPathXmlApplicationContext context=new ClassPathXmlApplicationContext(
				"classpath:hibernate/hibernateContext.xml",
				"classpath:spring/springJdbcContext.xml",
				"classpath:applicationContext.xml");
//		UserInfoDao udao=context.getBean(UserInfoDaoImpl.class);
//		System.out.println(udao.getRecordNumber());
	}
}
