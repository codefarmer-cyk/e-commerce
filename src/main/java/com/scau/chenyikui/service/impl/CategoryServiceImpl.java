package com.scau.chenyikui.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.scau.chenyikui.dao.CategoryDAO;
import com.scau.chenyikui.dao.impl.BaseDAOImpl;
import com.scau.chenyikui.model.Category;
import com.scau.chenyikui.service.CategoryService;

@Service
public class CategoryServiceImpl extends BaseServiceImpl<Integer, Category> implements CategoryService {

	@Autowired
	public CategoryServiceImpl(BaseDAOImpl<Integer, Category> baseDAO) {
		super(baseDAO);
	}

	@Autowired
	private CategoryDAO categoryDAO;

	@Transactional(readOnly = true)
	@Override
	public List<Category> getCategories() {
		return categoryDAO.getCategories();
	}

}
