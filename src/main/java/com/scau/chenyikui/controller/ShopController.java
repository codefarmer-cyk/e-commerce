package com.scau.chenyikui.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.scau.chenyikui.model.Item;
import com.scau.chenyikui.model.Shop;
import com.scau.chenyikui.service.ShopService;

@Controller
public class ShopController {
	@Autowired
	private ShopService shopService;

	@RequestMapping(value = "/shop", method = RequestMethod.GET)
	public String shop(String shopUsername, Model model) {
		Shop shop = shopService.getShop(shopUsername);
		model.addAttribute("shop", shop);
		ArrayList<Item> topItems = new ArrayList<Item>(shop.getItems());
		Collections.sort(topItems, new Comparator<Item>() {
			@Override
			public int compare(Item o1, Item o2) {
				return o1.getSale() - o2.getSale();
			}
		});
		model.addAttribute("topItems", topItems);
		return "shop";
	}
}
