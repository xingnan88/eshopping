package com.eshop.dao;

import java.util.List;

import com.eshop.bean.Member;
import com.eshop.bean.Orders;

public interface OrdersDAO {
	public void saveOrUpdate(Orders transientInstance);
	/**
	 * 查看/修改用户的历史清单
	 * @param member
	 * @param status 1查看历史清单 0修改清单(删除)
	 */
	public List<Orders> findByHistoryOrder(Member member, int status);
	/**
	 * 删除
	 */
	public void delete(Orders persistentInstance);
	public Orders findById(java.lang.Integer id);
	public List findAll();
}
