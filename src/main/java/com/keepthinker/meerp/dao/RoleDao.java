package com.keepthinker.meerp.dao;

import java.util.List;

import com.keepthinker.meerp.entity.Role;

public interface RoleDao extends AbstractDao<Role, Integer>{
	List<Role> findAll();
	List<Role> findUserRolesById(int userId);
}
