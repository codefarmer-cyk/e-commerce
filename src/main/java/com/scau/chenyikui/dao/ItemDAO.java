package com.scau.chenyikui.dao;

import java.util.List;

import com.scau.chenyikui.model.Item;

public interface ItemDAO extends BaseDAO<Item> {
	List<Item> getItems();
}
