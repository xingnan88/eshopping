package com.eshop.dao;

import java.util.List;

import ognl.Evaluation;

import com.eshop.bean.Evaluate;
import com.eshop.bean.Merchantable;

public interface EvaluateDAO {
	/**
	 * 依据商品号查询出评价
	 * @param parseInt
	 * @return
	 */
	List<Evaluate> findByMerId(Merchantable merchantable);
	public void save(Evaluate transientInstance);
}
