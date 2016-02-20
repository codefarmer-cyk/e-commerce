package com.scau.chenyikui.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.scau.chenyikui.model.Item;
import com.scau.chenyikui.model.Order;
import com.scau.chenyikui.model.User;
import com.scau.chenyikui.service.ItemService;
import com.scau.chenyikui.service.OrderService;
import com.scau.chenyikui.service.UserService;
import com.scau.chenyikui.aop.ControllerAdvice;
import com.scau.chenyikui.controller.HomeController;

@Controller
public class CartController {

	@Autowired
	private ItemService itemService;

	@Autowired
	private OrderService orderService;

	@Autowired
	private UserService userService;

	@RequestMapping(value = "/cart")
	public String cart(Model model, HttpServletRequest request) {
		Cookie[] cookies = request.getCookies();
		Map buyList = new HashMap<Item, Integer>();
		for (Cookie cookie : cookies) {
			String name = cookie.getName().trim();
			if (name.startsWith("item_")) {
				Item item = itemService.get(Integer.valueOf(name.substring("item_".length())));
				buyList.put(item, Integer.valueOf(cookie.getValue().trim()));
			}
		}
		model.addAttribute("buyList", buyList);
		return "cart";
	}

	@RequestMapping(value = "/order")
	public String order(Model model, HttpServletRequest request, HttpServletResponse response) {
		Order order = new Order();
		User user = userService.get(ControllerAdvice.getPrincipal());
		order.setUser(user);
		order.setDate(new Date());
		order.setStatus("paied");
		Cookie[] cookies = request.getCookies();
		for (Cookie cookie : cookies) {
			String name = cookie.getName().trim();
			if (name.startsWith("item_")) {
				Item item = itemService.get(Integer.valueOf(name.substring("item_".length())));
				order.getItems_amount().put(item, Integer.valueOf(cookie.getValue().trim()));
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
		}
		orderService.save(order);
		model.addAttribute("msg", "提交订单成功！");
		return "order_success";
	}
}