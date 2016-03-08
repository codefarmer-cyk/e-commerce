package com.scau.chenyikui.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.scau.chenyikui.dao.ItemDAO;
import com.scau.chenyikui.model.Category;
import com.scau.chenyikui.model.Item;

@Repository
public class ItemDAOImpl extends BaseDAOImpl<Item> implements ItemDAO {

	@SuppressWarnings("unchecked")
	@Override
	public List<Item> getItems() {
		return sessionFactory.getCurrentSession().createQuery("from Item").list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Item> getItemsOrderByDate(boolean asc, Category category) {
		List<Item> result = null;
		if (asc) {
			result = sessionFactory.getCurrentSession()
					.createQuery("from Item item where item.category=:category order by item.date")
					.setParameter("category", category).list();
		} else {
			result = sessionFactory.getCurrentSession()
					.createQuery("from Item item where item.category=:category order by item.date desc")
					.setParameter("category", category).list();
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Item> getItemsOrderByScore(boolean asc, Category category) {
		List<Item> result = null;
		if (asc) {
			result = sessionFactory.getCurrentSession()
					.createQuery("from Item item where item.category=:category order by item.score")
					.setParameter("category", category).list();
		} else {
			result = sessionFactory.getCurrentSession()
					.createQuery("from Item item where item.category=:category order by item.score desc")
					.setParameter("category", category).list();
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Item> getItemsOrderByPrice(boolean asc, Category category) {
		List<Item> result = null;
		if (asc) {
			result = sessionFactory.getCurrentSession()
					.createQuery("from Item item where item.category=:category order by item.price")
					.setParameter("category", category).list();
		} else {
			result = sessionFactory.getCurrentSession()
					.createQuery("from Item item where item.category=:category order by item.price desc")
					.setParameter("category", category).list();
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Item> getItemsOrderBySale(boolean asc, Category category) {
		List<Item> result = null;
		if (asc) {
			result = sessionFactory.getCurrentSession()
					.createQuery("from Item item where item.category=:category order by item.sale")
					.setParameter("category", category).list();
		} else {
			result = sessionFactory.getCurrentSession()
					.createQuery("from Item item where item.category=:category order by item.sale desc")
					.setParameter("category", category).list();
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Item> getItems(boolean asc, String order) {
		List<Item> result = null;
		if (asc) {
			result = sessionFactory.getCurrentSession().createQuery("from Item item order by item." + order).list();
		} else {
			result = sessionFactory.getCurrentSession().createQuery("from Item item order by item." + order + " desc")
					.list();
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Item> getItems(String search) {
		return sessionFactory.getCurrentSession().createQuery("from Item item where item.name like '%" + search + "%'")
				.list();
	}

}
