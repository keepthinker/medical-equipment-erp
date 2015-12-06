package com.keepthinker.meerp.dao.support;

import java.io.Serializable;
import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.keepthinker.meerp.config.SystemConfig;
import com.keepthinker.meerp.dao.AbstractDao;
import com.keepthinker.meerp.entity.Equipment;
import com.keepthinker.meerp.entity.Role;
import com.keepthinker.meerp.entity.User;
import com.keepthinker.meerp.utils.ShiroSessionUtils;

public abstract class AbstractDaoImpl<E, I extends Serializable> implements AbstractDao<E,I> {

	private Class<E> entityClass;

	@Autowired
	protected SystemConfig config;

	@Autowired
	protected JdbcTemplate jdbcTemplate;

	@Autowired
	private SessionFactory sessionFactory;

	protected AbstractDaoImpl(Class<E> entityClass) {
		this.entityClass = entityClass;
	}

	@Override
	public void delete(E e) {
		getCurrentSession().delete(e);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<E> findAll(){
		return getCurrentSession().createQuery("FROM "+entityClass.getName()).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<E> findByCriteria(Criterion criterion) {
		Criteria criteria = getCurrentSession().createCriteria(entityClass);
		criteria.add(criterion);
		return criteria.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public E findById(I id) {
		return (E) getCurrentSession().get(entityClass, id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<E> findByProperty(String property, Object value){
		String entityName = getEntityName();
		Criteria cri = getCurrentSession().createCriteria(entityName);
		if(value.getClass() == String.class){
			cri.add(Restrictions.like(property, (String)value, MatchMode.ANYWHERE));
		}else{
			cri.add(Restrictions.like(property, value));
		}
		cri.setFirstResult(0);
		cri.setMaxResults(config.getSearchResultSize());

		if(SecurityUtils.getSubject().hasRole("director")==true
				&&(SecurityUtils.getSubject().hasRole("administrator")==false
				&&SecurityUtils.getSubject().hasRole("president")==false
				&&SecurityUtils.getSubject().hasRole("equ_dep_person")==false)){
			if(entityClass == Equipment.class){
				cri.add(Restrictions.eq("directorId", ShiroSessionUtils.getSessionAttribute("currentUserId")));
			}else if(entityClass == User.class){
				cri.add(Restrictions.eq("department",((User)ShiroSessionUtils.getSessionAttribute("currentUser")).getDepartment()));
			}
		}
		return cri.list();
	}

	public Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}

	/**
	 * 获取该DAO对象对应的实体类的全名，如"com.keepthinker.meerp.entity.User"
	 * @return
	 */
	private String getEntityName(){
		String entity = "";
		if(entityClass == User.class){
			entity = "com.keepthinker.meerp.entity.User";
		}else if(entityClass == Equipment.class){
			entity = "com.keepthinker.meerp.entity.Equipment";
		}else if(entityClass == Role.class){
			entity = "com.keepthinker.meerp.entity.Role";
		}
		return entity;
	}

	@Override
	public int getNumberOfRecords() {
		String table = "user";
		if(entityClass == User.class){
			table = "user";
		}else if(entityClass == Equipment.class){
			table = "equipment";
		}
		int count = jdbcTemplate.queryForObject("select count(*) from " + table, Integer.class);
		System.out.println(count);
		return count;

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<E> getRecordsByPage(int pageNumber){
		String entity = getEntityName();
		int pageSize = config.getPageSize();
		String queryString = "FROM " + entity;
		Query query=getCurrentSession().createQuery(queryString);
		query.setFirstResult((pageNumber -1) * pageSize);
		query.setMaxResults(config.getPageSize());
		List<E> list = query.list();
		return list;
	}

	@SuppressWarnings("unchecked")
	public I save(E e){
		return (I) getCurrentSession().save(e);
	}

	@Override
	public void saveOrUpdate(E e) {
		getCurrentSession().saveOrUpdate(e);
	}

}
