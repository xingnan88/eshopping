package com.eshop.service;

import java.util.List;

import com.eshop.bean.Admin;
import com.eshop.bean.Member;

public interface UserService {
	/**
	 * ��֤��Ա��½
	 * @param username
	 * @param password
	 */
	Member validateMem(String username, String password);
	/**
	 * �޸��û���������
	 * @param member
	 * @param username
	 * @param newpwd
	 * @param renewpwd
	 * @return 1 ԭ���벻��ȷ 2�������벻ͬ 3�޸ĳɹ�
	 */
	int modifyPwd(Member member, String username, String newpwd,String renewpwd, String password);
	/**
	 * �޸ĵ�ַ����Ϣ
	 * @param member
	 */
	void modifyAddress(Member member);
	/**
	 * У���̨�û�
	 * @param username
	 * @param password
	 * @return
	 */
	Admin validateAdmin(String username, String password);
	/**
	 * ɾ����Ա
	 * @param parseInt
	 */
	void delMem(String memId);
	/**
	 * ע���û�
	 * @param member
	 */
	void save(Member member);
	/**
	 * ��ѯ����admin
	 * @return
	 */
	List<Admin> showAllAdmin();
	/**
	 * �������Ա
	 * @param admin
	 */
	void saveAdmin(Admin admin);
	/**
	 * �޸Ĺ���Ա
	 * @param adminName
	 * @param adminType
	 */
	void updateAdmin(String adminId, String adminName, String adminType);
	/**
	 * �޸�����
	 * @param password
	 * @param newPwd
	 * @param adminPwd
	 */
	int updatePwd(String password, String newPwd, String adminPwd, String adminId);
	

}
