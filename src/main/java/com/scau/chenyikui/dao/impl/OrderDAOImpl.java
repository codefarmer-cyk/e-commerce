package com.scau.chenyikui.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.scau.chenyikui.dao.OrderDAO;
import com.scau.chenyikui.model.Order;

@Repository
public class OrderDAOImpl extends BaseDAOImpl<Integer, Order> implements OrderDAO {

	@SuppressWarnings("unchecked")
	@Override
	public List<Order> getOrders() {
		return sessionFactory.getCurrentSession().createQuery("from Order").list();
	}

}
