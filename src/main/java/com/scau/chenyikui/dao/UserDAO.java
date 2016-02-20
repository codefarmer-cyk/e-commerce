package com.scau.chenyikui.dao;

import java.util.List;

import com.scau.chenyikui.model.User;

public interface UserDAO extends BaseDAO<String, User> {
  List<User> getUsers();
}
