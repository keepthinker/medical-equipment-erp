package com.keepthinker.meerp.service;

import java.util.List;
import java.util.Map;

import com.keepthinker.meerp.entity.Role;
import com.keepthinker.meerp.entity.User;

public interface UserInfoService extends Search<User>{
	
	 User getUserInfoById(int id);
	
	/**
	 * 数据库中从id low 到  low+length 个用户信息
	 * @param low
	 * @param length
	 * @return 当设备信息条数不足时，返回的条数小于 length
	 */
	 
	 List<User> getAllUsersInfos();
	
	 List<User> getUserInfosByPageNumber(int pageNumber);
	
	 List<User> getUserInfosByDepartment(String depName, int pageNumber);
	 /**
	  * 获取所有该部门的用户信息
	  * @param depName
	  * @return
	  */
	 List<User> getUserInfosByDepartment(String depName);
	 
	 /**
	  * 获取所有的用户角色
	  * @return
	  */
	 List<Role> getUserRoles();
	
	/**
	 * 如果添加成功，返回userId，失败返回0
	 * @param equipment
	 * @return 添加用户信息的个数
	 */
	 int addUserInfo(User user);
	
	/**
	 * 如果山粗成功，返回1，失败返回0
	 * @param equipment
	 * @return 删除用户信息的个数
	 */
	 int deleteUserInfo(int id);
	
	 int modifyUserInfo(int id, String property, Object object);

	 int modifyUserInfo(int id, Map<String, Object> map);
	
	 int getUserIdByUserName(String userName);
}
