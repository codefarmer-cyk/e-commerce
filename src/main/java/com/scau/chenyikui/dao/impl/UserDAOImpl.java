package com.scau.chenyikui.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.scau.chenyikui.dao.UserDAO;
import com.scau.chenyikui.model.User;

@Repository
public class UserDAOImpl extends BaseDAOImpl<String, User> implements UserDAO {

	@SuppressWarnings("unchecked")
	@Override
	public List<User> getUsers() {
		return sessionFactory.getCurrentSession().createQuery("from User").list();
	}

}
