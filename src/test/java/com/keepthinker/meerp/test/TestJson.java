package com.keepthinker.meerp.test;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import junit.framework.TestCase;

import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;

import com.keepthinker.meerp.entity.User;

public class TestJson extends TestCase {
	public void testJackson() {
		ObjectMapper mapper = new ObjectMapper();
		try {
			//转化Java Bean 对象为 json格式的String数据
			System.out.println(mapper.writeValueAsString(new User()));
			
			//把json格式的String数据转化成 Java Bean
			String jsonStr="[{\"department\":\"equ\","
					+ "\"id\":\"1\","
					+ "\"password\":\"equ\","
					+ "\"phoneNumber\":\"equ\","
//					+ "\"roles\":\"director,equ_dep_person\","
					+ "\"userName\":\"equ\""
					+ "}]";//数组形式
			List<User> users=mapper.readValue(jsonStr, new TypeReference<List<User>>(){});
			//------------------------------------
			System.out.println(users);
			System.out.println(mapper.writeValueAsString(users));
			
			jsonStr="{\"department\":\"equ\","
					+ "\"id\":\"1\","
					+ "\"password\":\"equ\","
					+ "\"phoneNumber\":\"equ\","
//					+ "\"roles\":\"director,equ_dep_person\","
					+ "\"userName\":\"equ\""
					+ "}";
			JsonNode node=mapper.readTree(jsonStr);
			Iterator<String> iterator=node.getFieldNames();
			
			String key;
			while(iterator.hasNext()){
				key=iterator.next();
				System.out.println(key);
				System.out.println(node.get(key));
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
