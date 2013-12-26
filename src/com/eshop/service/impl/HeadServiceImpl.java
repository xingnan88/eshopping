package com.eshop.service.impl;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import sun.misc.Request;

import com.eshop.bean.Cart;
import com.eshop.bean.Evaluate;
import com.eshop.bean.Member;
import com.eshop.bean.Merchantable;
import com.eshop.bean.Orders;
import com.eshop.bean.Record;
import com.eshop.bean.Types;
import com.eshop.dao.CartDAO;
import com.eshop.dao.EvaluateDAO;
import com.eshop.dao.MerchantableDAO;
import com.eshop.dao.OrdersDAO;
import com.eshop.dao.RecordDAO;
import com.eshop.dao.TypesDAO;
import com.eshop.service.HeadService;
import com.eshop.tool.DateTime;

public class HeadServiceImpl implements HeadService{
	private TypesDAO typesDAO;
	private MerchantableDAO merchantableDAO;
	private CartDAO cartDAO;
	private EvaluateDAO evaluateDAO;
	private OrdersDAO ordersDAO;
	private RecordDAO recordDAO;

	public RecordDAO getRecordDAO() {
		return recordDAO;
	}
	public void setRecordDAO(RecordDAO recordDAO) {
		this.recordDAO = recordDAO;
	}
	public OrdersDAO getOrdersDAO() {
		return ordersDAO;
	}
	public void setOrdersDAO(OrdersDAO ordersDAO) {
		this.ordersDAO = ordersDAO;
	}
	public EvaluateDAO getEvaluateDAO() {
		return evaluateDAO;
	}
	public void setEvaluateDAO(EvaluateDAO evaluateDAO) {
		this.evaluateDAO = evaluateDAO;
	}
	public TypesDAO getTypesDAO() {
		return typesDAO;
	}
	public void setTypesDAO(TypesDAO typesDAO) {
		this.typesDAO = typesDAO;
	}
	public MerchantableDAO getMerchantableDAO() {
		return merchantableDAO;
	}
	public void setMerchantableDAO(MerchantableDAO merchantableDAO) {
		this.merchantableDAO = merchantableDAO;
	}
	public CartDAO getCartDAO() {
		return cartDAO;
	}
	public void setCartDAO(CartDAO cartDAO) {
		this.cartDAO = cartDAO;
	}
	public List<Types> findAllTypes() {
		return typesDAO.findAll();
	}
	public List<Merchantable> findAllMerchantable() {
		return this.merchantableDAO.findAll();
	}
	
