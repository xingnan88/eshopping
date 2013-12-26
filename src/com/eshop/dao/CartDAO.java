package com.eshop.dao;

import java.util.List;

import com.eshop.bean.Cart;
import com.eshop.bean.Member;
import com.eshop.bean.Merchantable;

public interface CartDAO {
	/**
	 * ����
	 */
	public void save(Cart transientInstance);
	
	/**
	 * ���ݹ��ﳵ�Ų�ѯ���е���Ʒ
	 * @param member
	 * @return
	 */
	public List<Cart> findByMember(Member member);
	/**
	 * ��ѯ���ﳵ�Ƿ��Ѿ������˴���Ʒ
	 * @param merchantable
	 */
	public List<Cart> findByMer(Merchantable merchantable);
	/**
	 * �޸�
	 */
	public void update(Cart cart);
	public Cart findById(java.lang.Integer id);
	public void delete(Cart persistentInstance);
	/**
	 * ɾ�����ﳵ�е�������Ʒ
	 */
	public void deleteAll();
}
