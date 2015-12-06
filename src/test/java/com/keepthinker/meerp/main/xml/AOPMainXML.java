package com.keepthinker.meerp.main.xml;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class AOPMainXML {
	  public static void main(String[] args) {
	      ApplicationContext context = 
	             new ClassPathXmlApplicationContext("classpath:com/keepthinker/meerp/main/xml/applicationContextXML.xml");

	      Student student = (Student) context.getBean("student");
	      student.getName();
	      student.getAge();
	      
	      student.printThrowException();
	   }
}
