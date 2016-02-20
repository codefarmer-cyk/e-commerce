package com.scau.chenyikui.service;

import java.io.Serializable;

public interface BaseService<PK extends Serializable, T> {

	public void save(T obj);

	public void delete(T obj);

	public T get(PK key);
}