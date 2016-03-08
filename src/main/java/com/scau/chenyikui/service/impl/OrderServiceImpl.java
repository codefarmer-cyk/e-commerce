package com.scau.chenyikui.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.scau.chenyikui.dao.OrderDAO;
import com.scau.chenyikui.dao.impl.BaseDAOImpl;
import com.scau.chenyikui.model.Order;
import com.scau.chenyikui.model.User;
import com.scau.chenyikui.service.OrderService;

@Service
public class OrderServiceImpl extends BaseServiceImpl<Order> implements OrderService {

	@Autowired
	public OrderServiceImpl(BaseDAOImpl<Order> baseDAO) {
		super(baseDAO);
	}

	@Autowired
	private OrderDAO orderDAO;

	@Transactional(readOnly = true)
	@Override
	public List<Order> getOrders() {
		return orderDAO.getOrders();
	}

	@Transactional(readOnly = true)
	@Override
	public List<Order> getOrders(User user) {
		return orderDAO.getOrders(user);
	}

}
