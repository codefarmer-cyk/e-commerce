package com.scau.chenyikui.dao;

import java.io.Serializable;

public interface BaseDAO<PK extends Serializable, T> {

	public void save(T obj);

	public void delete(T obj);

	public T get(PK key);
}
