package com.eshop.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import sun.misc.Request;

import com.eshop.bean.Cart;
import com.eshop.bean.Member;
import com.eshop.bean.Merchantable;
import com.eshop.bean.PageBean;
import com.eshop.bean.Types;
import com.eshop.service.HeadService;
import com.eshop.service.PageService;
import com.eshop.tool.DateTime;
import com.opensymphony.xwork2.ActionSupport;


public class MerchantableAction extends ActionSupport implements SessionAware{
	private String id;
	private String type; //商品种类ID
	private HeadService headService;
	private Merchantable merchantable;
	private List<Merchantable> merchantables;
	private List<Cart> carts;
	private String keyword;
	private PageService pageService;
	private String page;
	private PageBean pageBean;
	private File upload;
	private String savePath;// 保存的路径
	private String uploadFileName;// 文件名的属性
	private String uploadContentType;
	private String merName;
	private Double merPrice;
	private Double merDiscount;
	private String merPlace;
	private String merProducter;
	private String merLeaveDate;
	private String merDesc;
	private List<Types> types;
	private Object request;

	//String nickName = java.net.URLDecoder.decode(request.getParameter("nickName"),"UTF-8");
	public List<Types> getTypes() {
		return types;
	}
	public void setTypes(List<Types> types) {
		this.types = types;
	}
	public String getMerName() {
		return merName;
	}
	public void setMerName(String merName) {
		this.merName = merName;
	}
	public Double getMerPrice() {
		return merPrice;
	}
	public void setMerPrice(Double merPrice) {
		this.merPrice = merPrice;
	}
	public Double getMerDiscount() {
		return merDiscount;
	}
	public void setMerDiscount(Double merDiscount) {
		this.merDiscount = merDiscount;
	}
	public String getMerPlace() {
		return merPlace;
	}
	public void setMerPlace(String merPlace) {
		this.merPlace = merPlace;
	}
	public String getMerProducter() {
		return merProducter;
	}
	public void setMerProducter(String merProducter) {
		this.merProducter = merProducter;
	}
	public String getMerLeaveDate() {
		return merLeaveDate;
	}
	public void setMerLeaveDate(String merLeaveDate) {
		this.merLeaveDate = merLeaveDate;
	}
	public String getMerDesc() {
		return merDesc;
	}
	public void setMerDesc(String merDesc) {
		this.merDesc = merDesc;
	}
	public File getUpload() {
		return upload;
	}
	public void setUpload(File upload) {
		this.upload = upload;
	}
	public String getSavePath() {
		return ServletActionContext.getRequest().getRealPath(savePath);
	}
	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}
	public String getUploadFileName() {
		return uploadFileName;
	}
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	public String getUploadContentType() {
		return uploadContentType;
	}
	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public PageBean getPageBean() {
		return pageBean;
	}
	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}
	public String getPage() {
		return page;
	}
	public void setPage(String page) {
		this.page = page;
	}
	public PageService getPageService() {
		return pageService;
	}
	public void setPageService(PageService pageService) {
		this.pageService = pageService;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public List<Cart> getCarts() {
		return carts;
	}
	public void setCarts(List<Cart> carts) {
		this.carts = carts;
	}
	private Map session;
	
	public Merchantable getMerchantable() {
		return merchantable;
	}
	public void setMerchantable(Merchantable merchantable) {
		this.merchantable = merchantable;
	}
	public List<Merchantable> getMerchantables() {
		return merchantables;
	}
	public void setMerchantables(List<Merchantable> merchantables) {
		this.merchantables = merchantables;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

	public HeadService getHeadService() {
		return headService;
	}
	public void setHeadService(HeadService headService) {
		this.headService = headService;
	}
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	/**
	 * 显示某种类的商品
	 */
	public String showByType(){
		this.setMerchantables(headService.findByType(type));
		return 	SUCCESS;
	}
	/**
	 * 显示某个商品
	 */
	public String showById(){
		this.setMerchantable(headService.findById(id));
		Member member = (Member)session.get("member");
		if(member != null)
		{
			this.setCarts(headService.findCartByMember(member));
		}
		this.setMerchantables(headService.findPartByType(type));
		return "showone";
	}
	/**
	 * 搜寻商品
	 * @throws UnsupportedEncodingException 
	 */
	public String research() throws UnsupportedEncodingException{
		System.out.println(type);
		
	try {
		keyword=java.net.URLDecoder.decode(keyword, "UTF-8");
		
	} catch (UnsupportedEncodingException e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	
	
        
		System.out.println(keyword);
		
		
		this.setMerchantables(headService.researchMer(type, keyword));
		return "research";
	}
	/**
	 * 后台显示所有商品
	 */
	public String showAllMer(){
		String hql = "from Merchantable";
		String action = "back/jsp/mer!showAllMer";
		int pageSize = 10;
		this.setPageBean(pageService.queryForPage(hql, action, pageSize, Integer.parseInt(page)));
		return SUCCESS;
	}
	/**
	 * 保存加入的商品信息
	 */
	public String saveMer(){
		try {
			FileOutputStream fos = new FileOutputStream(this.getSavePath()+"\\"+this.getUploadFileName());
			FileInputStream fis = new FileInputStream(this.getUpload());
			byte[] buffer = new byte[1024];
			int len = 0;
			while((len = fis.read(buffer)) > 0){
				fos.write(buffer, 0, len);
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		String path = "image/"+this.getUploadFileName();
		Merchantable mer = new Merchantable();
		mer.setMerDesc(this.merDesc);
		mer.setMerDiscount(merDiscount);
		mer.setMerLeaveDate(this.merLeaveDate);
		mer.setMerPicture(path);
		mer.setMerPlace(merPlace);
		mer.setMerPrice(merPrice);
		mer.setMerProducter(merProducter);
		Types types = new Types();
		types.setTypeId(Integer.parseInt(type));
		mer.setTypes(types);
		mer.setMerName(merName.trim());
		String merAddDate = DateTime.getDate();
		mer.setMerAddDate(merAddDate);
		headService.saveMer(mer);
		this.addActionMessage("商品添加成功!");
		return "save";
	}
	/**
	 * 后台删除商品
	 */
	public String deleteMer(){
		headService.deleteMer(id);
		//showAllMer();
		return "delete";
	}
	/**
	 * 进入商品修改页面
	 */
	public String update(){
		this.setMerchantable(headService.findById(id));
		this.setTypes(headService.findAllTypes());
		return "go";
	}
	/**
	 * 修改商品信息
	 */
	public String updateMer(){
		Merchantable mer = headService.findById(id);
		mer.setMerDesc(merDesc);
		mer.setMerDiscount(merDiscount);
		mer.setMerLeaveDate(merLeaveDate);
		mer.setMerName(merName);
		mer.setMerPlace(merPlace);
		mer.setMerPrice(merPrice);
		mer.setMerProducter(merProducter);
		Types types = new Types();
		types.setTypeId(Integer.parseInt(type));
		mer.setTypes(types);
		headService.saveMer(mer);//DAO中为saveOrUpdate();
		return "update";
	}
}
