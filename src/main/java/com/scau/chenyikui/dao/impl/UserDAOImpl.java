package com.scau.chenyikui.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.scau.chenyikui.dao.UserDAO;
import com.scau.chenyikui.model.Item;
import com.scau.chenyikui.model.User;

@Repository
public class UserDAOImpl extends BaseDAOImpl<User> implements UserDAO {

	@SuppressWarnings("unchecked")
	@Override
	public List<User> getUsers() {
		return sessionFactory.getCurrentSession().createQuery("from User").list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Item> getCollecions(User user) {
		return sessionFactory.getCurrentSession()
				.createQuery("select item from User user  inner join user.collections item where user=:user")
				.setParameter("user", user).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<String> getAddress(User user) {
		return sessionFactory.getCurrentSession()
				.createQuery("select address from User user inner join user.addresses address where user=:user")
				.setParameter("user", user).list();
	}

}
