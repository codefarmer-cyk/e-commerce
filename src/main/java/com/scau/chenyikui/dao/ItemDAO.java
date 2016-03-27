package com.scau.chenyikui.dao;

import java.util.List;

import com.scau.chenyikui.model.Category;
import com.scau.chenyikui.model.Item;
import com.scau.chenyikui.model.User;

public interface ItemDAO extends BaseDAO<Item> {
	List<Item> getItems();

	List<Item> getItems(String search);

	List<Item> getItems(User user);

	List<Item> getItems(boolean asc, String order);

	List<Item> getItemsOrderByDate(boolean asc, Category category);

	List<Item> getItemsOrderByScore(boolean asc, Category category);

	List<Item> getItemsOrderByPrice(boolean asc, Category category);

	List<Item> getItemsOrderBySale(boolean asc, Category category);
}
