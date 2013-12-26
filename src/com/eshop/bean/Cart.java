package com.eshop.bean;

/**
 * Cart entity. @author MyEclipse Persistence Tools
 */

public class Cart implements java.io.Serializable {

	// Fields

	private Integer cartId;
	private Merchantable merchantable;
	private Integer cartNum;
	private Member member;
	// Constructors

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	/** default constructor */
	public Cart() {
	}

	/** full constructor */
	public Cart(Merchantable merchantable, Integer cartNum ,Member member) {
		this.merchantable = merchantable;
		this.cartNum = cartNum;
		this.member = member;
	}

	// Property accessors

	public Integer getCartId() {
		return this.cartId;
	}

	public void setCartId(Integer cartId) {
		this.cartId = cartId;
	}

	public Merchantable getMerchantable() {
		return this.merchantable;
	}

	public void setMerchantable(Merchantable merchantable) {
		this.merchantable = merchantable;
	}

	public Integer getCartNum() {
		return this.cartNum;
	}

	public void setCartNum(Integer cartNum) {
		this.cartNum = cartNum;
	}

}