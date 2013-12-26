package com.eshop.dao;

import java.util.List;

import com.eshop.bean.Member;
import com.eshop.bean.Orders;

public interface OrdersDAO {
	public void saveOrUpdate(Orders transientInstance);
	/**
	 * �鿴/�޸��û�����ʷ�嵥
	 * @param member
	 * @param status 1�鿴��ʷ�嵥 0�޸��嵥(ɾ��)
	 */
	public List<Orders> findByHistoryOrder(Member member, int status);
	/**
	 * ɾ��
	 */
	public void delete(Orders persistentInstance);
	public Orders findById(java.lang.Integer id);
	public List findAll();
}
