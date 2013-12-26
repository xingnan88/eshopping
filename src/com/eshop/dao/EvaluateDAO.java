package com.eshop.dao;

import java.util.List;

import ognl.Evaluation;

import com.eshop.bean.Evaluate;
import com.eshop.bean.Merchantable;

public interface EvaluateDAO {
	/**
	 * ������Ʒ�Ų�ѯ������
	 * @param parseInt
	 * @return
	 */
	List<Evaluate> findByMerId(Merchantable merchantable);
	public void save(Evaluate transientInstance);
}
