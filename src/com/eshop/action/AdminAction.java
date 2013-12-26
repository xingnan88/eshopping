package com.eshop.action;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.SessionAware;

import com.eshop.bean.Admin;
import com.eshop.service.UserService;
import com.opensymphony.xwork2.ActionSupport;

public class AdminAction extends ActionSupport implements SessionAware
{
	private UserService userService;
	private String username;
	private String password;
	private Map session;
	private String rand;
	private List<Admin> admins;
	private String adminName;
	private String adminType;
	private String adminId;
	private String newPwd;
	private String adminPwd;
	private static final Logger log = Logger.getLogger(AdminAction.class);

	public String getAdminPwd()
	{
		return adminPwd;
	}

	public void setAdminPwd(String adminPwd)
	{
		this.adminPwd = adminPwd;
	}

	public String getNewPwd()
	{
		return newPwd;
	}

	public void setNewPwd(String newPwd)
	{
		this.newPwd = newPwd;
	}

	public String getAdminId()
	{
		return adminId;
	}

	public void setAdminId(String adminId)
	{
		this.adminId = adminId;
	}

	public String getAdminName()
	{
		return adminName;
	}

	public void setAdminName(String adminName)
	{
		this.adminName = adminName;
	}

	public String getAdminType()
	{
		return adminType;
	}

	public void setAdminType(String adminType)
	{
		this.adminType = adminType;
	}

	public List<Admin> getAdmins()
	{
		return admins;
	}

	public void setAdmins(List<Admin> admins)
	{
		this.admins = admins;
	}

	public String getUsername()
	{
		return username;
	}

	public void setUsername(String username)
	{
		this.username = username;
	}

	public String getPassword()
	{
		return password;
	}

	public void setPassword(String password)
	{
		this.password = password;
	}

	public String getRand()
	{
		return rand;
	}

	public void setRand(String rand)
	{
		this.rand = rand;
	}

	public void setSession(Map<String, Object> session)
	{
		this.session = session;
	}

	public UserService getUserService()
	{
		return userService;
	}

	public void setUserService(UserService userService)
	{
		this.userService = userService;
	}

	@Override
	public String execute()
	{
		this.setAdmins(this.userService.showAllAdmin());
		return SUCCESS;
	}

	// 后台用户登录校验
	public String valAdmin()
	{
		Admin admin = userService.validateAdmin(username, password);
		String rand2 = (String) session.get("rand");
		if (admin != null)
		{
			if (this.rand.equalsIgnoreCase(rand2))
			{
				session.put("admin", admin);
				log.error(username + "登录");
				return SUCCESS;
			} else
			{
				this.addActionError("验证码错误");
			}
		} else
		{
			this.addActionError("用户名或密码错误");
		}
		return ERROR;
	}

	// 保存管理员
	public String save()
	{
		Admin admin = new Admin();
		admin.setAdminName(adminName);
		admin.setAdminType(Integer.parseInt(adminType));
		admin.setAdminPwd("123");// 默认密码为123
		this.userService.saveAdmin(admin);
		execute();
		return "save";
	}

	// 修改管理员
	public String update()
	{
		this.userService.updateAdmin(adminId, adminName, adminType);
		this.addActionError("修改成功");
		return "update";
	}

	// 修改管理员密码
	public String modifyPwd()
	{
		int result = this.userService.updatePwd(this.password, this.newPwd,
				this.adminPwd, this.adminId);
		switch (result)
		{
		case 0:
			this.addActionError("原密码不正确");
			break;
		case 1:
			this.addActionError("两次密码不同");
			break;
		case 2:
			this.addActionError("密码修改成功");
		}
		return "modifyPwd";
	}

	// 管理员退出
	public String exit()
	{
		session.clear();
		return "exit";
	}
}
