package com.scau.chenyikui.service.impl;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.scau.chenyikui.dao.ReviewDAO;
import com.scau.chenyikui.dao.impl.BaseDAOImpl;
import com.scau.chenyikui.model.Item;
import com.scau.chenyikui.model.Review;
import com.scau.chenyikui.model.User;
import com.scau.chenyikui.service.ReviewServie;

@Service
public class ReviewServiceImpl extends BaseServiceImpl<Review> implements ReviewServie {

	@Autowired
	private ReviewDAO reviewDAO;

	@Autowired
	public ReviewServiceImpl(BaseDAOImpl<Review> baseDAO) {
		super(baseDAO);
	}

	@Transactional(readOnly = true)
	@Override
	public List<Review> getReviews(User user) {
		return reviewDAO.getReviews(user);
	}

	@Transactional(readOnly = true)
	@Override
	public List<Review> getReviews(Item item) {
		return reviewDAO.getReviews(item);
	}

}
