package com.scau.chenyikui.dao;

import java.util.List;

import com.scau.chenyikui.model.Category;

public interface CategoryDAO extends BaseDAO<Integer, Category> {
	List<Category> getCategories();
}
