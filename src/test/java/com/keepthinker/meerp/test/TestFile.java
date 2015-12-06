package com.keepthinker.meerp.test;

import java.io.File;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.Calendar;
import java.util.Date;

import junit.framework.TestCase;

public class TestFile extends TestCase{
	public void testFile(){
		URI uri;
		try {
			uri = this.getClass().getClassLoader().getResource("").toURI();
			File file = new File(uri);
			Calendar calendar = Calendar.getInstance();
			for(File f : file.listFiles()){
				calendar.setTime(new Date(f.lastModified()));
				System.out.println(f.getName()+";  "
						+ "lastModifiedDate: month : " + (calendar.get(Calendar.MONTH)+1)
						+ " day : " + calendar.get(Calendar.DAY_OF_MONTH)
						+ " hour :　" + calendar.get(Calendar.HOUR_OF_DAY)
						+ " minute :　" + calendar.get(Calendar.MINUTE)
						+ " second : " + calendar.get(Calendar.SECOND));
			}
			
		} catch (URISyntaxException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
