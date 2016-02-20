package com.scau.chenyikui.service.impl;

import java.io.Serializable;


import org.springframework.transaction.annotation.Transactional;

import com.scau.chenyikui.dao.impl.BaseDAOImpl;
import com.scau.chenyikui.service.BaseService;

public abstract class BaseServiceImpl<PK extends Serializable, T> implements BaseService<PK, T> {

	protected BaseDAOImpl<PK, T> baseDAO;

	public BaseServiceImpl(BaseDAOImpl<PK, T> baseDAO) {
		this.baseDAO = baseDAO;
	}

	@Transactional
	@Override
	public void save(T obj) {
		baseDAO.save(obj);
	}

	@Transactional
	@Override
	public void delete(T obj) {
		baseDAO.delete(obj);
	}

	@Transactional
	@Override
	public T get(PK key) {
		return (T) baseDAO.get(key);
	}

}
