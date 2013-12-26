package com.eshop.dao;

import java.util.List;

import com.eshop.bean.Merchantable;
import com.eshop.bean.Types;

public interface MerchantableDAO {
	public void saveOrUpdate(Merchantable transientInstance);
	public void delete(Merchantable persistentInstance);
	public Merchantable findById(java.lang.Integer id);
	public List findByExample(Merchantable instance);
	public List findByProperty(String propertyName, Object value);
	public List findByMerName(Object merName);
	public List findByMerPlace(Object merPlace);
	public List findByMerPrice(Object merPrice);
	public List findByMerDiscount(Object merDiscount);
	public List findByMerPicture(Object merPicture);
	public List findByMerDesc(Object merDesc);
	public List findByMerProducter(Object merProducter);
	public List findByMerLeaveDate(Object merLeaveDate);
	public List findAll();
	public Merchantable merge(Merchantable detachedInstance);
	public void attachDirty(Merchantable instance);
	public void attachClean(Merchantable instance);
	public List findByTypes(Object types);
	/**
	 * ���ؼ�����������
	 * @param types
	 * @param keyword
	 * @return
	 */
	public List<Merchantable> findByKeyword(Types types, String keyword);
	/**
	 * ���ؼ������������������
	 * @param keyword
	 * @return
	 */
	public List<Merchantable> findAllByKeyword(String keyword);
	/**
	 * �������۵����ݲ�ѯǰ10����Ʒ
	 * @return
	 */
	public List<Merchantable> findByNum();
	/**
	 * ���������ѯ������Ʒ
	 */
	public List findPartByTypes(int typeId);
}
