package com.scau.chenyikui.dao;

import java.io.Serializable;

public interface BaseDAO<T> {

	public void save(T obj);

	public void delete(T obj);

	public T get(Serializable key);
}
