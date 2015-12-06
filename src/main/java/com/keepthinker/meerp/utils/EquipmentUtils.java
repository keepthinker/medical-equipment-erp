package com.keepthinker.meerp.utils;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.util.StringUtils;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.keepthinker.meerp.entity.Equipment;
import com.keepthinker.meerp.web.bean.InputCheckResult;
import com.keepthinker.meerp.web.bean.InputStatus;


public class EquipmentUtils{
	private static BeanUtilsHelper<Equipment> helper =  new BeanUtilsHelper<Equipment>(Equipment.class);
	/**
	 * 获取Equipment对应类型的名字集合，比如int类型有有id、directorId等等
	 * @return
	 */
	public static Map<String,Set<String>> generateTypeNameSet(){
		return helper.generateTypeNameSet();
	}

	public static Map<String,Object> convertJsonToMap(String json) throws JsonProcessingException, IOException {
		Map<String,Object> mapToReturn=new HashMap<String, Object>();
		Map<String,Set<String>> map=EquipmentUtils.generateTypeNameSet();
		Set<String> intSet=map.get("int");
		Set<String> longSet=map.get("long");
		Set<String> doubleSet=map.get("double");
		Set<String> stringSet=map.get("string");
		ObjectMapper mapper = new ObjectMapper();
		JsonNode jsonNode;
		jsonNode = mapper.readTree(json);
		Iterator<String> iterator=jsonNode.fieldNames();
		while(iterator.hasNext()){
			String name=iterator.next();
			if(stringSet.contains(name)){
				mapToReturn.put(name, jsonNode.get(name).asText());
				continue;
			}
			if(intSet.contains(name)){
				mapToReturn.put(name, jsonNode.get(name).asInt());
				continue;
			}
			if(longSet.contains(name)){
				mapToReturn.put(name, jsonNode.get(name).asLong());
				continue;
			}
			if(doubleSet.contains(name)){
				mapToReturn.put(name, jsonNode.get(name).asDouble());
			}
		}
		return mapToReturn;
	}

	public static String convertToDBFieldName(String str){
		return helper.convertToDBFieldName(str);
	}

	public static InputCheckResult checkIsValid(Equipment e){
		InputCheckResult result = new InputCheckResult();
		StringBuilder statusText = new StringBuilder(32);
		if(StringUtils.isEmpty(e.getSerial())){
			statusText.append("序列号不可为空，");
		}		
		if(StringUtils.isEmpty(e.getChineseName())){
			statusText.append("中文名不可为空，");
		}
		if(StringUtils.isEmpty(e.getDescription())){
			statusText.append("说明不可为空，");
		}
		if(StringUtils.isEmpty(e.getMadeBy())){
			statusText.append("产地不可为空，");
		}
		if(StringUtils.isEmpty(e.getMadeBy())){
			statusText.append("种类不可为空，");
		}
		if(StringUtils.isEmpty(e.getManufacturer())){
			statusText.append("厂商不可为空，");
		}
		if(StringUtils.isEmpty(e.getMotionState())){
			statusText.append("运动状态不可为空，");
		}
		if(StringUtils.isEmpty(e.getRunningState())){
			statusText.append("运转状态不可为空，");
		}
		if(e.getQuantity()<0){
			statusText.append("数量不能小于0，");
		}		
		if(e.getPrice()<0){
			statusText.append("数量不能小于0，");
		}
		if(e.getManagementLevel()<1||e.getManagementLevel()>3){
			statusText.append("管理级别不能小于1或大于3，");
		}
		if(e.getDirectorId()<0){
			statusText.append("主任Id不能小于0，");
		}
		if(e.getOperatorId()<0){
			statusText.append("操作者Id不能小于0，");
		}
		if(e.getRepairFrequency()<0){
			statusText.append("维修次数不能小于0，");
		}
		if(e.getMaintainFrequency()<0){
			statusText.append("保养次数不能小于0，");
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

	/**
	 * 把字符串值转化成有类型的值如"1"字符串转化成1数字
	 * @param value
	 * @return
	 */

	public static Object parseToTypedValue(String property, String value) throws Exception{
		return helper.parseToTypedValue(property, value);
	}

	public static List<Equipment> jsonArrayPerceived(List<Equipment> equs){
		return helper.jsonArrayPerceived(equs);
	}
}
