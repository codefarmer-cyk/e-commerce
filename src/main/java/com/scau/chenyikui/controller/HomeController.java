package com.scau.chenyikui.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.SortedSet;
import java.util.TreeSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.RandomStringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.scau.chenyikui.aop.ControllerAdvice;
import com.scau.chenyikui.model.Category;
import com.scau.chenyikui.model.Item;
import com.scau.chenyikui.model.Order;
import com.scau.chenyikui.model.Shop;
import com.scau.chenyikui.model.User;
import com.scau.chenyikui.service.CategoryService;
import com.scau.chenyikui.service.ItemService;
import com.scau.chenyikui.service.UserService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private ItemService itemService;

	@Autowired
	private UserService userService;

	@Autowired
	private CategoryService categoryService;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/default", method = RequestMethod.GET)
	public String defaultURL(HttpServletRequest request) {
		String targetUrl = null;
		if (request.isUserInRole("ROLE_ADMIN")) {
			targetUrl = "redirect:/admin";
		} else if (request.isUserInRole("ROLE_BUSINESS")) {
			targetUrl = "redirect:/business";
		} else {
			targetUrl = "redirect:/";
		}
		return targetUrl;
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, String order, Boolean asc, String search) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		List<Item> items = itemService.getItems();
		List<Category> categories = categoryService.getCategories();
		if (asc == null)
			asc = false;
		if (search == null)
			search = "";
		items = itemService.getItems(search);
		if (order != null) {
			items = itemService.getItems(asc, order);
			if (order.equals("score")) {
				for (Category category : categories) {
					category.setItems(new LinkedHashSet<Item>(itemService.getItemsOrderByScore(asc, category)));
				}
			} else if (order.equals("date")) {
				for (Category category : categories) {
					category.setItems(new LinkedHashSet<Item>(itemService.getItemsOrderByDate(asc, category)));
				}
			} else if (order.equals("price")) {
				for (Category category : categories) {
					category.setItems(new LinkedHashSet<Item>(itemService.getItemsOrderByPrice(asc, category)));
				}
			}
		}
		model.addAttribute("order", order);
		model.addAttribute("asc", !asc);
		model.addAttribute("items", items);
		model.addAttribute("categories", categories);

		String formattedDate = dateFormat.format(date);
		User user = userService.get(ControllerAdvice.getPrincipal());
		model.addAttribute("user", user);
		model.addAttribute("serverTime", formattedDate);

		return "home";
	}

	@RequestMapping(value = "/login")
	public String login() {
		return "login";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return "redirect:/login?logout";
	}

	@RequestMapping(value = "/Access_Denied")
	public String accessDenied() {
		return "accessDenied";
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String registerPage(Model model) {
		model.addAttribute("newUser", new User());
		return "register";
	}

	@RequestMapping(value = "/register.do", method = RequestMethod.POST)
	public String registerDo(Model model, User user) {
		String salt = RandomStringUtils.randomAlphanumeric(5);
		if (user.getAuthorities().contains("ROLE_BUSINESS")) {
			user.setShop(new Shop());
		}
		user.setSalt(salt);
		Md5PasswordEncoder md5 = new Md5PasswordEncoder();
		String md5Password = md5.encodePassword(user.getPassword(), "");
		user.setPassword(md5Password);
		user.setDate(new Date());
		user.setAvatar("default_avatar.png");
		userService.save(user);
		model.addAttribute("msg", "注册成功");
		model.addAttribute("url", "./login");
		return "msg";
	}

}
