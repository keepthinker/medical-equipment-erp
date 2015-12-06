package com.keepthinker.meerp.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.keepthinker.meerp.config.SystemConfig;
import com.keepthinker.meerp.dao.RoleDao;
import com.keepthinker.meerp.dao.UserInfoDao;
import com.keepthinker.meerp.entity.Role;
import com.keepthinker.meerp.entity.User;
import com.keepthinker.meerp.service.UserInfoService;

@Service
public class UserInfoServiceImpl implements UserInfoService{

	@Autowired
	private SystemConfig config;

	@Autowired
	private UserInfoDao userInfoDao;

	@Autowired
	private RoleDao roleDao;

	@Override
	public User getUserInfoById(int id) {
		return userInfoDao.findById(id);
	}

	@Override
	public List<User> getAllUsersInfos() {
		return userInfoDao.findAll();
	}

	@Override
	public int addUserInfo(User user) {
		int num=userInfoDao.save(user);
		return num;
	}

	@Override
	public int deleteUserInfo(int id) {
		User user = new User();
		user.setId(id);
		userInfoDao.delete(user);
		return 1;
	}

	@Override
	public int modifyUserInfo(int id, String property, Object object) {
		int num = userInfoDao.updateUserInfo(id, property, object);
		return num>0?1:0;
	}

	@Override
	public int modifyUserInfo(int id,
			Map<String, Object> map) {
		int num = userInfoDao.updateUserInfo(id, map);
		return num>0?1:0;
	}

	@Override
	public List<User> getUserInfosByPageNumber(int pageNumber) {
		int userNumber=userInfoDao.getNumberOfRecords();
		if(pageNumber * config.getPageSize() - userNumber >= config.getPageSize()){
			return null;
		}
		return userInfoDao.getRecordsByPage(pageNumber);
	}

	@Override
	public List<User> getUserInfosByDepartment(String depName, int pageNumber) {	
		int userNumber=userInfoDao.getNumberOfUsersByDep(depName);
		if(pageNumber * config.getPageSize() - userNumber >= config.getPageSize()){
			return null;
		}
		return userInfoDao.getUsersByPageAndDep(pageNumber, depName);
	}


	@Override
	public int getUserIdByUserName(String userName){
		return userInfoDao.getUserIdByUserName(userName);
	}

	@Override
	public List<Role> getUserRoles() {
		return roleDao.findAll();
	}

	@Override
	public List<User> getUserInfosByDepartment(String depName) {
		return userInfoDao.getUsersByPageAndDep(depName);
	}

	@Override
	public List<User> search(String property, Object value) {
		List<User> User = userInfoDao.findByProperty(property, value);
		return User; 
	}

}
