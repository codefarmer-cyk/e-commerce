package com.scau.chenyikui.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.scau.chenyikui.aop.ControllerAdvice;
import com.scau.chenyikui.model.Category;
import com.scau.chenyikui.model.Item;
import com.scau.chenyikui.model.Order;
import com.scau.chenyikui.model.User;
import com.scau.chenyikui.service.CategoryService;
import com.scau.chenyikui.service.ItemService;
import com.scau.chenyikui.service.OrderService;
import com.scau.chenyikui.service.UserService;

@Controller
public class AdminController {

	@Autowired
	private UserService userService;

	@Autowired
	private ItemService itemService;

	@Autowired
	private OrderService orderService;

	@Autowired
	private CategoryService categoryService;

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String adminPage(Model model, String page) {
		if (page != null) {
			if (page.equals("userList")) {
				List<User> userList = userService.getUsers();
				model.addAttribute(userList);
			} else if (page.equals("itemList")) {
				List<Item> itemList = itemService.getItems();
				List<Category> categories = categoryService.getCategories();
				model.addAttribute(itemList);
				model.addAttribute("categories", categories);
				model.addAttribute("newItem", new Item());
			} else if (page.equals("orderList")) {
				List<Order> orderList = orderService.getOrders();
				model.addAttribute(orderList);
			} else if (page.equals("categoryList")) {
				List<Category> categoryList = categoryService.getCategories();
				model.addAttribute("newCategory", new Category());
				model.addAttribute(categoryList);
			}
			model.addAttribute("page", page);
		}
		User user = userService.get(ControllerAdvice.getPrincipal());
		model.addAttribute("user", user);
		return "admin";
	}

	@RequestMapping(value = "/admin/newItem", method = RequestMethod.POST)
	public String newItem(@ModelAttribute(value = "newItem") Item item, HttpServletRequest request) {
		List<MultipartFile> images = item.getImages();
		List<String> imageNames = new ArrayList<String>();
		item.setDate(new Date());
		if (null != images && images.size() > 0) {
			for (MultipartFile image : images) {
				String imageName = image.getOriginalFilename();
				imageNames.add(imageName);
				File imageFile = new File(request.getRealPath("/resources/img/items"), imageName);
				try {
					image.transferTo(imageFile);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		item.setImgs(imageNames);
		itemService.save(item);
		return "redirect:/admin?page=itemList";
	}

	@RequestMapping(value = "/admin/newCategory", method = RequestMethod.POST)
	public String newCategory(Model model, @ModelAttribute(value = "newCategory") Category category) {
		categoryService.save(category);
		return "redirect:/admin?page=categoryList";
	}

	@RequestMapping(value = "/admin/toggleUserEnabled", method = RequestMethod.POST)
	public void toggleUserEnabled(String username, Boolean enabled, HttpServletResponse response) {
		User user = userService.get(username);
		user.setEnabled(enabled);
		userService.save(user);
		String result = "{\"result\":\"success\"}";
		PrintWriter out = null;
		response.setContentType("application/json");
		try {
			out = response.getWriter();
			out.write(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/admin/toggleItemEnabled", method = RequestMethod.POST)
	public void toggleItemEnabled(Integer item_id, Boolean enabled, HttpServletResponse response) {
		Item item = itemService.get(item_id);
		item.setEnabled(enabled);
		itemService.save(item);
		String result = "{\"result\":\"success\"}";
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
