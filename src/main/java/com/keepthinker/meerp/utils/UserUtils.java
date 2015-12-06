package com.keepthinker.meerp.utils;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.util.StringUtils;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.keepthinker.meerp.entity.Role;
import com.keepthinker.meerp.entity.User;
import com.keepthinker.meerp.web.bean.InputCheckResult;
import com.keepthinker.meerp.web.bean.InputStatus;
import com.keepthinker.meerp.web.bean.KeyValue;

public class UserUtils {

	private static BeanUtilsHelper<User> helper = new BeanUtilsHelper<User>(User.class);

	public static Map<String,Object> convertJsonToMap(String json){
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> map= new HashMap<String, Object>(3);
		JsonNode jsonNode;
		try {
			jsonNode = mapper.readTree(json);
			Iterator<String> iterator = jsonNode.fieldNames();
			while(iterator.hasNext()){
				String key = iterator.next();
				Object value;
				if(key.equals("roles")){
					value = mapper.readValue(jsonNode.get("roles").traverse(),new TypeReference<List<Role>>(){});
				}else{
					value = jsonNode.get(key).asText();
				}
				map.put(key, value);
			}
			return map;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static KeyValue convertJsonToKeyValue(String json){
		ObjectMapper mapper = new ObjectMapper();
		KeyValue keyvalue=new KeyValue();
		JsonNode jsonNode;
		try {
			jsonNode = mapper.readTree(json);
			Iterator<String> iterator = jsonNode.fieldNames();
			String key = iterator.next();
			Object value;
			if(key.equals("roles")){
				value = mapper.readValue(jsonNode.get("roles").traverse(),new TypeReference<List<Role>>(){});
			}else{
				value = jsonNode.get(key).asText();
			}
			keyvalue.setKey(key);
			keyvalue.setValue(value);
			return keyvalue;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 把User类中的属性名称转化成数据库中数据名称
	 * @param str
	 * @return
	 */
	public static String convertToDBFieldName(String str){
		return helper.convertToDBFieldName(str);
	}
	
	public static InputCheckResult checkIsValid(User u){
		InputCheckResult result = new InputCheckResult();
		StringBuilder statusText = new StringBuilder(32);
		if(StringUtils.isEmpty(u.getUserName())){
			statusText.append("用户名不可为空，");
		}
		if(StringUtils.isEmpty(u.getPassword())){
			statusText.append("密码不可为空，");
		}
		if(StringUtils.isEmpty(u.getRealName())){
			statusText.append("姓名不可为空，");
		}
		if(u.getRoles()==null||u.getRoles().size()==0){
			statusText.append("角色不可为空，");
		}
		if(StringUtils.isEmpty(u.getDepartment())){
			statusText.append("部门不可为空，");
		}
		if(statusText.length()==0){
			result.setStatusText("该对象成员变量合法");
			result.setStatus(InputStatus.VALID);
		}else{
			result.setStatusText(statusText.toString().substring(0,statusText.length()-1));
			result.setStatus(InputStatus.INVALID);
		}
		return result;
	}
	
	public static Object parseToTypedValue(String property, String value) throws Exception{
		return helper.parseToTypedValue(property, value);
	}
	/**
	 * 返回符合Json的数组格式，空的时候为长度为0的List<User>;
	 * @param users
	 * @return
	 */
	public static List<User> jsonArrayPerceived(List<User> users){
		return helper.jsonArrayPerceived(users);
	}
}
