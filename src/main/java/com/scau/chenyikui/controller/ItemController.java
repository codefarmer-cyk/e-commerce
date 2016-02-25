package com.scau.chenyikui.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.scau.chenyikui.aop.ControllerAdvice;
import com.scau.chenyikui.model.Item;
import com.scau.chenyikui.model.User;
import com.scau.chenyikui.service.ItemService;
import com.scau.chenyikui.service.UserService;

@Controller
public class ItemController {
	@Autowired
	private ItemService itemService;

	@Autowired
	private UserService userService;

	@RequestMapping(value = "/item", method = RequestMethod.GET)
	public String ItemInfo(int item_id, Model model) {
		Item item = itemService.get(item_id);
		User user = userService.get(ControllerAdvice.getPrincipal());
		model.addAttribute("user", user);
		model.addAttribute("item", item);
		return "item";
	}
}
