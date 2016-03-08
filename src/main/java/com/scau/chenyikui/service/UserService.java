package com.scau.chenyikui.service;

import java.util.List;

import com.scau.chenyikui.model.Item;
import com.scau.chenyikui.model.User;

public interface UserService extends BaseService<User> {
	List<User> getUsers();

	List<Item> getCollecions(User user);

	List<String> getAddress(User user);
}
