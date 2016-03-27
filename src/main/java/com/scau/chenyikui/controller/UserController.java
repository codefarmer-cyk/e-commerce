package com.scau.chenyikui.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.scau.chenyikui.aop.ControllerAdvice;
import com.scau.chenyikui.model.Item;
import com.scau.chenyikui.model.Order;
import com.scau.chenyikui.model.Review;
import com.scau.chenyikui.model.SubOrder;
import com.scau.chenyikui.model.User;
import com.scau.chenyikui.service.ItemService;
import com.scau.chenyikui.service.OrderService;
import com.scau.chenyikui.service.ReviewServie;
import com.scau.chenyikui.service.SubOrderService;
import com.scau.chenyikui.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	@Autowired
	private OrderService orderService;

	@Autowired
	private ReviewServie reviewService;

	@Autowired
	private ItemService itemService;

	@Autowired
	private SubOrderService subOrderService;

	@RequestMapping(value = "/user")
	public String userInfo(Model model) {
		User user = userService.get(ControllerAdvice.getPrincipal());
		model.addAttribute("user", user);
		model.addAttribute("itemCollection", userService.getItemCollecion(user));
		model.addAttribute("shopCollection", userService.getShopCollecion(user));
		model.addAttribute("orders", orderService.getOrders(user));
		model.addAttribute("addresses", userService.getAddress(user));
		model.addAttribute("newReview", new Review());
		return "user";
	}

	@RequestMapping(value = "/newAddress", method = RequestMethod.POST)
	public String newAddress(String username, String address) {
		User user = userService.get(username);
		Set<String> addresses = new HashSet<String>(userService.getAddress(user));
		addresses.add(address);
		user.setAddresses(addresses);
		userService.save(user);
		return "redirect:/user?userId=" + user.getUsername();
	}

	@RequestMapping(value = "/updateUser", method = RequestMethod.POST)
	public String updateUser(String username, String email, String phone, MultipartFile avatar,
			HttpServletRequest request) {
		User user = userService.get(username);
		if (!avatar.isEmpty()) {
			String avatarName = avatar.getOriginalFilename();
			File avatarFile = new File(request.getRealPath("/resources/img/avatar"), avatarName);
			try {
				avatar.transferTo(avatarFile);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			user.setAvatar(avatarName);
		}
		user.setEmail(email);
		user.setPhone(phone);
		// user.setAddresses(new HashSet<String>(userService.getAddress(user)));
		// user.setItemCollection(new
		// HashSet<Item>(userService.getCollecions(user)));
		// user.setShopCollection(new
		// HashSet<Item>(userService.getCollecions(user)));
		userService.save(user);
		return "redirect:/user?userId=" + user.getUsername();
	}

	@RequestMapping(value = "/updatePassword", method = RequestMethod.POST)
	public String updatePassword(String password, String newPassword, String username, Model model) {
		User user = userService.get(username);
		Md5PasswordEncoder md5 = new Md5PasswordEncoder();
		String md5Password = md5.encodePassword(password, "");
		if (user.getPassword().equals(md5Password)) {
			user.setPassword(md5.encodePassword(newPassword, ""));
			model.addAttribute("msg", "修改密码成功");
			userService.save(user);
		} else {
			model.addAttribute("msg", "修改密码失败");
		}
		model.addAttribute("url", "../user?userId=" + username);
		return "msg";
	}

	@RequestMapping(value = "/addReview", method = RequestMethod.POST)
	public String addReview(@ModelAttribute("newReview") Review newReview, int subOrderId) {
		SubOrder subOrder = subOrderService.get(subOrderId);
		subOrder.setStatus("STATUS_COMMENTED");
		subOrderService.save(subOrder);
		newReview.setDate(new Date());
		int star = 0;
		int num = 0;
		Item item = itemService.get(newReview.getItem().getId());
		reviewService.save(newReview);
		List<Review> reviews = reviewService.getReviews(item);
		for (Review review : reviews) {
			star += review.getScore();
			num++;
		}
		if (num > 0)
			star /= num;
		item.setScore(star);
		itemService.save(item);
		return "redirect:/user";
	}

	@RequestMapping(value = "/user/cancelOrder", method = RequestMethod.POST)
	public void cancelOrder(int orderId, HttpServletResponse response) {
		Order order = orderService.get(orderId);
		order.setStatus("STATUS_CANCELLED");
		for (SubOrder subOrder : order.getSubOrders()) {
			subOrder.setStatus("STATUS_CANCELLED");
		}
		orderService.save(order);
		try {
			response.setContentType("application/json");
			PrintWriter out = response.getWriter();
			out.write("{\"result\":\"success\"}");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/user/finishOrder", method = RequestMethod.POST)
	public void finishOrder(int orderId, HttpServletResponse response) {
		Order order = orderService.get(orderId);
		order.setStatus("STATUS_FINISHED");
		for (SubOrder subOrder : order.getSubOrders()) {
			subOrder.setStatus("STATUS_FINISHED");
		}
		orderService.save(order);
		try {
			response.setContentType("application/json");
			PrintWriter out = response.getWriter();
			out.write("{\"result\":\"success\"}");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
