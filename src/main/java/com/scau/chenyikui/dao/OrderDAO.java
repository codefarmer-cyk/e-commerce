package com.scau.chenyikui.dao;

import java.util.List;

import com.scau.chenyikui.model.Order;

public interface OrderDAO extends BaseDAO<Integer, Order> {
	List<Order> getOrders();
}
