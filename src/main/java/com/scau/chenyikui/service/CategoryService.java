package com.scau.chenyikui.service;

import java.util.List;

import com.scau.chenyikui.model.Category;

public interface CategoryService extends BaseService<Integer, Category> {
	List<Category> getCategories();
}
