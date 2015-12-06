package com.keepthinker.meerp.service.impl;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import net.sf.jxls.exception.ParsePropertyException;
import net.sf.jxls.transformer.XLSTransformer;

import org.apache.log4j.Logger;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.keepthinker.meerp.entity.Equipment;
import com.keepthinker.meerp.entity.User;
import com.keepthinker.meerp.service.DataExportService;
import com.keepthinker.meerp.service.EquipmentInfoService;
import com.keepthinker.meerp.service.UserInfoService;
import com.keepthinker.meerp.utils.Counter;
import com.keepthinker.meerp.utils.LocalFileUtils;
import com.keepthinker.meerp.web.GeneralController;

@Service
public class DataExportServiceImpl implements DataExportService {
	
	@Autowired
	ServletContext context;
	
	@Autowired
	private UserInfoService userInfoService;
	
	@Autowired
	private EquipmentInfoService equipmentInfoService;
	
	/**
	 * 返回生成的文件的名字
	 */
	public String exportEquipmentsToExcel(List<Equipment> list){
		
		String contextRealPath = context.getRealPath("/");
		String srcFileName = "equipment_template.xls";
		String srcFilePath = LocalFileUtils.getClassRootPath() + "export_template/" + srcFileName;
		Logger.getLogger(GeneralController.class).info("srcFilePath : "+srcFilePath);
		
		String destFileName="equipment-" + Counter.getNumber()+".xls";
		String destFilePath = contextRealPath + "resources/export/" + destFileName;
		
		XLSTransformer transformer = new XLSTransformer();
		Map<String,List<Equipment>> map = new HashMap<String, List<Equipment>>();
		map.put("equipments", list);
		try {
			transformer.transformXLS(srcFilePath, map, destFilePath);
		} catch (ParsePropertyException | InvalidFormatException | IOException e) {
			e.printStackTrace();
		}
		return destFileName;
	};
	
	/**
	 * 返回生成的文件的名字
	 */
	public String exportUsersToExcel(List<User> list){
		
		String contextRealPath = context.getRealPath("/");
		String srcFileName = "user_template.xls";
		String srcFilePath = LocalFileUtils.getClassRootPath() + "export_template/" + srcFileName;
		Logger.getLogger(GeneralController.class).info("srcFilePath : "+srcFilePath);
		
		String destFileName="user-" + Counter.getNumber()+".xls";
		String destFilePath = contextRealPath + "resources/export/" + destFileName;
		
		XLSTransformer transformer = new XLSTransformer();
		Map<String,List<User>> map = new HashMap<String, List<User>>();
		map.put("users", list);
		try {
			transformer.transformXLS(srcFilePath, map, destFilePath);
		} catch (ParsePropertyException | InvalidFormatException | IOException e) {
			e.printStackTrace();
		}
		return destFileName;
	};
}
