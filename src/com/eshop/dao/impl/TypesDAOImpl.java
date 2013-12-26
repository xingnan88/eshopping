package com.eshop.dao.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.eshop.bean.Types;
import com.eshop.dao.TypesDAO;

/**
 * A data access object (DAO) providing persistence and search support for Types
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see com.eshop.bean.Types
 * @author MyEclipse Persistence Tools
 */

public class TypesDAOImpl extends HibernateDaoSupport implements TypesDAO{
	private static final Logger log = Logger.getLogger(TypesDAOImpl.class);
	// property constants
	public static final String TYPE_NAME = "typeName";
	public static final String TYPE_DESC = "typeDesc";

	protected void initDao() {
		// do nothing
	}

	public void saveOrUpdate(Types transientInstance) {
		log.debug("saving Types instance");
		try {
			getHibernateTemplate().saveOrUpdate(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Types persistentInstance) {
		log.debug("deleting Types instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Types findById(java.lang.Integer id) {
		log.debug("getting Types instance with id: " + id);
		try {
			Types instance = (Types) getHibernateTemplate().get(
					"com.eshop.bean.Types", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Types instance) {
		log.debug("finding Types instance by example");
		try {
			List results = getHibernateTemplate().findByExample(instance);
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Types instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Types as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByTypeName(Object typeName) {
		return findByProperty(TYPE_NAME, typeName);
	}

	public List findByTypeDesc(Object typeDesc) {
		return findByProperty(TYPE_DESC, typeDesc);
	}

	public List findAll() {
		log.debug("finding all Types instances");
		try {
			String queryString = "from Types";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Types merge(Types detachedInstance) {
		log.debug("merging Types instance");
		try {
			Types result = (Types) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Types instance) {
		log.debug("attaching dirty Types instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Types instance) {
		log.debug("attaching clean Types instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static TypesDAOImpl getFromApplicationContext(ApplicationContext ctx) {
		return (TypesDAOImpl) ctx.getBean("TypesDAO");
	}

	public List<Types> findByRecommend() {
		String hql = "from Types where typeRecommend = 1";
		return getHibernateTemplate().find(hql);
	}
}