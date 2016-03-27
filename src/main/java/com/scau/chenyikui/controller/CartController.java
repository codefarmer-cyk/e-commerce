package com.scau.chenyikui.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.scau.chenyikui.model.Item;
import com.scau.chenyikui.model.Order;
import com.scau.chenyikui.model.SubOrder;
import com.scau.chenyikui.model.User;
import com.scau.chenyikui.service.ItemService;
import com.scau.chenyikui.service.OrderService;
import com.scau.chenyikui.service.UserService;
import com.scau.chenyikui.aop.ControllerAdvice;

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
		// Map buyList = new HashMap<Item, Integer>();
		Order order = new Order();
		for (Cookie cookie : cookies) {
			String name = cookie.getName().trim();
			if (name.startsWith("item_")) {
				Item item = itemService.get(Integer.valueOf(name.substring("item_".length())));
				SubOrder subOrder = new SubOrder();
				subOrder.setItem(item);
				subOrder.setAmount(Integer.valueOf(cookie.getValue().trim()));
				subOrder.setStatus("STATUS_COMMITED");
				order.getSubOrders().add(subOrder);
			}
		}
		model.addAttribute("order", order);
		User user = userService.get(ControllerAdvice.getPrincipal());
		model.addAttribute("user", user);
		return "cart";
	}

	@RequestMapping(value = "/order")
	public String order(@ModelAttribute("order") Order order, Model model, HttpServletRequest request,
			HttpServletResponse response) {
		User user = userService.get(ControllerAdvice.getPrincipal());
		order.setUser(user);
		order.setDate(new Date());
		order.setStatus("STATUS_COMMITED");
		double sum = 0;
		for (SubOrder subOrder : order.getSubOrders()) {
			sum += subOrder.getItem().getPrice() * subOrder.getAmount();
			subOrder.setOrder(order);
		}

		Cookie[] cookies = request.getCookies();
		for (Cookie cookie : cookies) {
			String name = cookie.getName().trim();
			if (name.startsWith("item_")) {
				Item item = itemService.get(Integer.valueOf(name.substring("item_".length())));
				item.setSale(item.getSale() + Integer.valueOf(cookie.getValue().trim()));
				item.setStock(item.getStock() - Integer.valueOf(cookie.getValue().trim()));
				itemService.save(item);
				sum += item.getPrice() * Integer.valueOf(cookie.getValue().trim());
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
		}
		order.setCost(sum);
		orderService.save(order);
		model.addAttribute("msg", "提交订单成功");
		model.addAttribute("url", "./");
		return "msg";
	}
}
