package com.scau.chenyikui.dao;

import java.util.List;

import com.scau.chenyikui.model.Shop;
import com.scau.chenyikui.model.SubOrder;

public interface SubOrderDAO extends BaseDAO<SubOrder> {
	public List<SubOrder> getSubOrdersByShop(Shop shop);
}
