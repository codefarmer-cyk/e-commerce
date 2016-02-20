package com.scau.chenyikui.dao.impl;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scau.chenyikui.dao.BaseDAO;

public abstract class BaseDAOImpl<PK extends Serializable, T> implements BaseDAO<PK, T> {

	private Class<T> entityClass;

	@Autowired
	protected SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	public BaseDAOImpl() {
		entityClass = (Class<T>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[1];
	}

	@Override
	public void save(T obj) {
		sessionFactory.getCurrentSession().save(obj);
	}

	@Override
	public void delete(T obj) {
		sessionFactory.getCurrentSession().delete(obj);
	}

	@SuppressWarnings("unchecked")
	@Override
	public T get(PK key) {
		return (T) sessionFactory.getCurrentSession().get(entityClass, key);
	}

}
