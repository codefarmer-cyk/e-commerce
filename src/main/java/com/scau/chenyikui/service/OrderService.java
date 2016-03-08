package com.scau.chenyikui.service;

import java.util.List;

import com.scau.chenyikui.model.Order;
import com.scau.chenyikui.model.User;

public interface OrderService extends BaseService<Order> {
	List<Order> getOrders();

	List<Order> getOrders(User user);
}
