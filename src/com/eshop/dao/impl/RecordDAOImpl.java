package com.eshop.dao.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.eshop.bean.Record;
import com.eshop.dao.RecordDAO;

/**
 * A data access object (DAO) providing persistence and search support for
 * Record entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.eshop.bean.Record
 * @author MyEclipse Persistence Tools
 */

public class RecordDAOImpl extends HibernateDaoSupport implements RecordDAO{
	private static final Logger log = Logger.getLogger(RecordDAOImpl.class);
	// property constants
	public static final String RECORD_MER_NUM = "recordMerNum";

	protected void initDao() {
		// do nothing
	}

	public void save(Record transientInstance) {
		log.debug("saving Record instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Record persistentInstance) {
		log.debug("deleting Record instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Record findById(java.lang.Integer id) {
		log.debug("getting Record instance with id: " + id);
		try {
			Record instance = (Record) getHibernateTemplate().get(
					"com.eshop.bean.Record", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Record instance) {
		log.debug("finding Record instance by example");
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
		log.debug("finding Record instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Record as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByRecordMerNum(Object recordMerNum) {
		return findByProperty(RECORD_MER_NUM, recordMerNum);
	}

	public List findAll() {
		log.debug("finding all Record instances");
		try {
			String queryString = "from Record";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Record merge(Record detachedInstance) {
		log.debug("merging Record instance");
		try {
			Record result = (Record) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Record instance) {
		log.debug("attaching dirty Record instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Record instance) {
		log.debug("attaching clean Record instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static RecordDAOImpl getFromApplicationContext(ApplicationContext ctx) {
		return (RecordDAOImpl) ctx.getBean("RecordDAO");
	}

	public List<Record> findByOrderId(String orderId) {
		String hql = "from Record r where r.orders.orderId = ?";
		return getHibernateTemplate().find(hql, Integer.parseInt(orderId));
	}
	
}