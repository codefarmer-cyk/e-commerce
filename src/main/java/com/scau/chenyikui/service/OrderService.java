package com.scau.chenyikui.service;

import java.util.List;

import com.scau.chenyikui.model.Order;

public interface OrderService extends BaseService<Integer, Order> {
	List<Order> getOrders();
}
