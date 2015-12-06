package com.keepthinker.meerp.utils;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import org.apache.log4j.Logger;

public class Counter {
	/**
	 * 每次获取都是不同的数字
	 * @return
	 */
	public static synchronized int getNumber(){
		String fileName = "counter.number";
		int number;
		InputStream is = LocalFileUtils.getResourceAsStream(fileName);
		
		DataInputStream dis = new DataInputStream(is);

		try {
			number = dis.readInt();
			dis.close();
		} catch (IOException e) {
			number = 0;
			Logger.getLogger(Counter.class).error("counter.number has no data, so set number = 1");
		}
		number = (number + 1)%Integer.MAX_VALUE;
		DataOutputStream dos = null;
		try {
			dos = new DataOutputStream(new FileOutputStream(LocalFileUtils.getClassRootPath() + fileName));
			dos.writeInt(number);
			dos.close();
		} catch (FileNotFoundException e1) {
			e1.printStackTrace();
		}catch (IOException e) {
			e.printStackTrace();
		}
		
		return number;
	}

}
