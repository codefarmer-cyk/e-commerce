package com.scau.chenyikui.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.scau.chenyikui.dao.ShopDAO;
import com.scau.chenyikui.dao.impl.BaseDAOImpl;
import com.scau.chenyikui.model.Shop;
import com.scau.chenyikui.model.User;
import com.scau.chenyikui.service.ShopService;

@Service
public class ShopServiceImpl extends BaseServiceImpl<Shop> implements ShopService {

	@Autowired
	private ShopDAO shopDAO;

	@Autowired
	public ShopServiceImpl(BaseDAOImpl<Shop> baseDAO) {
		super(baseDAO);
	}

	@Transactional(readOnly = true)
	@Override
	public Shop getShop(String username) {
		return shopDAO.getShop(username);
	}

}
