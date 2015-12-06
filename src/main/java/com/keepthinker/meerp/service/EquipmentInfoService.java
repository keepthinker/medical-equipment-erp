package com.keepthinker.meerp.service;

import java.util.List;
import java.util.Map;

import com.keepthinker.meerp.entity.Equipment;

public interface EquipmentInfoService extends Search<Equipment>{
	
	
	public Equipment getEquipmentInfoById(int id);
	
	/**
	 * 数据库中 所有设备信息
	 * @参与者 
	 */
	public List<Equipment> getAllEquipments();
		
	/**
	 * 数据库中 id 从 0 到 max 个设备信息
	 * @参与者 
	 * @param limit
	 * @return 当设备信息条数不足时，返回的条数小于 max
	 */
	public List<Equipment> getEquipmentInfos(int max);
	
	
	/**
	 * 分页获取数据
	 * @param pageNumber
	 * @return
	 */
	public List<Equipment> getEquipmentInfosByPageNumber(int pageNumber);
	
	public List<Equipment> getEquipmentInfosByOperatorId(int operatorId, int pageNumber);
	
	public List<Equipment> getEquipmentInfosByOperatorId(int operatorId);
	
	public List<Equipment> getEquipmentInfosByDirectorId(int directorId, int pageNumber);

	/**
	 * 获取该主任负责的所有设备
	 * @param directorId
	 * @return
	 */
	public List<Equipment> getEquipmentInfosByDirectorId(int directorId);
	/**
	 * 如果添加成功，返回1，失败返回0
	 * @param equipment
	 * @return 添加设备信息的个数
	 */
	public int addEquipmentInfo(Equipment equipment);
	
	/**
	 * 如果山粗成功，返回1，失败返回0
	 * @param equipment
	 * @return 删除设备信息的个数
	 */
	public int deleteEquipmentInfo(int id);
	
	public int modifyEquipmentInfo(int id, String property, Object object);
	/**
	 * @return 修改成功后返回1，失败为0
	 */
	public int modifyEquipmentInfos(int id, Map<String,Object> map);
	
}
