package com.scau.chenyikui.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashSet;
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
import com.scau.chenyikui.model.User;
import com.scau.chenyikui.service.OrderService;
import com.scau.chenyikui.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	@Autowired
	private OrderService orderService;

	@RequestMapping(value = "/user")
	public String userInfo(Model model) {
		User user = userService.get(ControllerAdvice.getPrincipal());
		model.addAttribute("user", user);
		model.addAttribute("collections", userService.getCollecions(user));
		model.addAttribute("orders", orderService.getOrders(user));
		model.addAttribute("addresses", userService.getAddress(user));
		return "user";
	}

	@RequestMapping(value = "/user/newAddress", method = RequestMethod.POST)
	public String newAddress(String username, String address) {
		User user = userService.get(username);
		Set<String> addresses = new HashSet<String>(userService.getAddress(user));
		addresses.add(address);
		user.setAddresses(addresses);
		userService.save(user);
		return "redirect:/user?userId=" + user.getUsername();
	}

	@RequestMapping(value = "/user/updateUser", method = RequestMethod.POST)
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
		user.setAddresses(new HashSet<String>(userService.getAddress(user)));
		user.setCollections(new HashSet<Item>(userService.getCollecions(user)));
		userService.save(user);
		return "redirect:/user?userId=" + user.getUsername();
	}

	@RequestMapping(value = "/user/updatePassword", method = RequestMethod.POST)
	public String updatePassword(String password, String newPassword, String username, Model model) {
		User user = userService.get(username);
		Md5PasswordEncoder md5 = new Md5PasswordEncoder();
		System.out.println(password + "," + newPassword);
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

}
