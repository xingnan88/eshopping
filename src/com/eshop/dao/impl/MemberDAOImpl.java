package com.eshop.dao.impl;

import java.util.List;
import java.util.Set;

import org.apache.log4j.Logger;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.eshop.bean.Admin;
import com.eshop.bean.Member;
import com.eshop.dao.MemberDAO;

/**
 * A data access object (DAO) providing persistence and search support for
 * Member entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.eshop.bean.Member
 * @author MyEclipse Persistence Tools
 */

public class MemberDAOImpl extends HibernateDaoSupport implements MemberDAO{
	private static final Logger log = Logger.getLogger(MemberDAOImpl.class);
	// property constants
	public static final String MEM_NAME = "memName";
	public static final String MEM_PWD = "memPwd";
	public static final String MEM_TYPE = "memType";
	public static final String MEM_TEL = "memTel";
	public static final String MEM_ADDRESS = "memAddress";
	public static final String MEM_REGIST_DATE = "memRegistDate";
	public static final String MEM_POST = "memPost";
	public static final String MEM_EMAIL = "memEmail";

	protected void initDao() {
		// do nothing
	}

	public void saveOrUpdate(Member transientInstance) {
		log.debug("saving Member instance");
		try {
			getHibernateTemplate().saveOrUpdate(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Member persistentInstance) {
		log.debug("deleting Member instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Member findById(java.lang.Integer id) {
		log.debug("getting Member instance with id: " + id);
		try {
			Member instance = (Member) getHibernateTemplate().get(
					"com.eshop.bean.Member", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Member instance) {
		log.debug("finding Member instance by example");
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
		log.debug("finding Member instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Member as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByMemName(Object memName) {
		return findByProperty(MEM_NAME, memName);
	}

	public List findByMemPwd(Object memPwd) {
		return findByProperty(MEM_PWD, memPwd);
	}

	public List findByMemType(Object memType) {
		return findByProperty(MEM_TYPE, memType);
	}

	public List findByMemTel(Object memTel) {
		return findByProperty(MEM_TEL, memTel);
	}

	public List findByMemAddress(Object memAddress) {
		return findByProperty(MEM_ADDRESS, memAddress);
	}

	public List findByMemRegistDate(Object memRegistDate) {
		return findByProperty(MEM_REGIST_DATE, memRegistDate);
	}

	public List findByMemPost(Object memPost) {
		return findByProperty(MEM_POST, memPost);
	}

	public List findByMemEmail(Object memEmail) {
		return findByProperty(MEM_EMAIL, memEmail);
	}
	public List findByNameAndPwd(Object[] param){
		String hql = "from Member where memName=? and memPwd=?";
		return getHibernateTemplate().find(hql, param);
	}
	public List findAll() {
		log.debug("finding all Member instances");
		try {
			String queryString = "from Member";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Member merge(Member detachedInstance) {
		log.debug("merging Member instance");
		try {
			Member result = (Member) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Member instance) {
		log.debug("attaching dirty Member instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Member instance) {
		log.debug("attaching clean Member instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static MemberDAOImpl getFromApplicationContext(ApplicationContext ctx) {
		return (MemberDAOImpl) ctx.getBean("MemberDAO");
	}

	public List<Admin> findAdminByNameAndPwd(String[] param) {
		String hql = "from Admin where adminName=? and adminPwd=?";
		return getHibernateTemplate().find(hql, param);
	}
}