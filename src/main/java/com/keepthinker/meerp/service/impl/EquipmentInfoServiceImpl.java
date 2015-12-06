package com.keepthinker.meerp.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.keepthinker.meerp.config.SystemConfig;
import com.keepthinker.meerp.dao.EquipmentInfoDao;
import com.keepthinker.meerp.entity.Equipment;
import com.keepthinker.meerp.service.EquipmentInfoService;

@Service
public class EquipmentInfoServiceImpl implements EquipmentInfoService{

	@Autowired
	private SystemConfig config;

	@Autowired
	private EquipmentInfoDao equipmentInfoDao;

	@Override
	public int addEquipmentInfo(Equipment equipment) {
		return equipmentInfoDao.save(equipment)>0?1:0;//?
	}

	@Override
	public int deleteEquipmentInfo(int id) {
		Equipment e=new Equipment();
		e.setId(id);
		equipmentInfoDao.delete(e);
		return 1;
	}

	@Override
	public List<Equipment> getAllEquipments() {
		return equipmentInfoDao.findAll();
	}

	@Override
	public Equipment getEquipmentInfoById(int id) {
		Equipment equipment=equipmentInfoDao.findById(id);
		return equipment;
	}

	@Override
	public List<Equipment> getEquipmentInfos(int max) {
		return null;
	}

	@Override
	public List<Equipment> getEquipmentInfosByDirectorId(int directorId) {
		List<Equipment> equipments = equipmentInfoDao.getEqusByDirectorId(directorId);
		return equipments;
	}

	@Override
	public List<Equipment> getEquipmentInfosByDirectorId(int directorId, int pageNumber) {
		int eNumber=equipmentInfoDao.getNumberOfEquipmentByDirId(directorId);
		if(pageNumber*config.getPageSize()-eNumber>=config.getPageSize()){
			return null;
		}
		return equipmentInfoDao.getEqusByPageAndDirId(pageNumber, directorId);
	}

	@Override
	public List<Equipment> getEquipmentInfosByOperatorId(int operatorId) {
		List<Equipment> equipments = equipmentInfoDao.getEqusByOperatorId(operatorId);
		return equipments;
	}

	@Override
	public List<Equipment> getEquipmentInfosByOperatorId(int operatorId, int pageNumber){
		int eNumber=equipmentInfoDao.getNumberOfEquipmentByOpeId(operatorId);
		if(pageNumber*config.getPageSize() - eNumber >= config.getPageSize()){
			return null;
		}
		return equipmentInfoDao.getEqusByPageAndOpeId(pageNumber, operatorId);
	}

	@Override
	public List<Equipment> getEquipmentInfosByPageNumber(int pageNumber) {
		int eNumber=equipmentInfoDao.getNumberOfRecords();
		if(pageNumber*config.getPageSize()-eNumber>=config.getPageSize()){
			return null;
		}
		List<Equipment> equList=equipmentInfoDao.getRecordsByPage(pageNumber);
		return equList;
	}

	@Override
	public int modifyEquipmentInfo(int id, String property, Object object) {
		return 0;
	}

	@Override
	public int modifyEquipmentInfos(int id,
			Map<String, Object> map) {
		int num=equipmentInfoDao.updateEquipmentInfo(id, map);
		return num;
	}

	@Override
	public List<Equipment> search(String property, Object value) {
		List<Equipment> equipments = equipmentInfoDao.findByProperty(property, value);
		return equipments; 
	}

}
