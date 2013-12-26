package com.eshop.action;

import java.io.UnsupportedEncodingException;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.eshop.bean.Member;
import com.eshop.bean.PageBean;
import com.eshop.service.PageService;
import com.eshop.service.UserService;
import com.eshop.tool.DateTime;
import com.eshop.tool.MD5;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport implements SessionAware {
	private UserService userService;
	private String username;
	private String password;
	private String rand;
	private String newpwd;
	private String renewpwd;
	private String memTel;
	private String memPost;
	private String memEmail;
	private String memAddress;
	private PageService pageService;
	private String page;//��ҳ
	private PageBean pageBean;
	private String memId;

	
	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public PageBean getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}

	public PageService getPageService() {
		return pageService;
	}

	public void setPageService(PageService pageService) {
		this.pageService = pageService;
	}

	public String getMemTel() {
		return memTel;
	}

	public void setMemTel(String memTel) {
		this.memTel = memTel;
	}

	public String getMemPost() {
		return memPost;
	}

	public void setMemPost(String memPost) {
		this.memPost = memPost;
	}

	public String getMemEmail() {
		return memEmail;
	}

	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}

	public String getMemAddress() {
		return memAddress;
	}

	public void setMemAddress(String memAddress) {
		this.memAddress = memAddress;
	}

	public String getNewpwd() {
		return newpwd;
	}

	public void setNewpwd(String newpwd) {
		this.newpwd = newpwd;
	}

	public String getRenewpwd() {
		return renewpwd;
	}

	public void setRenewpwd(String renewpwd) {
		this.renewpwd = renewpwd;
	}

	public String getRand() {
		return rand;
	}

	public void setRand(String rand) {
		this.rand = rand;
	}

	private Map session;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public String modifyPwd() {
		Member member = (Member) session.get("member");
		int result = userService.modifyPwd(member, username, newpwd, renewpwd,
				password);
		switch (result) {
		case 1: 
			this.addActionError("ԭ���벻��ȷ"); break;
		case 2: 
			this.addActionError("�����������벻ͬ");break;
		case 3: 
			{
				this.addActionError("�޸ĳɹ�");
				member.setMemPwd(newpwd);
				session.put("member", member);//��session�е��û������޸�
			}
		}
		return "modify";
	}
	/**
	 * �޸ĵ�ַ
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public String modifyAddress() throws UnsupportedEncodingException{
		Member member = (Member) session.get("member");
		member.setMemAddress(memAddress);
		member.setMemEmail(memEmail);
		member.setMemPost(memPost);
		member.setMemTel(memTel);
		userService.modifyAddress(member);
		session.put("member", member);
		this.addActionMessage("�޸ĳɹ�");
		return "modifyaddress";
	}
	/**
	 * �û�ע��
	 * @return
	 */
	public String regist(){
		Member member = new Member();
		member.setMemName(username);
		password = new MD5().complie(password);
		member.setMemPwd(password);
		member.setMemTel(memTel);
		member.setMemEmail(memEmail);
		member.setMemAddress(memAddress);
		member.setMemPost(memPost);
		member.setMemRegistDate(DateTime.getDate());
		this.userService.save(member);
		this.addActionError("ע��ɹ�");
		return "regist";
	}
	
	
	/**
	 * ��̨��ʾ���л�Ա��Ϣ
	 */
	public String showMem(){
		String hql = "from Member";
		String action = "back/jsp/mem!showMem";
		int pageSize = 10;
		this.setPageBean(pageService.queryForPage(hql, action, pageSize, Integer.parseInt(page)));
		return SUCCESS;
	}
	/**
	 * ��̨ɾ����Ա
	 */
	public String delMem(){
		userService.delMem(memId);
		showMem();
		this.addActionError("ɾ���ɹ�");
		return "del";
	}
}
