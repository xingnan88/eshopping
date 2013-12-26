package com.eshop.service;

import java.util.List;

import com.eshop.bean.Cart;
import com.eshop.bean.Evaluate;
import com.eshop.bean.Member;
import com.eshop.bean.Merchantable;
import com.eshop.bean.Orders;
import com.eshop.bean.Types;

public interface HeadService {
	/**
	 * ��ѯ������Ʒ
	 */
	public List<Merchantable> findAllMerchantable();
	/**
	 * ����ID��ѯ
	 * @param type
	 */
	public Merchantable findById(String id);
	/**
	 * ��ѯ��������
	 */
	public List<Types> findAllTypes();
	/**
	 * ���������ѯ
	 */
	public List<Merchantable> findByType(String type);
	/**
	 * ���ﳵ�м�����Ʒ
	 * @param id
	 * @param cartId
	 * @param price
	 * @param num
	 */
	public int addMerToCart(String id, Member member, String price, String num);
	/**
	 * ��ѯĳ�˹��ﳵ����Ʒ
	 * @param member
	 * @return
	 */
	public List<Cart> findCartByMember(Member member);
	/**
	 * ���������ѯ������Ʒ
	 */
	public List<Merchantable> findPartByType(String type);
	/**
	 * ������ƷID��ѯ��Ʒ����
	 * @param merId
	 */
	public List<Evaluate> findByMerId(String merId);
	/**
	 * �������Ʒ������
	 * @param merId
	 * @param content2
	 */
	public void saveEval(String merId, String content2,Member member, String date);
	/**
	 * �޸Ĺ��ﳵ����Ʒ������
	 * @param cartId
	 * @param num
	 */
	public void updateCart(String cartId, String num);
	/**
	 * ɾ�����ﳵ����Ʒ
	 * @param cartId
	 */
	public void deleteCart(String cartId);
	/**
	 * ��Ӷ���
	 * @param member
	 * @param time
	 * @param remark
	 */
	public void addOrder(Member member, String time, String remark,double sum);
	/**
	 * �鿴/�޸��û�����ʷ�嵥
	 * @param member
	 * @param status 1�鿴��ʷ�嵥 0�޸��嵥(ɾ��)
	 */
	public List<Orders> findHistoryOrder(Member member,int status);
	/**
	 * ɾ������
	 * @param orderId
	 */
	public void deleteOrder(String orderId);
	/**
	 * ��Ѱ��Ʒ
	 * @param type
	 * @param keyword
	 * @return
	 */
	public List<Merchantable> researchMer(String type, String keyword);
	/**
	 * ������޸ļ������Ʒ saveOrUpdate();
	 */
	public void saveMer(Merchantable mer);
	/**
	 * ɾ����Ʒ
	 * @param id
	 */
	public void deleteMer(String id);
	/**
	 * ɾ������
	 * @param id
	 */
	public void deleteType(String id);
	/**
	 * ��������
	 * @param type
	 */
	public void saveType(Types type);
	/**
	 * �޸�����
	 * @param id
	 * @param typeName
	 * @param typeDesc
	 */
	public void updateType(String id, String typeName, String typeDesc);
	/**
	 * �޸Ķ���ȷ�Ϸ���
	 * @param orderId
	 */
	public void updateOrder(String orderId);
	/**
	 * �������۵�������ѯǰ10����Ʒ
	 */
	public List<Merchantable> findMerByNum();
	/**
	 * �Ƽ�����Ʒ
	 * @return
	 */
	public List findByReCommend();
	/**
	 * �Ƽ�����
	 */
	public void updateType(String id, int type);
}
