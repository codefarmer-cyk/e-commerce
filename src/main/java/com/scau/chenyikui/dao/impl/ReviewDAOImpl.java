package com.scau.chenyikui.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.scau.chenyikui.dao.ReviewDAO;
import com.scau.chenyikui.model.Item;
import com.scau.chenyikui.model.Review;
import com.scau.chenyikui.model.User;

@Repository
public class ReviewDAOImpl extends BaseDAOImpl<Review> implements ReviewDAO {

	@SuppressWarnings("unchecked")
	@Override
	public List<Review> getReviews(User user) {
		return sessionFactory.getCurrentSession()
				.createQuery("from Review review where review.user.username =:username")
				.setParameter("username", user.getUsername()).list();
	}

	@SuppressWarnings("unchecked")
	public List<Review> getReviews(Item item) {
		return sessionFactory.getCurrentSession().createQuery("from Review review where review.item.id =:itemId")
				.setParameter("itemId", item.getId()).list();
	}

}
