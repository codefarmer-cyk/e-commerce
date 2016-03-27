package com.scau.chenyikui.service;

import java.util.List;

import com.scau.chenyikui.model.Shop;
import com.scau.chenyikui.model.SubOrder;

public interface SubOrderService extends BaseService<SubOrder> {
	public List<SubOrder> getSubOrdersByShop(Shop shop);
}
