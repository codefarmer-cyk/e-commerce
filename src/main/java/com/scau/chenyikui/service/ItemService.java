package com.scau.chenyikui.service;

import java.util.List;

import com.scau.chenyikui.model.Item;

public interface ItemService extends BaseService<Item> {
	List<Item> getItems();
}
