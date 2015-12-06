package com.keepthinker.meerp.dao.support;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.springframework.stereotype.Repository;

import com.keepthinker.meerp.dao.RoleDao;
import com.keepthinker.meerp.entity.Role;

@Repository
public class RoleDaoImpl extends AbstractDaoImpl<Role, Integer> implements RoleDao{

	public RoleDaoImpl() {
		super(Role.class);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Role> findAll() {
		Query query = getCurrentSession().createQuery("FROM Role");
		List<Role> list = query.list();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Role> findUserRolesById(int userId) {
		SQLQuery query = getCurrentSession().createSQLQuery
				(" select r.id,r.role_name,r.cn_role_name from user u join user_role_relation urr join role r on u.id=urr.user_id and urr.role_id=r.id and u.id=:userId");
		query.setInteger("userId", userId);
		query.addEntity(Role.class);
		return query.list();
	}
}
