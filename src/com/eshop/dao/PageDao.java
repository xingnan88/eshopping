package com.eshop.dao;

import java.util.List;

public interface PageDao {
	/**
	 * 
	 * @param hql ��ѯ���
	 * @param offset 
	 * @param length
	 * @return
	 */
	public List queryForPage(final String hql, final int offset, final int length);
	public int getAllRowCount(String hql);
}
