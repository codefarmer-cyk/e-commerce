package com.scau.chenyikui.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.scau.chenyikui.aop.ControllerAdvice;
import com.scau.chenyikui.model.Item;
import com.scau.chenyikui.model.Review;
import com.scau.chenyikui.model.User;
import com.scau.chenyikui.service.ItemService;
import com.scau.chenyikui.service.ReviewServie;
import com.scau.chenyikui.service.UserService;

@Controller
public class ItemController {
	@Autowired
	private ItemService itemService;

	@Autowired
	private UserService userService;

	@Autowired
	private ReviewServie reviewService;

	@RequestMapping(value = "/item", method = RequestMethod.GET)
	public String ItemInfo(int item_id, Model model) {
		Item item = itemService.get(item_id);
		User user = userService.get(ControllerAdvice.getPrincipal());
		model.addAttribute("item", item);
		List<Review> reviews = reviewService.getReviews(item);
		int star = 0;
		int num = 0;
		for (Review review : reviews) {
			star += review.getScore();
			num++;
		}
		if (num > 0)
			star /= num;
		model.addAttribute("reviews", reviews);
		model.addAttribute("newReview", new Review());
		model.addAttribute("star", star);
		if (user != null) {
			model.addAttribute("user", user);
			if (user.getCollections().contains(item)) {
				model.addAttribute("collected", true);
			}
		}
		return "item";
	}

	@RequestMapping(value = "/toggleCollection", method = RequestMethod.POST)
	public void toggleCollection(int item_id, HttpServletResponse response) {
		Item item = itemService.get(item_id);
		User user = userService.get(ControllerAdvice.getPrincipal());
		if (user.getCollections().contains(item)) {
			user.getCollections().remove(item);
		} else {
			user.getCollections().add(item);
		}
		userService.save(user);
		String result = "{\"name\":\"" + user.getUsername() + "\"}";
		PrintWriter out = null;
		response.setContentType("application/json");
		try {
			out = response.getWriter();
			out.write(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/addReview", method = RequestMethod.POST)
	public String addReview(@ModelAttribute("newReview") Review newReview) {
		newReview.setDate(new Date());
		int star = 0;
		int num = 0;
		Item item = newReview.getItem();
		List<Review> reviews = reviewService.getReviews(item);
		for (Review review : reviews) {
			star += review.getScore();
			num++;
		}
		if (num > 0)
			star /= num;
		item.setScore(star);
		itemService.save(item);
		reviewService.save(newReview);
		return "redirect:/item?item_id=" + newReview.getItem().getId();
	}
}
