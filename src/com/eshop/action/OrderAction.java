package com.eshop.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.eshop.bean.Cart;
import com.eshop.bean.Member;
import com.eshop.bean.Orders;
import com.eshop.bean.PageBean;
import com.eshop.service.HeadService;
import com.eshop.service.PageService;
import com.opensymphony.xwork2.ActionSupport;

public class OrderAction extends ActionSupport implements SessionAware{
	private Map session;
	private HeadService headService;
	private List<Cart> carts;
	private double sum; //�����ܼ�
	private String time;//�ͻ�ʱ���
	private String remark = "��";//������ע
	private List<Orders> orders;
	private String orderId;
	private PageBean pageBean;
	private PageService pageService;
	private String page;

	public String getPage() {
		return page;
	}
	public void setPage(String page) {
		this.page = page;
	}
	public PageBean getPageBean() {
		return pageBean;
	}
	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}
	public void setPageService(PageService pageService) {
		this.pageService = pageService;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public List<Orders> getOrders() {
		return orders;
	}
	public void setOrders(List<Orders> orders) {
		this.orders = orders;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public double getSum() {
		return sum;
	}
	public void setSum(double sum) {
		this.sum = sum;
	}
	public List<Cart> getCarts() {
		return carts;
	}
	public void setCarts(List<Cart> carts) {
		this.carts = carts;
	}
	public HeadService getHeadService() {
		return headService;
	}
	public void setHeadService(HeadService headService) {
		this.headService = headService;
	}
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	/**
	 * ���붨��
	 */
	public String execute(){
		Member member = (Member)session.get("member");
		this.setCarts(headService.findCartByMember(member));
		sum = 0;
		for(Cart cart : carts){
			if(cart.getMerchantable().getMerDiscount() != null){
				sum += cart.getMerchantable().getMerPrice()*cart.getMerchantable().getMerDiscount()*0.1*cart.getCartNum();
			}else{
				sum += cart.getMerchantable().getMerPrice()*cart.getCartNum();
			}
		}
		return SUCCESS;
	}
	/**
	 * ��Ӷ���
	 * @return
	 */
	public String addOrder(){
		Member member = (Member) session.get("member");
		headService.addOrder(member, time, remark,sum);
		return "finished";
	}
	/**
	 * �鿴��ʷ����
	 */
	public String historyOrder(){
		Member member = (Member) session.get("member");
		this.setOrders(headService.findHistoryOrder(member,1));
		return "history";
	}
	/**
	 *���� �޸��������
	 */
	public String modifyOrder(){
		Member member = (Member) session.get("member");
		this.setOrders(headService.findHistoryOrder(member,0));
		return "modify";
	}
	/**
	 * ɾ������
	 */
	public String deleteOrder(){
		this.headService.deleteOrder(orderId);
		Member member = (Member) session.get("member");
		this.setOrders(headService.findHistoryOrder(member,0));
		return "delete";
	}
	/**
	 * ����ʾ�����嵥
	 */
	public String showOrders(){
		String hql = "from Orders";
		String action = "back/jsp/orders!showOrders";
		int pageSize = 10;
		this.setPageBean(pageService.queryForPage(hql, action, pageSize, Integer.parseInt(page)));
		return SUCCESS;
	}
	/**
	 * ��̨ȷ�϶���������
	 */
	public String submit(){
		headService.updateOrder(orderId);
		showOrders();
		this.addActionError("ȷ�ϳɹ�");
		return "submit";
	}
}

