package com.keepthinker.meerp.test;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Properties;
import java.util.Set;

import junit.framework.TestCase;

public class TestProperties extends TestCase{
	public void testProperties(){
		Properties pro = new Properties();
		String path = Thread.currentThread().getContextClassLoader().getResource("config.properties").getPath();
		try {
			pro.load(getClass().getClassLoader().getResourceAsStream("config.properties"));
		} catch (IOException e) {
			e.printStackTrace();
		}
		Set<Object> set = pro.keySet();
		for(Object obj : set){
			System.out.println(pro.get(obj));
		}
		
		pro.setProperty("hasTrash", "true");
		
		FileOutputStream fos;
		try {
			System.out.print(path);
			fos = new FileOutputStream(new File((path)));
			pro.store(fos, "project configuration");
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
