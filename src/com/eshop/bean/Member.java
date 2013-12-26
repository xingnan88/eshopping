package com.eshop.bean;

import java.util.HashSet;
import java.util.Set;

/**
 * Member entity. @author MyEclipse Persistence Tools
 */

public class Member implements java.io.Serializable {

	// Fields

	private Integer memId;
	private String memName;
	private String memPwd;
	private Integer memType;
	private String memTel;
	private String memAddress;
	private String memRegistDate;
	private String memPost;
	private String memEmail;

	private Set orderses = new HashSet(0);
	private Set evaluates = new HashSet(0);

	// Constructors

	/** default constructor */
	public Member() {
	}

	/** minimal constructor */
	public Member(String memName, String memPwd) {
		this.memName = memName;
		this.memPwd = memPwd;
	}

	/** full constructor */
	public Member(String memName, String memPwd, Integer memType,
			String memTel, String memAddress, String memRegistDate,
			String memPost, String memEmail, Set orderses, Set evaluates) {
		this.memName = memName;
		this.memPwd = memPwd;
		this.memType = memType;
		this.memTel = memTel;
		this.memAddress = memAddress;
		this.memRegistDate = memRegistDate;
		this.memPost = memPost;
		this.memEmail = memEmail;
		this.orderses = orderses;
		this.evaluates = evaluates;
	}

	// Property accessors

	public Integer getMemId() {
		return this.memId;
	}

	public void setMemId(Integer memId) {
		this.memId = memId;
	}

	public String getMemName() {
		return this.memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getMemPwd() {
		return this.memPwd;
	}

	public void setMemPwd(String memPwd) {
		this.memPwd = memPwd;
	}

	public Integer getMemType() {
		return this.memType;
	}

	public void setMemType(Integer memType) {
		this.memType = memType;
	}

	public String getMemTel() {
		return this.memTel;
	}

	public void setMemTel(String memTel) {
		this.memTel = memTel;
	}

	public String getMemAddress() {
		return this.memAddress;
	}

	public void setMemAddress(String memAddress) {
		this.memAddress = memAddress;
	}

	public String getMemRegistDate() {
		return this.memRegistDate;
	}

	public void setMemRegistDate(String memRegistDate) {
		this.memRegistDate = memRegistDate;
	}

	public String getMemPost() {
		return this.memPost;
	}

	public void setMemPost(String memPost) {
		this.memPost = memPost;
	}

	public String getMemEmail() {
		return this.memEmail;
	}

	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}

	public Set getOrderses() {
		return this.orderses;
	}

	public void setOrderses(Set orderses) {
		this.orderses = orderses;
	}

	public Set getEvaluates() {
		return this.evaluates;
	}

	public void setEvaluates(Set evaluates) {
		this.evaluates = evaluates;
	}

}