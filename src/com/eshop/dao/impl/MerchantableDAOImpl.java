package com.eshop.dao.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Set;

import org.apache.log4j.Logger;
import org.hibernate.HibernateException;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.eshop.bean.Merchantable;
import com.eshop.bean.Types;
import com.eshop.dao.MerchantableDAO;

/**
 * A data access object (DAO) providing persistence and search support for
 * Merchantable entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.eshop.bean.Merchantable
 * @author MyEclipse Persistence Tools
 */

public class MerchantableDAOImpl extends HibernateDaoSupport implements MerchantableDAO{
	private static final Logger log = Logger
			.getLogger(MerchantableDAOImpl.class);
	// property constants
	public static final String MER_NAME = "merName";
	public static final String MER_PLACE = "merPlace";
	public static final String MER_PRICE = "merPrice";
	public static final String MER_DISCOUNT = "merDiscount";
	public static final String MER_PICTURE = "merPicture";
	public static final String MER_DESC = "merDesc";
	public static final String MER_PRODUCTER = "merProducter";
	public static final String MER_LEAVE_DATE = "merLeaveDate";

	protected void initDao() {
		// do nothing
	}
	
	public void saveOrUpdate(Merchantable transientInstance) {
		log.debug("saving Merchantable instance");
		try {
			getHibernateTemplate().saveOrUpdate(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Merchantable persistentInstance) {
		log.debug("deleting Merchantable instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Merchantable findById(java.lang.Integer id) {
		log.debug("getting Merchantable instance with id: " + id);
		try {
			Merchantable instance = (Merchantable) getHibernateTemplate().get(
					"com.eshop.bean.Merchantable", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Merchantable instance) {
		log.debug("finding Merchantable instance by example");
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
		log.debug("finding Merchantable instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from Merchantable as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	public List findByTypes(Object types){
		String hql = "from Merchantable where types=?";
		return getHibernateTemplate().find(hql,types);
	}
	public List findPartByTypes(int typeId){
		final String hql = "from Merchantable m where m.types.typeId="+ typeId+" order by merNum desc";
		List list = getHibernateTemplate().executeFind(new HibernateCallback(){

			public Object doInHibernate(Session arg0)
					throws HibernateException, SQLException {
				Query query = arg0.createQuery(hql);
				query.setFirstResult(0);
				query.setMaxResults(5);
				return query.list();
			}
			
		});
		return list;
	}

	public List findByMerName(Object merName) {
		return findByProperty(MER_NAME, merName);
	}

	public List findByMerPlace(Object merPlace) {
		return findByProperty(MER_PLACE, merPlace);
	}

	public List findByMerPrice(Object merPrice) {
		return findByProperty(MER_PRICE, merPrice);
	}

	public List findByMerDiscount(Object merDiscount) {
		return findByProperty(MER_DISCOUNT, merDiscount);
	}

	public List findByMerPicture(Object merPicture) {
		return findByProperty(MER_PICTURE, merPicture);
	}

	public List findByMerDesc(Object merDesc) {
		return findByProperty(MER_DESC, merDesc);
	}

	public List findByMerProducter(Object merProducter) {
		return findByProperty(MER_PRODUCTER, merProducter);
	}

	public List findByMerLeaveDate(Object merLeaveDate) {
		return findByProperty(MER_LEAVE_DATE, merLeaveDate);
	}

	public List findAll() {
		log.debug("finding all Merchantable instances");
		List list = null;
		try {
			final String queryString = "from Merchantable order by merId desc";
			 list = getHibernateTemplate().executeFind(new HibernateCallback(){
				public Object doInHibernate(Session session)
						throws HibernateException, SQLException {
					Query query = session.createQuery(queryString);
					query.setFirstResult(0);
					query.setMaxResults(10);
					List list = query.list();
					return list;
				}
				
			});
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
		return list;
	}

	public Merchantable merge(Merchantable detachedInstance) {
		log.debug("merging Merchantable instance");
		try {
			Merchantable result = (Merchantable) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Merchantable instance) {
		log.debug("attaching dirty Merchantable instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Merchantable instance) {
		log.debug("attaching clean Merchantable instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static MerchantableDAOImpl getFromApplicationContext(
			ApplicationContext ctx) {
		return (MerchantableDAOImpl) ctx.getBean("MerchantableDAO");
	}

	public List<Merchantable> findByKeyword(Types types, String keyword) {
		String hql = "from Merchantable m where m.types = ? and merName like '%"+keyword+"%'";
		return getHibernateTemplate().find(hql,types);
	}

	public List<Merchantable> findAllByKeyword(String keyword) {
		String hql = "from Merchantable where merName like '%"+keyword+"%'";
		
		return getHibernateTemplate().find(hql);
	}

	public List<Merchantable> findByNum() {
		final String hql = "from Merchantable  order by merNum desc";
		List list = getHibernateTemplate().executeFind(new HibernateCallback(){
			public Object doInHibernate(Session arg0)
					throws HibernateException, SQLException {
				Query query = arg0.createQuery(hql);
				query.setFirstResult(0);
				query.setMaxResults(10);
				return query.list();
			}
			
		});
		return list;
	}
}