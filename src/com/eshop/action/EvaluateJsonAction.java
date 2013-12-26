package com.eshop.action;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.eshop.bean.Evaluate;
import com.eshop.bean.Member;
import com.eshop.service.HeadService;
import com.eshop.tool.DateTime;
import com.opensymphony.xwork2.ActionSupport;

public class EvaluateJsonAction extends ActionSupport implements SessionAware{
	private Map session;
	private String merId;
	private List<Evaluate> evals;
	//利用json时，在这类中不能有接口的getter
	private HeadService headService;
	private String content;
	private String result;
	
	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public void setHeadService(HeadService headService) {
		this.headService = headService;
	}

	public List<Evaluate> getEvals() {
		return evals;
	}

	public void setEvals(List<Evaluate> evals) {
		this.evals = evals;
	}

	public String getMerId() {
		return merId;
	}

	public void setMerId(String merId) {
		this.merId = merId;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
		
	public String execute(){
			this.setEvals(this.headService.findByMerId(merId));
		return SUCCESS;
	}
	public String add() throws UnsupportedEncodingException{
		result = null;
		Member member = (Member)session.get("member");
		if(member != null)
		{
			String date = DateTime.getDateAndTime();
			headService.saveEval(this.merId, content,member,date);
			return SUCCESS;
		}else{
			result = "请先登录再评价!";
			return SUCCESS;
		}
	}
}
