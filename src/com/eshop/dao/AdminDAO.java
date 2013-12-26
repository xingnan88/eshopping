package com.eshop.dao;

import java.util.List;

import com.eshop.bean.Admin;


public interface AdminDAO {
/**
 * 显示所有信息
 */
	public List findAll();
	public void saveOrUpdate(Admin transientInstance);
	public List findByAdminName(Object adminName);
	public Admin findById(java.lang.Integer id);
}
