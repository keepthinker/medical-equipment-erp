package com.keepthinker.meerp.service;

import java.util.List;

import com.keepthinker.meerp.entity.Equipment;
import com.keepthinker.meerp.entity.User;


public interface DataExportService {
	/**
	 * 返回生成的文件的名字
	 */
	public String exportEquipmentsToExcel(List<Equipment> list);
	/**
	 * 返回生成的文件的名字
	 */
	public String exportUsersToExcel(List<User> list);
}
