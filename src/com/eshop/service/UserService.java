package com.eshop.service;

import java.util.List;

import com.eshop.bean.Admin;
import com.eshop.bean.Member;

public interface UserService {
	/**
	 * 验证会员登陆
	 * @param username
	 * @param password
	 */
	Member validateMem(String username, String password);
	/**
	 * 修改用户名或密码
	 * @param member
	 * @param username
	 * @param newpwd
	 * @param renewpwd
	 * @return 1 原密码不正确 2两次密码不同 3修改成功
	 */
	int modifyPwd(Member member, String username, String newpwd,String renewpwd, String password);
	/**
	 * 修改地址等信息
	 * @param member
	 */
	void modifyAddress(Member member);
	/**
	 * 校验后台用户
	 * @param username
	 * @param password
	 * @return
	 */
	Admin validateAdmin(String username, String password);
	/**
	 * 删除会员
	 * @param parseInt
	 */
	void delMem(String memId);
	/**
	 * 注册用户
	 * @param member
	 */
	void save(Member member);
	/**
	 * 查询所有admin
	 * @return
	 */
	List<Admin> showAllAdmin();
	/**
	 * 保存管理员
	 * @param admin
	 */
	void saveAdmin(Admin admin);
	/**
	 * 修改管理员
	 * @param adminName
	 * @param adminType
	 */
	void updateAdmin(String adminId, String adminName, String adminType);
	/**
	 * 修改密码
	 * @param password
	 * @param newPwd
	 * @param adminPwd
	 */
	int updatePwd(String password, String newPwd, String adminPwd, String adminId);
	

}
