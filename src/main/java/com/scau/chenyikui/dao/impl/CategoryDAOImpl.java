package com.scau.chenyikui.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.scau.chenyikui.dao.CategoryDAO;
import com.scau.chenyikui.model.Category;

@Repository
public class CategoryDAOImpl extends BaseDAOImpl<Integer, Category> implements CategoryDAO {

	@SuppressWarnings("unchecked")
	@Override
	public List<Category> getCategories() {
		return sessionFactory.getCurrentSession().createQuery("from Category").list();
	}

}
