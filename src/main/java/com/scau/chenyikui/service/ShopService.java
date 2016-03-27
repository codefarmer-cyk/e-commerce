package com.scau.chenyikui.service;

import com.scau.chenyikui.model.Shop;
import com.scau.chenyikui.model.User;

public interface ShopService extends BaseService<Shop> {
	public Shop getShop(String username);
}
