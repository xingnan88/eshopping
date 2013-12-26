package com.eshop.dao.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.eshop.bean.Evaluate;
import com.eshop.bean.Merchantable;
import com.eshop.dao.EvaluateDAO;

/**
 * A data access object (DAO) providing persistence and search support for
 * Evaluate entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.eshop.bean.Evaluate
 * @author MyEclipse Persistence Tools
 */

public class EvaluateDAOImpl extends HibernateDaoSupport implements EvaluateDAO{
	private static final Logger log = Logger
			.getLogger(EvaluateDAOImpl.class);
	// property constants
	public static final String EVAL_DATE = "evalDate";
	public static final String EVAL_CONTENT = "evalContent";

	protected void initDao() {
		// do nothing
	}

	public void save(Evaluate transientInstance) {
		log.debug("saving Evaluate instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Evaluate persistentInstance) {
		log.debug("deleting Evaluate instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Evaluate findById(java.lang.Integer id) {
		log.debug("getting Evaluate instance with id: " + id);
		try {
			Evaluate instance = (Evaluate) getHibernateTemplate().get(
					"com.eshop.bean.Evaluate", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Evaluate instance) {
		log.debug("finding Evaluate instance by example");
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
		log.debug("finding Evaluate instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Evaluate as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByEvalDate(Object evalDate) {
		return findByProperty(EVAL_DATE, evalDate);
	}

	public List findByEvalContent(Object evalContent) {
		return findByProperty(EVAL_CONTENT, evalContent);
	}

	public List findAll() {
		log.debug("finding all Evaluate instances");
		try {
			String queryString = "from Evaluate";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Evaluate merge(Evaluate detachedInstance) {
		log.debug("merging Evaluate instance");
		try {
			Evaluate result = (Evaluate) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Evaluate instance) {
		log.debug("attaching dirty Evaluate instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Evaluate instance) {
		log.debug("attaching clean Evaluate instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static EvaluateDAOImpl getFromApplicationContext(ApplicationContext ctx) {
		return (EvaluateDAOImpl) ctx.getBean("EvaluateDAO");
	}

	public List<Evaluate> findByMerId(Merchantable merchantable) {
		String hql = "from Evaluate e where e.merchantable=?";
		return this.getHibernateTemplate().find(hql,merchantable);
	}
}