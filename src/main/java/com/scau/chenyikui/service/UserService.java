package com.scau.chenyikui.service;

import java.util.List;

import com.scau.chenyikui.model.Item;
import com.scau.chenyikui.model.Shop;
import com.scau.chenyikui.model.User;

public interface UserService extends BaseService<User> {
	List<User> getUsers();

	List<String> getAddress(User user);

	List<Item> getItemCollecion(User user);

	List<Shop> getShopCollecion(User user);
}
