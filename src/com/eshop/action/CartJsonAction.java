package com.eshop.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.eshop.bean.Cart;
import com.eshop.bean.Member;
import com.eshop.service.HeadService;
import com.opensymphony.xwork2.ActionSupport;

public class CartJsonAction extends ActionSupport implements SessionAware{
	private HeadService headService;
	private Map session;
	private String price;//��Ʒ�۸�
	private String id; //��Ʒid
	private String num; //��Ʒ����
	private List<Cart> carts = null;
	private String result;
	

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public List<Cart> getCarts() {
		return carts;
	}

	public void setCarts(List<Cart> carts) {
		this.carts = carts;
	}

	public String getPrice() {
		return price;
	}
	


	public void setHeadService(HeadService headService) {
		this.headService = headService;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}


	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	
	public String add(){
		result = null;
		Member member = (Member)session.get("member");
		if(member == null){
			this.result = "���ȵ�¼!";
			return SUCCESS;
		}
		if(headService.addMerToCart(id, member,price,num)== 1){
			this.result = "��ӳɹ�!";
		}else{ 
			this.result = "��Ʒ�Ѽ���,��Ҫ�޸�����,����빺�ﳵ�޸�!";
			return SUCCESS;
		}
		this.setCarts(headService.findCartByMember(member));
		return SUCCESS;
	}
}
