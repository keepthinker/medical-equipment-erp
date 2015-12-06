package com.keepthinker.meerp.dao;

import java.util.List;
import java.util.Map;

import com.keepthinker.meerp.entity.Role;
import com.keepthinker.meerp.entity.User;

public interface UserInfoDao extends AbstractDao<User, Integer> {
	
	Integer save(User user);
	int updateUserInfo(int id, Map<String, Object> propertyObjectMap) ;

	int updateUserInfo(int id, String key, Object value) ;
	/**
	 * role为英文
	 * @param role
	 */
	List<Role> findUserRolesById(int userId);
	int getUserIdByUserName(String userName);    
	/**
     * 数据库中所有该部门记录的条数
     * @return
     */
    int getNumberOfUsersByDep(String depName);
    
    List<User> getUsersByPageAndDep(int pageNumber, String depName);
    List<User> getUsersByPageAndDep(String depName);
}

