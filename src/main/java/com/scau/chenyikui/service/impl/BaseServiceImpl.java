package com.scau.chenyikui.service.impl;

import java.io.Serializable;

import org.springframework.transaction.annotation.Transactional;

import com.scau.chenyikui.dao.impl.BaseDAOImpl;
import com.scau.chenyikui.service.BaseService;

public abstract class BaseServiceImpl<T> implements BaseService<T> {

	private BaseDAOImpl<T> baseDAO;

	public BaseServiceImpl(BaseDAOImpl<T> baseDAO) {
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
	public T get(Serializable key) {
		return (T) baseDAO.get(key);
	}

}
