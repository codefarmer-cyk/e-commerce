package com.scau.chenyikui.service;

import java.util.List;

import com.scau.chenyikui.model.Category;
import com.scau.chenyikui.model.Item;

public interface ItemService extends BaseService<Item> {
	List<Item> getItems();

	List<Item> getItems(String search);

	List<Item> getItems(boolean asc, String order);

	List<Item> getItemsOrderByDate(boolean asc, Category category);

	List<Item> getItemsOrderByScore(boolean asc, Category category);

	List<Item> getItemsOrderByPrice(boolean desc, Category category);

	List<Item> getItemsOrderBySale(boolean desc, Category category);
}
