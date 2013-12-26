package com.eshop.dao;

import java.util.List;

import com.eshop.bean.Admin;
import com.eshop.bean.Member;

public interface MemberDAO {
	/**
	 * У���Ա
	 * @param param
	 * @return
	 */
	public List findByNameAndPwd(Object[] param);
	/**
	 * ������޸�
	 * @param transientInstance
	 */
	public void saveOrUpdate(Member transientInstance);
	/**
	 * У���̨�û�
	 * @param strings
	 * @return
	 */
	public List<Admin> findAdminByNameAndPwd(String[] strings);
	/**
	 * ɾ����Ա 
	 */
	public void delete(Member persistentInstance);
	/**
	 * �ݱ�Ų��� 
	 */
	public Member findById(java.lang.Integer id);

}
