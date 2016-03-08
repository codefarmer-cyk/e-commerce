package com.scau.chenyikui.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.scau.chenyikui.dao.OrderDAO;
import com.scau.chenyikui.model.Order;
import com.scau.chenyikui.model.User;

@Repository
public class OrderDAOImpl extends BaseDAOImpl<Order> implements OrderDAO {

	@SuppressWarnings("unchecked")
	@Override
	public List<Order> getOrders() {
		return sessionFactory.getCurrentSession().createQuery("from Order").list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Order> getOrders(User user) {
		return sessionFactory.getCurrentSession().createQuery("from Order order where order.user.username = :username")
				.setParameter("username", user.getUsername()).list();
	}

}
