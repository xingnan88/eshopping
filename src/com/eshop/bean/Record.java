package com.eshop.bean;

/**
 * Record entity. @author MyEclipse Persistence Tools
 */

public class Record implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer recordId;
	private Orders orders;
	private Merchantable merchantable;
	private Integer recordMerNum;

	// Constructors

	/** default constructor */
	public Record() {
	}

	/** minimal constructor */
	public Record(Integer recordId) {
		this.recordId = recordId;
	}

	/** full constructor */
	public Record(Integer recordId, Orders orders, Merchantable merchantable,
			Integer recordMerNum) {
		this.recordId = recordId;
		this.orders = orders;
		this.merchantable = merchantable;
		this.recordMerNum = recordMerNum;
	}

	// Property accessors

	public Integer getRecordId() {
		return this.recordId;
	}

	public void setRecordId(Integer recordId) {
		this.recordId = recordId;
	}

	public Orders getOrders() {
		return this.orders;
	}

	public void setOrders(Orders orders) {
		this.orders = orders;
	}

	public Merchantable getMerchantable() {
		return this.merchantable;
	}

	public void setMerchantable(Merchantable merchantable) {
		this.merchantable = merchantable;
	}

	public Integer getRecordMerNum() {
		return this.recordMerNum;
	}

	public void setRecordMerNum(Integer recordMerNum) {
		this.recordMerNum = recordMerNum;
	}

}