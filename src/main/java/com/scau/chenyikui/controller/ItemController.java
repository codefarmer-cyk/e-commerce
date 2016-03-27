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
import com.scau.chenyikui.model.Shop;
import com.scau.chenyikui.model.User;
import com.scau.chenyikui.service.ItemService;
import com.scau.chenyikui.service.ReviewServie;
import com.scau.chenyikui.service.ShopService;
import com.scau.chenyikui.service.UserService;

@Controller
public class ItemController {
	@Autowired
	private ItemService itemService;

	@Autowired
	private UserService userService;

	@Autowired
	private ReviewServie reviewService;

	@Autowired
	private ShopService shopService;

	@RequestMapping(value = "/item", method = RequestMethod.GET)
	public String ItemInfo(int item_id, Model model) {
		Item item = itemService.get(item_id);
		User user = userService.get(ControllerAdvice.getPrincipal());
		model.addAttribute("item", item);
		model.addAttribute("user", user);
		List<Review> reviews = reviewService.getReviews(item);
		model.addAttribute("reviews", reviews);
		if (user != null) {
			model.addAttribute("user", user);
			if (user.getItemCollection().contains(item)) {
				model.addAttribute("itemCollected", true);
			}
			if (user.getShopCollection().contains(item.getShop())) {
				model.addAttribute("shopCollected", true);
			}
		}
		return "item";
	}

	@RequestMapping(value = "/toggleItemCollection", method = RequestMethod.POST)
	public void toggleItemCollection(int item_id, HttpServletResponse response) {
		Item item = itemService.get(item_id);
		User user = userService.get(ControllerAdvice.getPrincipal());
		if (user.getItemCollection().contains(item)) {
			user.getItemCollection().remove(item);
		} else {
			user.getItemCollection().add(item);
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

	@RequestMapping(value = "/toggleShopCollection", method = RequestMethod.POST)
	public void toggleShopCollection(int shop_id, HttpServletResponse response) {
		Shop shop = shopService.get(shop_id);
		User user = userService.get(ControllerAdvice.getPrincipal());
		if (user.getShopCollection().contains(shop)) {
			user.getShopCollection().remove(shop);
		} else {
			user.getShopCollection().add(shop);
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

}
