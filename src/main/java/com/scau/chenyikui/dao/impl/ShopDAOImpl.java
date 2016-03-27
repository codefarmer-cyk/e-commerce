package com.scau.chenyikui.dao.impl;

import org.springframework.stereotype.Repository;

import com.scau.chenyikui.dao.ShopDAO;
import com.scau.chenyikui.model.Shop;

@Repository
public class ShopDAOImpl extends BaseDAOImpl<Shop> implements ShopDAO {

	@Override
	public Shop getShop(String username) {
		return (Shop) sessionFactory.getCurrentSession()
				.createQuery("from Shop shop where shop.user.username=:username").setParameter("username", username)
				.uniqueResult();
	}

}
