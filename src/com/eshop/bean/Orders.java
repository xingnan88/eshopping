package com.eshop.bean;

import java.util.HashSet;
import java.util.Set;

/**
 * Orders entity. @author MyEclipse Persistence Tools
 */

public class Orders implements java.io.Serializable {

	// Fields

	private Integer orderId;
	private Member member;
	private String orderDate;
	private Integer orderStatus;
	private String time;//发货时间段
	private String remark;//备注
	private double sum;//合计
	public double getSum() {
		return sum;
	}

	public void setSum(double sum) {
		this.sum = sum;
	}

	private Set records = new HashSet(0);

	// Constructors

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

	/** default constructor */
	public Orders() {
	}

	/** full constructor */
	public Orders(Member member, String orderDate, Integer orderStatus,
			Set records) {
		this.member = member;
		this.orderDate = orderDate;
		this.orderStatus = orderStatus;
		this.records = records;
	}

	// Property accessors

	public Integer getOrderId() {
		return this.orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public Member getMember() {
		return this.member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public String getOrderDate() {
		return this.orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public Integer getOrderStatus() {
		return this.orderStatus;
	}

	public void setOrderStatus(Integer orderStatus) {
		this.orderStatus = orderStatus;
	}

	public Set getRecords() {
		return this.records;
	}

	public void setRecords(Set records) {
		this.records = records;
	}

}