package com.scau.chenyikui.dao;

import java.util.List;

import com.scau.chenyikui.model.Order;
import com.scau.chenyikui.model.User;

public interface OrderDAO extends BaseDAO<Order> {
	List<Order> getOrders();

	List<Order> getOrders(User user);
}
