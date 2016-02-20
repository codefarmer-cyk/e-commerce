package com.scau.chenyikui.dao;

import java.util.List;

import com.scau.chenyikui.model.Item;

public interface ItemDAO extends BaseDAO<Integer, Item> {
	List<Item> getItems();
}
