package com.keepthinker.meerp.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.criterion.Criterion;

public interface AbstractDao<E,I extends Serializable> {
	E findById(I id);
    void saveOrUpdate(E e);
    /**
     * 
     * @param e
     * @return 返回生成的数据库中实体的id
     */
    I save(E e);
    void delete(E e);
    List<E> findByCriteria(Criterion criterion);
    /**
     * 数据库中所有记录的条数
     * @return
     */
    int getNumberOfRecords();

    List<E> getRecordsByPage(int pageNumber);
    
    List<E> findAll();
    
	List<E> findByProperty(String property, Object value);
}
