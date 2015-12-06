package com.keepthinker.meerp.dao.support;

import java.util.List;
import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.keepthinker.meerp.dao.EquipmentInfoDao;
import com.keepthinker.meerp.dao.UserInfoDao;
import com.keepthinker.meerp.entity.Equipment;
import com.keepthinker.meerp.entity.User;
import com.keepthinker.meerp.utils.EquipmentUtils;
import com.keepthinker.meerp.utils.ShiroSessionUtils;

@Repository
public class EquipmentInfoDaoImpl extends AbstractDaoImpl<Equipment, Integer>  implements EquipmentInfoDao {

	@Autowired
	private UserInfoDao userInfoDao ;

	@Autowired
	@Qualifier("nullUser")
	private User nullUser;

	public EquipmentInfoDaoImpl() {
		super(Equipment.class);
	}

	@Override
	public List<Equipment> findAll(){
		List<Equipment> equipments = super.findAll();
		setRelatedUsers(equipments);
		return equipments;
	}

	@Override
	public Equipment findById(Integer id) {
		Equipment equipment=super.findById(id);
		if(isPermited(equipment)==false){
			return null;
		}
		User director=userInfoDao.findById(equipment.getDirectorId());
		User operator=userInfoDao.findById(equipment.getOperatorId());
		setValidDirector(equipment, director);
		setValidOperator(equipment,operator);
		return equipment;
	}

	@Override
	public List<Equipment> findByProperty(String property, Object value){
		List<Equipment> equipments = super.findByProperty(property, value);
		setRelatedUsers(equipments);
		return equipments;
	}

	@Override
	public List<Equipment> getEqusByDirectorId(int directorId) {
		List<Equipment> equipments = findByCriteria(Restrictions.eq("directorId", directorId));
		setRelatedUsers(equipments);
		return equipments;
	}

	@Override
	public List<Equipment> getEqusByOperatorId(int operatorId) {
		List<Equipment> equipments = findByCriteria(Restrictions.eq("operatorId", operatorId));
		setRelatedUsers(equipments);
		return equipments;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Equipment> getEqusByPageAndDirId(int pageNumber, int directorId) {
		String entity = "Equipment";
		int pageSize = config.getPageSize();
		String queryString = "FROM " + entity + " where directorId = :directorId";
		Query query=getCurrentSession().createQuery(queryString);
		query.setInteger("directorId", directorId);
		query.setFirstResult((pageNumber -1) * pageSize);
		query.setMaxResults(config.getPageSize());
		List<Equipment> equipments = query.list();
		setRelatedUsers(equipments);
		return equipments;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Equipment> getEqusByPageAndOpeId(int pageNumber, int operatorId) {
		String entity = "Equipment";
		int pageSize = config.getPageSize();
		String queryString = "FROM " + entity + " where operatorId = :operatorId";
		Query query=getCurrentSession().createQuery(queryString);
		query.setInteger("operatorId", operatorId);
		query.setFirstResult((pageNumber -1) * pageSize);
		query.setMaxResults(config.getPageSize());
		List<Equipment> equipments = query.list();
		setRelatedUsers(equipments);
		return equipments;
	}

	@Override
	public int getNumberOfEquipmentByDirId(int directorId) {
		SQLQuery query=getCurrentSession().createSQLQuery("select count(*) from equipment where director_id=?");
		query.setInteger(0, directorId);
		return ((java.math.BigInteger)query.list().get(0)).intValue();
	}

	@Override
	public int getNumberOfEquipmentByOpeId(int operatorId) {
		SQLQuery query=getCurrentSession().createSQLQuery("select count(*) from equipment where operator_id=?");
		query.setInteger(0, operatorId);
		return ((java.math.BigInteger)query.list().get(0)).intValue();
	}

	@Override
	public List<Equipment> getRecordsByPage(int pageNumber){//出现n+1查询 或许可以优化

		List<Equipment> list=super.getRecordsByPage(pageNumber);
		for(Equipment e:list){
			User director=userInfoDao.findById(e.getDirectorId());
			setValidDirector(e, director);
			User operator=userInfoDao.findById(e.getOperatorId());
			setValidOperator(e,operator);
		}
		return list;
	}

	private void setRelatedUsers(List<Equipment> equipments){
		for(Equipment e : equipments){
			User director=userInfoDao.findById(e.getDirectorId());
			setValidDirector(e, director);
			User operator=userInfoDao.findById(e.getOperatorId());
			setValidOperator(e,operator);
		}
	}

	/**
	 * 防止已登录的用户，进行url重写访问无权限的数据，由于一般用户不会做这种事情，所以，不进行sql请求限制，而做对返回数据的判段，减少代码复杂 
	 * @param equipment
	 * @return 有权限访问该数据是返回真
	 */
	private boolean isPermited(Equipment equipment){
		if(SecurityUtils.getSubject().hasRole("administrator")==true
			||SecurityUtils.getSubject().hasRole("president")==true
			||SecurityUtils.getSubject().hasRole("equ_dep_person")==true){
			return true;
		}
		if(SecurityUtils.getSubject().hasRole("director")==true){
			User currentUser = (User)ShiroSessionUtils.getSessionAttribute("currentUser");
			if(equipment.getDirectorId() == currentUser.getId()){
				return true;
			}
		}
		if(SecurityUtils.getSubject().hasRole("operator")==true){
			User currentUser = (User)ShiroSessionUtils.getSessionAttribute("currentUser");
			if(equipment.getOperatorId() == currentUser.getId()){
				return true;
			}
		}
		return false;
	}

	private void setValidDirector(Equipment e, User director){
		if(director == null){
			e.setDirector(nullUser);
		}else{
			e.setDirector(director);
		}
	}

	private void setValidOperator(Equipment e, User operator){
		if(operator == null){
			e.setOperator(nullUser);
		}else{
			e.setOperator(operator);
		}
	}

	@Override
	public <T> int updateEquipmentInfo(int id,
			Map<String, T> map) {
		StringBuilder fields=new StringBuilder();
		Object[] args=new Object[map.size()+1];
		int i=0;
		for(String key:map.keySet()){
			fields.append(EquipmentUtils.convertToDBFieldName(key)+"=?,");
			args[i++]=map.get(key);
		}
		args[i]=id;
		String sql="update equipment set "+fields.substring(0, fields.length()-1)
				+" where id=?";
		int num = jdbcTemplate.update(sql,args);
		return num;
	}
}
