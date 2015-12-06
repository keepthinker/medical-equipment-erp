package com.keepthinker.meerp.test;

import junit.framework.TestCase;

import com.keepthinker.meerp.entity.Equipment;
import com.keepthinker.meerp.utils.EquipmentUtils;
import com.keepthinker.meerp.web.bean.ResponseResult;
import com.keepthinker.meerp.web.bean.ResponseStatus;

public class TestEquipmentUtils extends TestCase {
	public void testEquipmentUtils(){
		System.out.println(EquipmentUtils.generateTypeNameSet().get("int"));
		System.out.println(EquipmentUtils.generateTypeNameSet().get("long"));
		System.out.println(EquipmentUtils.generateTypeNameSet().get("double"));
		System.out.println(EquipmentUtils.generateTypeNameSet().get("boolean"));
		System.out.println(EquipmentUtils.generateTypeNameSet().get("string"));
		System.out.println(EquipmentUtils.generateTypeNameSet().get("user"));
		
		System.out.println(EquipmentUtils.convertToDBFieldName("motionState"));
	}
	public void testcheckIsValid(){
		System.out.println(EquipmentUtils.checkIsValid(new Equipment()));
		Equipment equipment = new Equipment();
		equipment.setChineseName("中文名");
		equipment.setDescription("");
		System.out.println(EquipmentUtils.checkIsValid(equipment));
		
		ResponseResult rr = new ResponseResult();
		rr.setStatus(ResponseStatus.FAILURE);
		System.out.println(rr);
	}
}
