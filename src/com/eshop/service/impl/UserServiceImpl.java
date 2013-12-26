package com.eshop.service.impl;

import java.util.List;

import com.eshop.bean.Admin;
import com.eshop.bean.Member;
import com.eshop.dao.AdminDAO;
import com.eshop.dao.CartDAO;
import com.eshop.dao.MemberDAO;
import com.eshop.service.UserService;
import com.eshop.tool.MD5;

public class UserServiceImpl implements UserService{
	private CartDAO cartDAO;
	private MemberDAO memberDAO;
	private AdminDAO adminDAO;
	
	public AdminDAO getAdminDAO() {
		return adminDAO;
	}
	public void setAdminDAO(AdminDAO adminDAO) {
		this.adminDAO = adminDAO;
	}
	public CartDAO getCartDAO() {
		return cartDAO;
	}
	public void setCartDAO(CartDAO cartDAO) {
		this.cartDAO = cartDAO;
	}
	public MemberDAO getMemberDAO() {
		return memberDAO;
	}
	public void setMemberDAO(MemberDAO memberDAO) {
		this.memberDAO = memberDAO;
	}

	public Member validateMem(String username, String password) {
		password = new MD5().complie(password);
		List<Member> members = memberDAO.findByNameAndPwd(new String[]{username, password});
		if(members.size() == 0){
			return null;
		}
		return members.get(0);
	}
	public int modifyPwd(Member member, String username, String newpwd, String renewpwd, String password) {
		password = new MD5().complie(password);
		if(!member.getMemPwd().equals(password)){
			return 1;
		}
		if(!renewpwd.equals(newpwd)){
			return 2;
		}
		member.setMemName(username);
		newpwd = new MD5().complie(newpwd);
		member.setMemPwd(newpwd);
		memberDAO.saveOrUpdate(member);
		return 3;
	}
	public void modifyAddress(Member member) {
		memberDAO.saveOrUpdate(member);
	}
	public Admin validateAdmin(String username, String password) {
		password = new MD5().complie(password);
		List<Admin> admins = memberDAO.findAdminByNameAndPwd(new String[]{username, password});
		if(admins.size() == 0){
			return null;
		}
		return admins.get(0);
	}
	public void delMem(String memId) {
		Member member = memberDAO.findById(Integer.parseInt(memId));
		memberDAO.delete(member);
	}
	public void save(Member member) {
		memberDAO.saveOrUpdate(member);
	}
	public List<Admin> showAllAdmin() {
		return adminDAO.findAll();
	}
	public void saveAdmin(Admin admin) {
		adminDAO.saveOrUpdate(admin);
	}
	public void updateAdmin(String adminId, String adminName, String adminType) {
		Admin admin = adminDAO.findById(Integer.parseInt(adminId));
		admin.setAdminName(adminName);
		admin.setAdminType(Integer.parseInt(adminType));
		adminDAO.saveOrUpdate(admin);
	}
	public int updatePwd(String password, String newPwd, String adminPwd, String adminId) {
		Admin admin = adminDAO.findById(Integer.parseInt(adminId));
		adminPwd = new MD5().complie(adminPwd);
		//与原密码不相等返回0
		if(!adminPwd.equalsIgnoreCase(admin.getAdminPwd())){
			return 0;
		}
		//两次密码不相同
		if(!password.equalsIgnoreCase(newPwd)){
			return 1;
		}
		newPwd = new MD5().complie(newPwd);
		admin.setAdminPwd(newPwd);
		adminDAO.saveOrUpdate(admin);
		return 2;
	}
	
}
