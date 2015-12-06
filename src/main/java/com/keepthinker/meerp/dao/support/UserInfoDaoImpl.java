package com.keepthinker.meerp.dao.support;

import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.keepthinker.meerp.dao.RoleDao;
import com.keepthinker.meerp.dao.UserInfoDao;
import com.keepthinker.meerp.entity.Role;
import com.keepthinker.meerp.entity.User;
import com.keepthinker.meerp.utils.UserUtils;

@Repository
public class UserInfoDaoImpl extends AbstractDaoImpl<User, Integer> implements UserInfoDao{

	@Autowired
	private RoleDao roleDao;
	
	public UserInfoDaoImpl() {
		super(User.class);
	}

	@Override
	public void delete(User user){
		SQLQuery query=getCurrentSession().createSQLQuery("delete from user_role_relation where user_id=?");
		query.setInteger(0, user.getId());
		query.executeUpdate();
		super.delete(user);
	}

	@Override
	public List<User> findAll(){
		List<User> users = super.findAll();
		for(User user : users){
			user.setRoles(findUserRolesById(user.getId()));
		}
		return users;
	}

	@Override
	public User findById(Integer id){
		User user = super.findById(id);
		if(user!=null){
			user.setRoles(findUserRolesById(id));
		}
		return user;
	}

	@Override
	public List<Role> findUserRolesById(int userId) {
		List<Role> roles = roleDao.findUserRolesById(userId);
		return roles;
	}
	
	@Override
	public List<User> findByProperty(String property, Object value){
		List<User> users = super.findByProperty(property, value);
		for(User user : users){
			user.setRoles(findUserRolesById(user.getId()));
		}
		return users;
	}

	@Override
	public int getNumberOfUsersByDep(String depName) {
		SQLQuery query=getCurrentSession().createSQLQuery("select count(*) from user where department=?");
		query.setString(0, depName);
		return ((java.math.BigInteger)query.list().get(0)).intValue();
	}

	@Override
	public List<User> getRecordsByPage(int pageNumber){ //n+1查询 a solution : SELECT * FROM hat WHERE catID IN (1, 2, 3, 4, 5, ...)

		List<User> users = super.getRecordsByPage(pageNumber);
		for(User user:users){
			user.setRoles(findUserRolesById(user.getId()));
		}
		return users;
	}

	@Override
	public int getUserIdByUserName(String userName){
		SQLQuery query=getCurrentSession().createSQLQuery("select id from user where user_name=? limit 1");
		query.setString(0, userName);
		return (int)query.list().get(0);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> getUsersByPageAndDep(int pageNumber, String depName) {
		String entity = "User";//can be com.keepthinker.meerp.entity.User
		int pageSize = config.getPageSize();
		String queryString = "FROM " + entity + " where department = :depName";
		Query query=getCurrentSession().createQuery(queryString);
		query.setString("depName", depName);
		query.setFirstResult((pageNumber -1) * pageSize);
		query.setMaxResults(config.getPageSize());
		List<User> users = query.list();
		for(User user:users){
			user.setRoles(findUserRolesById(user.getId()));
		}
		return users;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> getUsersByPageAndDep(String depName) {
		String entity = "User";//can be com.keepthinker.meerp.entity.User
		String queryString = "FROM " + entity + " where department = :depName";
		Query query=getCurrentSession().createQuery(queryString);
		query.setString("depName", depName);
		List<User> users = query.list();
		for(User user:users){
			user.setRoles(findUserRolesById(user.getId()));
		}
		return users;
	}

	@Override
	public Integer save(User user) {
		super.save(user);
		int userId=user.getId();
		for(Role role:user.getRoles()){
			String sql = "insert into user_role_relation(user_id, role_id) values(:user_id, :role_id)";
			SQLQuery query = getCurrentSession().createSQLQuery(sql);
			query.setInteger("user_id", userId);
			query.setInteger("role_id", role.getId());
			query.executeUpdate();
		}
		return userId;
	}


	@SuppressWarnings("unchecked")
	@Override
	public int updateUserInfo(int id, Map<String, Object> map) {

		StringBuilder fields = new StringBuilder();
		Object[] args = new Object[map.size()+1];
		List<Role> roles = null;
		int num = 0;
		int i = 0;
		for(String key:map.keySet()){
			if(key.equals("roles")){
				roles = (List<Role>) map.get(key);
			}else{
				fields.append(UserUtils.convertToDBFieldName(key)+"=?,");
				args[i++] = map.get(key);
			}
		}
		if(i>0){
			args[i]=id;
			String sql = "update user set "+fields.substring(0, fields.length()-1)
					+" where id=?";
			num = jdbcTemplate.update(sql,args);
		}
		if(roles!=null){
			num += jdbcTemplate.update("delete from user_role_relation where user_id = ?", id);
			String values="";
			for(Role role: roles){
				values+="("+id+","+role.getId()+"),";
			}
			values=values.substring(0, values.length()-1);
			num += jdbcTemplate.update("insert into user_role_relation(user_id,role_id) values"+values);
		}

		return num;
	}

	@SuppressWarnings("unchecked")
	@Override
	public int updateUserInfo(int id, String key, Object value) {
		int num = 0;
		List<Role> roles = null;
		if(key.equals("roles")){
			roles = (List<Role>)value;
			num += jdbcTemplate.update("delete from user_role_relation where user_id = ?", id);
			String values = "";
			for(Role role : roles){
				values += "(" + id + "," + role.getId() + "),";
			}
			values = values.substring(0, values.length()-1);
			num += jdbcTemplate.update("insert into user_role_relation(user_id,role_id) values"+values);
		}else{
			Object[] args = new Object[2];
			args[0] = value;
			args[1] = id;
			String sql = "update user set " + UserUtils.convertToDBFieldName(key) + " = ? where id=?";
			num += jdbcTemplate.update(sql,args);
		}
		return num;
	}
}
