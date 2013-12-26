package com.eshop.bean;

import java.util.HashSet;
import java.util.Set;

/**
 * Evaluate entity. @author MyEclipse Persistence Tools
 */

public class Evaluate implements java.io.Serializable {

	// Fields

	private Integer evalId;
	private Member member;
	private String evalDate;
	private String evalContent;
	private Merchantable merchantable;

	// Constructors

	/** default constructor */
	public Evaluate() {
	}

	/** full constructor */
	public Evaluate(Member member, String evalDate, String evalContent,
			Merchantable merchantables) {
		this.member = member;
		this.evalDate = evalDate;
		this.evalContent = evalContent;
		this.merchantable = merchantables;
	}

	// Property accessors

	public Integer getEvalId() {
		return this.evalId;
	}

	public void setEvalId(Integer evalId) {
		this.evalId = evalId;
	}

	public Member getMember() {
		return this.member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public String getEvalDate() {
		return this.evalDate;
	}

	public void setEvalDate(String evalDate) {
		this.evalDate = evalDate;
	}

	public String getEvalContent() {
		return this.evalContent;
	}

	public void setEvalContent(String evalContent) {
		this.evalContent = evalContent;
	}

	public Merchantable getMerchantable() {
		return merchantable;
	}

	public void setMerchantable(Merchantable merchantable) {
		this.merchantable = merchantable;
	}

}