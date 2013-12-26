package com.eshop.action;

import java.util.Map;

import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.SessionAware;

import com.eshop.bean.Member;
import com.eshop.service.UserService;
import com.opensymphony.xwork2.ActionSupport;

public class LoginJsonAction extends ActionSupport implements SessionAware{
	private Map session;
	private String username;
	private String password;
	private String rand;
	private String result;
	private UserService userService;
	private static final Logger log = Logger.getLogger(LoginJsonAction.class);

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

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

	public String getRand() {
		return rand;
	}

	public void setRand(String rand) {
		this.rand = rand;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	public String execute() {
		Member member = userService.validateMem(username, password);
		String rand2 = (String) session.get("rand");
		if (member != null) {
			if (this.rand.equalsIgnoreCase(rand2)) {
				session.put("member", member);
				log.error(username+"登陆");
				this.setResult(member.getMemName());
			} else {
				this.setResult("验证码错误");
			}
		} else {
			this.setResult("用户名或密码错误");
		}
		return SUCCESS;
	}

}
