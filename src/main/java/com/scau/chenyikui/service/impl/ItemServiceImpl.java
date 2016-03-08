package com.scau.chenyikui.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.scau.chenyikui.dao.BaseDAO;
import com.scau.chenyikui.dao.ItemDAO;
import com.scau.chenyikui.dao.impl.BaseDAOImpl;
import com.scau.chenyikui.model.Category;
import com.scau.chenyikui.model.Item;
import com.scau.chenyikui.service.ItemService;

@Service
public class ItemServiceImpl extends BaseServiceImpl<Item> implements ItemService {

	@Autowired
	public ItemServiceImpl(BaseDAOImpl<Item> baseDAO) {
		super(baseDAO);
	}

	@Autowired
	private ItemDAO itemDAO;

	@Transactional(readOnly = true)
	@Override
	public List<Item> getItems() {
		return itemDAO.getItems();
	}

	@Transactional(readOnly = true)
	@Override
	public List<Item> getItemsOrderByDate(boolean asc, Category category) {
		return itemDAO.getItemsOrderByDate(asc, category);
	}

	@Transactional(readOnly = true)
	@Override
	public List<Item> getItemsOrderByScore(boolean asc, Category category) {
		return itemDAO.getItemsOrderByScore(asc, category);
	}

	@Transactional(readOnly = true)
	@Override
	public List<Item> getItemsOrderByPrice(boolean asc, Category category) {
		return itemDAO.getItemsOrderByPrice(asc, category);
	}

	@Transactional(readOnly = true)
	@Override
	public List<Item> getItemsOrderBySale(boolean asc, Category category) {
		return itemDAO.getItemsOrderBySale(asc, category);
	}

	@Transactional(readOnly = true)
	@Override
	public List<Item> getItems(boolean asc, String order) {
		return itemDAO.getItems(asc, order);
	}

	@Transactional(readOnly = true)
	@Override
	public List<Item> getItems(String search) {
		return itemDAO.getItems(search);
	}

}
