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
	 * 按关键字种类搜索
	 * @param types
	 * @param keyword
	 * @return
	 */
	public List<Merchantable> findByKeyword(Types types, String keyword);
	/**
	 * 按关键字在所有类别中搜索
	 * @param keyword
	 * @return
	 */
	public List<Merchantable> findAllByKeyword(String keyword);
	/**
	 * 依据销售的数据查询前10的商品
	 * @return
	 */
	public List<Merchantable> findByNum();
	/**
	 * 依据种类查询部分商品
	 */
	public List findPartByTypes(int typeId);
}
