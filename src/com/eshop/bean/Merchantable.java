package com.eshop.bean;

import java.util.HashSet;
import java.util.Set;

/**
 * Merchantable entity. @author MyEclipse Persistence Tools
 */

public class Merchantable implements java.io.Serializable {

	// Fields

	private Integer merId;
	private Types types;
	private String merName;
	private String SubMerName;
	private String merPlace;
	private Double merPrice;
	private Double merDiscount;
	private String merPicture;
	private String merDesc;
	private String merProducter;
	private String merLeaveDate;
	private String merAddDate;
	private int merNum = 0;//购买过的次数
	
	public int getMerNum() {
		return merNum;
	}

	public void setMerNum(int merNum) {
		this.merNum = merNum;
	}

	public String getMerAddDate() {
		return merAddDate;
	}

	public void setMerAddDate(String merAddDate) {
		this.merAddDate = merAddDate;
	}

	private Set records = new HashSet(0);
	private Set carts = new HashSet(0);

	// Constructors

	/** default constructor */
	public Merchantable() {
	}

	/** minimal constructor */
	public Merchantable(String merName, Double merPrice) {
		this.merName = merName;
		this.merPrice = merPrice;
	}

	/** full constructor */
	public Merchantable(Types types, String merName,
			String merPlace, Double merPrice, Double merDiscount,
			String merPicture, String merDesc, String merProducter,
			String merLeaveDate, Set records, Set carts) {
		this.types = types;
		this.merName = merName;
		this.merPlace = merPlace;
		this.merPrice = merPrice;
		this.merDiscount = merDiscount;
		this.merPicture = merPicture;
		this.merDesc = merDesc;
		this.merProducter = merProducter;
		this.merLeaveDate = merLeaveDate;
		this.records = records;
		this.carts = carts;
	}

	// Property accessors
	public String getSubMerName() {
		return SubMerName;
	}

	public void setSubMerName(String subMerName) {
		SubMerName = subMerName;
	}
	public Integer getMerId() {
		return this.merId;
	}

	public void setMerId(Integer merId) {
		this.merId = merId;
	}

	public Types getTypes() {
		return this.types;
	}

	public void setTypes(Types types) {
		this.types = types;
	}


	public String getMerName() {
		return this.merName;
	}

	public void setMerName(String merName) {
		this.merName = merName;
	}

	public String getMerPlace() {
		return this.merPlace;
	}

	public void setMerPlace(String merPlace) {
		this.merPlace = merPlace;
	}

	public Double getMerPrice() {
		return this.merPrice;
	}

	public void setMerPrice(Double merPrice) {
		this.merPrice = merPrice;
	}

	public Double getMerDiscount() {
		return this.merDiscount;
	}

	public void setMerDiscount(Double merDiscount) {
		this.merDiscount = merDiscount;
	}

	public String getMerPicture() {
		return this.merPicture;
	}

	public void setMerPicture(String merPicture) {
		this.merPicture = merPicture;
	}

	public String getMerDesc() {
		return this.merDesc;
	}

	public void setMerDesc(String merDesc) {
		this.merDesc = merDesc;
	}

	public String getMerProducter() {
		return this.merProducter;
	}

	public void setMerProducter(String merProducter) {
		this.merProducter = merProducter;
	}

	public String getMerLeaveDate() {
		return this.merLeaveDate;
	}

	public void setMerLeaveDate(String merLeaveDate) {
		this.merLeaveDate = merLeaveDate;
	}

	public Set getRecords() {
		return this.records;
	}

	public void setRecords(Set records) {
		this.records = records;
	}

	public Set getCarts() {
		return this.carts;
	}

	public void setCarts(Set carts) {
		this.carts = carts;
	}

}