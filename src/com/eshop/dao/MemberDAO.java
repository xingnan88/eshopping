package com.eshop.dao;

import java.util.List;

import com.eshop.bean.Admin;
import com.eshop.bean.Member;

public interface MemberDAO {
	/**
	 * 校验会员
	 * @param param
	 * @return
	 */
	public List findByNameAndPwd(Object[] param);
	/**
	 * 保存或修改
	 * @param transientInstance
	 */
	public void saveOrUpdate(Member transientInstance);
	/**
	 * 校验后台用户
	 * @param strings
	 * @return
	 */
	public List<Admin> findAdminByNameAndPwd(String[] strings);
	/**
	 * 删除会员 
	 */
	public void delete(Member persistentInstance);
	/**
	 * 据编号查找 
	 */
	public Member findById(java.lang.Integer id);

}
