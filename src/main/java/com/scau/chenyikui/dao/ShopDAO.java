package com.scau.chenyikui.dao;

import com.scau.chenyikui.model.Shop;

public interface ShopDAO extends BaseDAO<Shop> {
	public Shop getShop(String username);
}
