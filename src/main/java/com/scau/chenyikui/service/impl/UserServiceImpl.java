package com.scau.chenyikui.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.scau.chenyikui.dao.UserDAO;
import com.scau.chenyikui.dao.impl.BaseDAOImpl;
import com.scau.chenyikui.model.Item;
import com.scau.chenyikui.model.Shop;
import com.scau.chenyikui.model.User;
import com.scau.chenyikui.service.UserService;

@Service
public class UserServiceImpl extends BaseServiceImpl<User> implements UserService {

	@Autowired
	public UserServiceImpl(BaseDAOImpl<User> baseDAO) {
		super(baseDAO);
	}

	@Autowired
	private UserDAO userDAO;

	@Transactional(readOnly = true)
	@Override
	public List<User> getUsers() {
		return userDAO.getUsers();
	}

	@Transactional(readOnly = true)
	@Override
	public List<Item> getItemCollecion(User user) {
		return userDAO.getItemCollecion(user);
	}

	@Transactional(readOnly = true)
	@Override
	public List<Shop> getShopCollecion(User user) {
		return userDAO.getShopCollecion(user);
	}

	@Transactional(readOnly = true)
	@Override
	public List<String> getAddress(User user) {
		return userDAO.getAddress(user);
	}

}
