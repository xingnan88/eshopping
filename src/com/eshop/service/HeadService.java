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
	 * 查询所有商品
	 */
	public List<Merchantable> findAllMerchantable();
	/**
	 * 依据ID查询
	 * @param type
	 */
	public Merchantable findById(String id);
	/**
	 * 查询所有种类
	 */
	public List<Types> findAllTypes();
	/**
	 * 依据种类查询
	 */
	public List<Merchantable> findByType(String type);
	/**
	 * 向购物车中加入商品
	 * @param id
	 * @param cartId
	 * @param price
	 * @param num
	 */
	public int addMerToCart(String id, Member member, String price, String num);
	/**
	 * 查询某人购物车的商品
	 * @param member
	 * @return
	 */
	public List<Cart> findCartByMember(Member member);
	/**
	 * 依据种类查询部分商品
	 */
	public List<Merchantable> findPartByType(String type);
	/**
	 * 依据商品ID查询商品评价
	 * @param merId
	 */
	public List<Evaluate> findByMerId(String merId);
	/**
	 * 保存对商品的评价
	 * @param merId
	 * @param content2
	 */
	public void saveEval(String merId, String content2,Member member, String date);
	/**
	 * 修改购物车中商品的数量
	 * @param cartId
	 * @param num
	 */
	public void updateCart(String cartId, String num);
	/**
	 * 删除购物车中商品
	 * @param cartId
	 */
	public void deleteCart(String cartId);
	/**
	 * 添加定单
	 * @param member
	 * @param time
	 * @param remark
	 */
	public void addOrder(Member member, String time, String remark,double sum);
	/**
	 * 查看/修改用户的历史清单
	 * @param member
	 * @param status 1查看历史清单 0修改清单(删除)
	 */
	public List<Orders> findHistoryOrder(Member member,int status);
	/**
	 * 删除定单
	 * @param orderId
	 */
	public void deleteOrder(String orderId);
	/**
	 * 搜寻商品
	 * @param type
	 * @param keyword
	 * @return
	 */
	public List<Merchantable> researchMer(String type, String keyword);
	/**
	 * 保存或修改加入的商品 saveOrUpdate();
	 */
	public void saveMer(Merchantable mer);
	/**
	 * 删除商品
	 * @param id
	 */
	public void deleteMer(String id);
	/**
	 * 删除种类
	 * @param id
	 */
	public void deleteType(String id);
	/**
	 * 保存种类
	 * @param type
	 */
	public void saveType(Types type);
	/**
	 * 修改种类
	 * @param id
	 * @param typeName
	 * @param typeDesc
	 */
	public void updateType(String id, String typeName, String typeDesc);
	/**
	 * 修改订单确认发货
	 * @param orderId
	 */
	public void updateOrder(String orderId);
	/**
	 * 依据销售的数量查询前10的商品
	 */
	public List<Merchantable> findMerByNum();
	/**
	 * 推荐的商品
	 * @return
	 */
	public List findByReCommend();
	/**
	 * 推荐种类
	 */
	public void updateType(String id, int type);
}
