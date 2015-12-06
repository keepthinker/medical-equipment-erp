package com.keepthinker.meerp.dao;

import java.util.List;
import java.util.Map;

import com.keepthinker.meerp.entity.Equipment;

public interface EquipmentInfoDao extends AbstractDao<Equipment, Integer> {
	
	<T>int updateEquipmentInfo(int id, Map<String, T> map);
    
    int getNumberOfEquipmentByDirId(int directorId);
	
    int getNumberOfEquipmentByOpeId(int operatorId);
    
    List<Equipment> getEqusByPageAndDirId(int pageNumber, int directorId);
    
    List<Equipment> getEqusByPageAndOpeId(int pageNumber, int operatorId);
    
    List<Equipment> getEqusByDirectorId(int directorId);
    
    List<Equipment> getEqusByOperatorId(int operatorId);
}
