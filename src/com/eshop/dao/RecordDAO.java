package com.eshop.dao;

import java.util.List;

import com.eshop.bean.Record;

public interface RecordDAO {
	public void save(Record transientInstance);
	/**
	 * “¿æ›∂©µ•≤È—Ø
	 * @param orderId
	 * @return
	 */
	public List<Record> findByOrderId(String orderId);
}
