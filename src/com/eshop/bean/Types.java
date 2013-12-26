package com.eshop.bean;

import java.util.HashSet;
import java.util.Set;

/**
 * Types entity. @author MyEclipse Persistence Tools
 */

public class Types implements java.io.Serializable {

	// Fields

	private Integer typeId;
	private String typeName;
	private String typeDesc;
	private int typeRecommend ;
	private Set merchantables = new HashSet(0);

	// Constructors

	/** default constructor */
	public Types() {
	}

	/** full constructor */
	public Types(String typeName, String typeDesc, Set merchantables) {
		this.typeName = typeName;
		this.typeDesc = typeDesc;
		this.merchantables = merchantables;
	}

	// Property accessors
	public int getTypeRecommend() {
		return typeRecommend;
	}

	public void setTypeRecommend(int typeRecommend) {
		this.typeRecommend = typeRecommend;
	}

	public Integer getTypeId() {
		return this.typeId;
	}

	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}

	public String getTypeName() {
		return this.typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public String getTypeDesc() {
		return this.typeDesc;
	}

	public void setTypeDesc(String typeDesc) {
		this.typeDesc = typeDesc;
	}

	public Set getMerchantables() {
		return this.merchantables;
	}

	public void setMerchantables(Set merchantables) {
		this.merchantables = merchantables;
	}

}