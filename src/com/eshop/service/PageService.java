package com.eshop.service;

import com.eshop.bean.PageBean;

public interface PageService {
	public PageBean queryForPage(String hql, String action, int pageSize, int page);
}
