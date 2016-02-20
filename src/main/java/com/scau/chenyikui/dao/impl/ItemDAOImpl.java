package com.scau.chenyikui.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.scau.chenyikui.dao.ItemDAO;
import com.scau.chenyikui.model.Item;

@Repository
public class ItemDAOImpl extends BaseDAOImpl<Integer, Item> implements ItemDAO {

	@SuppressWarnings("unchecked")
	@Override
	public List<Item> getItems() {
		return sessionFactory.getCurrentSession().createQuery("from Item").list();
	}

}
