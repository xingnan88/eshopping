package com.eshop.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.eshop.bean.Cart;
import com.eshop.bean.Member;
import com.eshop.service.HeadService;
import com.opensymphony.xwork2.ActionSupport;

public class CartAction extends ActionSupport implements SessionAware{
	private HeadService headService;
	private Map session;
	private String cartId;
	private String num;//商品数量
	
	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public String getCartId() {
		return cartId;
	}

	public void setCartId(String cartId) {
		this.cartId = cartId;
	}

	public HeadService getHeadService() {
		return headService;
	}

	public void setHeadService(HeadService headService) {
		this.headService = headService;
	}

	private List<Cart> carts;
	

	public List<Cart> getCarts() {
		return carts;
	}

	public void setCarts(List<Cart> carts) {
		this.carts = carts;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	
	public String execute(){
		Member member = (Member)session.get("member");
		if(member == null){
			this.addActionError("请先登录!");
			return ERROR;
		}
		this.setCarts(headService.findCartByMember(member));
		return SUCCESS;
	}
	public String update(){
		Member member = (Member)session.get("member");
		headService.updateCart(cartId, num);
		this.setCarts(headService.findCartByMember(member));
		return SUCCESS;
	}
	public String delete(){
		Member member = (Member)session.get("member");
		headService.deleteCart(cartId);
		this.setCarts(headService.findCartByMember(member));
		return SUCCESS;
	}
}
