package com.eshop.dao;

import java.util.List;

import org.springframework.context.ApplicationContext;

import com.eshop.bean.Types;
import com.eshop.dao.impl.TypesDAOImpl;

public interface TypesDAO {
	public void saveOrUpdate(Types transientInstance);
	public void delete(Types persistentInstance);
	public Types findById(java.lang.Integer id);
	public List findByExample(Types instance);
	public List findByProperty(String propertyName, Object value);
	public List findByTypeName(Object typeName);
	public List findByTypeDesc(Object typeDesc);
	public List findAll();
	public Types merge(Types detachedInstance);
	public void attachDirty(Types instance);
	public void attachClean(Types instance);
	/**
	 * ²éÑ¯ÍÆ¼öÀà
	 * @return
	 */
	public List<Types> findByRecommend();
}
