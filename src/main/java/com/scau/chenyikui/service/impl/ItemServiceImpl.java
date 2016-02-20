package com.scau.chenyikui.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.scau.chenyikui.dao.BaseDAO;
import com.scau.chenyikui.dao.ItemDAO;
import com.scau.chenyikui.dao.impl.BaseDAOImpl;
import com.scau.chenyikui.model.Item;
import com.scau.chenyikui.service.ItemService;

@Service
public class ItemServiceImpl extends BaseServiceImpl<Integer, Item> implements ItemService {

	@Autowired
	public ItemServiceImpl(BaseDAOImpl<Integer, Item> baseDAO) {
		super(baseDAO);
		System.out.println(baseDAO.getClass().getName());
	}

	@Autowired
	private ItemDAO itemDAO;

	@Transactional(readOnly = true)
	@Override
	public List<Item> getItems() {
		return itemDAO.getItems();
	}

}
