package com.eshop.service.impl;

import java.util.List;

import com.eshop.bean.PageBean;
import com.eshop.dao.PageDao;
import com.eshop.service.PageService;

public class PageServiceImpl implements PageService{
	private PageDao pageDAO;
	
	public PageDao getPageDAO() {
		return pageDAO;
	}

	public void setPageDAO(PageDao pageDAO) {
		this.pageDAO = pageDAO;
	}

	public PageBean queryForPage(String hql, String action, int pageSize, int page) {
		
		int allRow = pageDAO.getAllRowCount(hql); //所有的记录数
		int totalPage = PageBean.countTotalPage(pageSize, allRow);//总页数
		//开始的记录
		final int length = pageSize;
		final int currentPage = PageBean.countCurrentPage(page);
		//offset开始记录位置
		final int offset = PageBean.countOffset(pageSize, currentPage);
		List list = pageDAO.queryForPage(hql, offset, length);
		PageBean pageBean = new PageBean();
		pageBean.setPageSize(pageSize);
		pageBean.setCurrentPage(currentPage);
		pageBean.setAllRow(allRow);
		pageBean.setTotalPage(totalPage);
		pageBean.setList(list);
		pageBean.ctrl(action, page);
		pageBean.init();
		return pageBean;
	}
}
