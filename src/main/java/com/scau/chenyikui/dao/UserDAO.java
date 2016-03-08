package com.scau.chenyikui.dao;

import java.util.List;

import com.scau.chenyikui.model.Item;
import com.scau.chenyikui.model.User;

public interface UserDAO extends BaseDAO<User> {
	List<User> getUsers();

	List<Item> getCollecions(User user);

	List<String> getAddress(User user);
}
