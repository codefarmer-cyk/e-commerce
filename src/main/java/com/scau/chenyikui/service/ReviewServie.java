package com.scau.chenyikui.service;

import java.util.List;

import com.scau.chenyikui.model.Item;
import com.scau.chenyikui.model.Review;
import com.scau.chenyikui.model.User;

public interface ReviewServie extends BaseService<Review> {
	public List<Review> getReviews(User user);

	public List<Review> getReviews(Item item);
}
