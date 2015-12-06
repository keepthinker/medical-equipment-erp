package com.keepthinker.meerp.main.annotated;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class AOPMainAnnotated {
	public static void main(String[] args) {
		ApplicationContext context = 
				new ClassPathXmlApplicationContext
				("classpath:com/keepthinker/meerp/main/annotated/applicationContextAnnotated.xml");
		Person person=context.getBean(Person.class);
		System.out.println(person.getName());
		person.setName("John");
		System.out.println(person.getName());
	}
}
