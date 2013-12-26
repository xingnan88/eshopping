package com.eshop.action;

import com.eshop.service.HeadService;
import com.opensymphony.xwork2.ActionSupport;

public class EvaluateAction extends ActionSupport{
	private String content;
	private String merId;
	private HeadService headService;
	
	public HeadService getHeadService() {
		return headService;
	}
	public void setHeadService(HeadService headService) {
		this.headService = headService;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getMerId() {
		return merId;
	}
	public void setMerId(String merId) {
		this.merId = merId;
	}
	public String execute(){
		System.out.println("=========="+content);
		return SUCCESS;
	}
}