	public Merchantable findById(String id) {
		return merchantableDAO.findById(Integer.parseInt(id));
		
	}
	public List<Merchantable> findByType(String type) {
		Types t = new Types();
		t.setTypeId(Integer.parseInt(type));
		return merchantableDAO.findByTypes(t);
	}
	public int addMerToCart(String id, Member member, String price, String num) {
		Cart cart = new Cart();
		Merchantable merchantable = merchantableDAO.findById(Integer.parseInt(id));
		if(cartDAO.findByMer(merchantable).size() == 0){
			cart.setCartNum(Integer.parseInt(num));
			cart.setMerchantable(merchantable);
			cart.setMember(member);
			cartDAO.save(cart);
			return 1;
		}
		return 0;
	}
	public List<Cart> findCartByMember(Member member) {
		return cartDAO.findByMember(member);
	}
	public List<Merchantable> findPartByType(String type) {
		Types t = new Types();
		t.setTypeId(Integer.parseInt(type));
		List<Merchantable> list = merchantableDAO.findByTypes(t);
		List<Merchantable> list2 = new ArrayList<Merchantable>();
		Random d = new Random();
		int num;
		int i=0;
		while(i < (list.size()>5? 5: list.size())){
			num = d.nextInt(list.size());
			if(!list2.contains(list.get(num)))
			{	i++;
				list2.add(list.get(num)); 
			}
		}
		return list2;
	}
	public List<Evaluate> findByMerId(String merId) {
		Merchantable m = new Merchantable();
		m.setMerId(Integer.parseInt(merId));
		return this.evaluateDAO.findByMerId(m);
	}
	public void saveEval(String merId, String content2,Member member, String date) {
		Evaluate evaluate = new Evaluate();
		Merchantable m = new Merchantable();
		m.setMerId(Integer.parseInt(merId));
		evaluate.setMerchantable(m);
		evaluate.setMember(member);
		evaluate.setEvalContent(content2);
		evaluate.setEvalDate(date);
		this.evaluateDAO.save(evaluate);
	}
	public void updateCart(String cartId, String num) {
		Cart cart = cartDAO.findById(Integer.parseInt(cartId));
		cart.setCartNum(Integer.parseInt(num));
		cartDAO.update(cart);
	}
	public void deleteCart(String cartId) {
		Cart cart = cartDAO.findById(Integer.parseInt(cartId));
		cartDAO.delete(cart);
	}
	public void addOrder(Member member, String time, String remark,double sum) {
		String date = DateTime.getDate();
		Orders orders = new Orders();
		orders.setMember(member);
		orders.setOrderDate(date);
		orders.setOrderStatus(0);
		orders.setTime(time);
		orders.setRemark(remark);
		orders.setSum(sum);
		ordersDAO.saveOrUpdate(orders);
		//将购买的商品添加到记录表,应该在后台管理员确认后再加入记录表
		List<Cart> carts = cartDAO.findByMember(member);
		for(Cart cart : carts){
			Record record = new Record();
			record.setMerchantable(cart.getMerchantable());
			record.setOrders(orders);
			record.setRecordMerNum(cart.getCartNum());
			recordDAO.save(record);
		}
		//定单提交之后就需要删除购物车中的商品
		cartDAO.deleteAll();
	}
	public List<Orders> findHistoryOrder(Member member,int status) {
		return ordersDAO.findByHistoryOrder(member, status);
	}
	public void deleteOrder(String orderId) {
		Orders orders = ordersDAO.findById(Integer.parseInt(orderId));
		orders.setOrderId(Integer.parseInt(orderId));
		ordersDAO.delete(orders);
	}
	public List<Merchantable> researchMer(String type, String keyword) {
		//查询所有类别 
		 
	
		try {
			keyword=java.net.URLDecoder.decode(keyword, "UTF-8");
			
		} catch (UnsupportedEncodingException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		System.out.print(keyword);

		if(Integer.parseInt(type) == 0){
			return merchantableDAO.findAllByKeyword(keyword);
		}
		//按各类查询
		Types types = new Types();
		types.setTypeId(Integer.parseInt(type));
		return merchantableDAO.findByKeyword(types, keyword);
	}
	public void saveMer(Merchantable mer) {
		merchantableDAO.saveOrUpdate(mer);
	}
	public void deleteMer(String id) {
		Merchantable mer = merchantableDAO.findById(Integer.parseInt(id));
		merchantableDAO.delete(mer);
	}
	public void deleteType(String id) {
		Types type = new Types();
		type.setTypeId(Integer.parseInt(id));
		typesDAO.delete(type);
	}
	public void saveType(Types type) {
		typesDAO.saveOrUpdate(type);
	}
	public void updateType(String id, String typeName, String typeDesc) {
		Types type = typesDAO.findById(Integer.parseInt(id));
		type.setTypeName(typeName);
		type.setTypeDesc(typeDesc);
		typesDAO.saveOrUpdate(type);
	}
	public void updateOrder(String orderId) {
		Orders order = ordersDAO.findById(Integer.parseInt(orderId));
		order.setOrderStatus(1);
		ordersDAO.saveOrUpdate(order);
		//确认发货后，将商品购买数量加1
		List<Record> records = recordDAO.findByOrderId(orderId);
		for(Record r : records){
			List<Merchantable> mers = merchantableDAO.findByExample(r.getMerchantable());
			Merchantable m = null;
			if(mers.size() != 0){
				 m = mers.get(0);
			}
			int num = m.getMerNum() + r.getRecordMerNum();
			m.setMerNum(num);
			merchantableDAO.saveOrUpdate(m);
		}
	}
	public List<Merchantable> findMerByNum() {
		return merchantableDAO.findByNum();
	}
	public List findByReCommend() {
		List<Types> types = typesDAO.findByRecommend();
		List list = new ArrayList();
		if(types.size() != 0){
			for(Types t : types){
				list.add(merchantableDAO.findPartByTypes(t.getTypeId()));
			}
			return list;
		}
		return null;
	}
	public void updateType(String id, int type) {
		Types t = typesDAO.findById(Integer.parseInt(id));
		if(type == 1){
			t.setTypeRecommend(1);
		}else{
			t.setTypeRecommend(0);
		}
		
		typesDAO.saveOrUpdate(t);
	}
}
