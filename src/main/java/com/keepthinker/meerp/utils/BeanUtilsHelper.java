package com.keepthinker.meerp.utils;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.persistence.Column;

import com.keepthinker.meerp.entity.User;

class BeanUtilsHelper<T>{

	private Class<T> clazz;

	private static HashMap<String,Set<String>> map=null;
	/**
	 * 获取Equipment对应类型的名字集合，比如int类型有有id、directorId等等
	 * @return
	 */
	public BeanUtilsHelper(Class<T> clazz){
		this.clazz = clazz;
	}

	Map<String,Set<String>> generateTypeNameSet(){
		if(map!=null){
			return map;
		}
		Set<String> intSet=new HashSet<String>(8);
		Set<String> longSet=new HashSet<String>(5);
		Set<String> doubleSet=new HashSet<String>(5);
		Set<String> booleanSet=new HashSet<String>(5);
		Set<String> stringSet=new HashSet<String>();
		Set<String> userSet=new HashSet<String>(5);
		Field[] fields=clazz.getDeclaredFields();
		for(Field f:fields){
			if(f.getType().toString().equals("int")||f.getType()==Integer.class){
				intSet.add(f.getName());
			}
		}
		for(Field f:fields){
			if(f.getType().toString().equals("long")||f.getType()==Long.class){
				longSet.add(f.getName());
			}
		}
		for(Field f:fields){
			if(f.getType().toString().equals("double")||f.getType()==Double.class){
				doubleSet.add(f.getName());
			}
		}
		for(Field f:fields){
			if(f.getType().toString().equals("boolean")||f.getType()==Boolean.class){
				booleanSet.add(f.getName());
			}
		}
		for(Field f:fields){
			if(f.getType()==String.class){
				stringSet.add(f.getName());
			}
		}
		for(Field f:fields){
			if(f.getType()==User.class){
				userSet.add(f.getName());
			}
		}

		map=new HashMap<String, Set<String>>();
		map.put("int", intSet);
		map.put("long", longSet);
		map.put("double", doubleSet);
		map.put("boolean", booleanSet);
		map.put("string", stringSet);
		map.put("user", userSet);
		return map;
	}

	String convertToDBFieldName(String str){
		String fieldName = null;
		for(Field f: clazz.getDeclaredFields()){
			if(f.getName().equals(str)){
				fieldName=f.getAnnotation(Column.class).name();
				break;
			}
		}
		return fieldName;
	}


	public Object parseToTypedValue(String property, String value) throws Exception{
		for(Field f: clazz.getDeclaredFields()){
			if(f.getName().equals(property)){
				Class<?> clazz = f.getType();
				if(clazz == String.class){
					return value;
				}else if(f.getType().toString().equals("int")||f.getType()==Integer.class){
					return Integer.valueOf(value);
				}else if(f.getType().toString().equals("long")||clazz == Long.class){
					return Long.valueOf(value);
				}
				break;
			}
		}
		throw new Exception(property+"非法");
	}
	
	public List<T> jsonArrayPerceived(List<T> equs){
		if(equs != null){
			return equs;
		}else{
			return new ArrayList<T>(0);
		}
	}
	
}
