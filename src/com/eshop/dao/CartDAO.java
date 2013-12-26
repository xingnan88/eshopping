package com.eshop.dao;

import java.util.List;

import com.eshop.bean.Cart;
import com.eshop.bean.Member;
import com.eshop.bean.Merchantable;

public interface CartDAO {
	/**
	 * 保存
	 */
	public void save(Cart transientInstance);
	
	/**
	 * 根据购物车号查询其中的商品
	 * @param member
	 * @return
	 */
	public List<Cart> findByMember(Member member);
	/**
	 * 查询购物车是否已经加入了此商品
	 * @param merchantable
	 */
	public List<Cart> findByMer(Merchantable merchantable);
	/**
	 * 修改
	 */
	public void update(Cart cart);
	public Cart findById(java.lang.Integer id);
	public void delete(Cart persistentInstance);
	/**
	 * 删除购物车中的所有商品
	 */
	public void deleteAll();
}
