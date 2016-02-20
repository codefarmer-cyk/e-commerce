package com.scau.chenyikui.service;

import java.util.List;

import com.scau.chenyikui.model.User;

public interface UserService extends BaseService<String, User> {
	List<User> getUsers();
}
