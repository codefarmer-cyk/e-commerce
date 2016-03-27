package com.scau.chenyikui.dao;

import java.util.List;

import com.scau.chenyikui.model.Item;
import com.scau.chenyikui.model.Shop;
import com.scau.chenyikui.model.User;

public interface UserDAO extends BaseDAO<User> {
	List<User> getUsers();

	List<Item> getItemCollecion(User user);

	List<Shop> getShopCollecion(User user);

	List<String> getAddress(User user);
}
