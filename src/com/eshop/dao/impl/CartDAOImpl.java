package com.eshop.dao.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.eshop.bean.Cart;
import com.eshop.bean.Member;
import com.eshop.bean.Merchantable;
import com.eshop.dao.CartDAO;

/**
 * A data access object (DAO) providing persistence and search support for Cart
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see com.eshop.bean.Cart
 * @author MyEclipse Persistence Tools
 */

public class CartDAOImpl extends HibernateDaoSupport implements CartDAO{
	private static final Logger log = Logger.getLogger(CartDAOImpl.class);
	// property constants
	public static final String CART_NUM = "cartNum";

	protected void initDao() {
		// do nothing
	}

	public void save(Cart transientInstance) {
		log.debug("saving Cart instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Cart persistentInstance) {
		log.debug("deleting Cart instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Cart findById(java.lang.Integer id) {
		log.debug("getting Cart instance with id: " + id);
		try {
			Cart instance = (Cart) getHibernateTemplate().get(
					"com.eshop.bean.Cart", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Cart instance) {
		log.debug("finding Cart instance by example");
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
		log.debug("finding Cart instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Cart as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByCartNum(Object cartNum) {
		return findByProperty(CART_NUM, cartNum);
	}

	public List findAll() {
		log.debug("finding all Cart instances");
		try {
			String queryString = "from Cart";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Cart merge(Cart detachedInstance) {
		log.debug("merging Cart instance");
		try {
			Cart result = (Cart) getHibernateTemplate().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Cart instance) {
		log.debug("attaching dirty Cart instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Cart instance) {
		log.debug("attaching clean Cart instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static CartDAOImpl getFromApplicationContext(ApplicationContext ctx) {
		return (CartDAOImpl) ctx.getBean("CartDAO");
	}

	public List<Cart> findByMember(Member member) {
		String hql = "from Cart c where c.member = ?";
		return getHibernateTemplate().find(hql, member);
	}

	public List<Cart> findByMer(Merchantable merchantable) {
		String hql = "from Cart c where c.merchantable = ?";
		List<Cart> list = getHibernateTemplate().find(hql, merchantable);
		return list;
	}
	public void update(Cart cart){
		getHibernateTemplate().update(cart);
	}

	public void deleteAll() {
		getHibernateTemplate().deleteAll(this.findAll());
	}

}