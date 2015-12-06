package com.keepthinker.meerp.utils;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import org.apache.log4j.Logger;

public class LocalFileUtils {
	/**
	 * 获取当前线程相对该类根目录路径的文件流
	 */
	public static InputStream getResourceAsStream(String fileName){
		return Thread.currentThread().getContextClassLoader().getResourceAsStream(fileName);
	}
	
	public static String getClassRootPath(){
		return Thread.currentThread().getContextClassLoader().getResource("").getPath();
	}
	
	public static void persistProperties(Properties properties, String destAddress){
		String path = Thread.currentThread().getContextClassLoader().getResource(destAddress).getPath();
		File file = new File(path);
		try {
			FileOutputStream fos = new FileOutputStream(file);
			properties.store(fos, "program basic configuration");
			fos.close();
			Logger.getLogger(LocalFileUtils.class).info("Persist properties in path :" + path);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
